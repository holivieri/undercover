using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using Microsoft.IdentityModel.Tokens;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using Undercover.API.DTOs;
using Undercover.API.Entities;
using Undercover.API.Models;
using Undercover.API.Services;

namespace Undercover.API.Controllers.V1
{
    [Route("api/v1/[controller]")]
    [ApiController]
    public class AuthenticateController : ControllerBase
    {
        private readonly UserManager<User> _userManager;
        private readonly SignInManager<User> _signInManager;
        private readonly IConfiguration _configuration;
        private readonly ILogger _logger;
        private readonly IUserService _userService;

        public AuthenticateController(
            UserManager<User> userManager,
            SignInManager<User> signInManager,
            IConfiguration configuration,
            IUserService userService)
        {
            _userManager = userManager;
            _signInManager = signInManager;
            _configuration = configuration;
            _userService = userService;
        }

        [HttpPost("SignUp")]
        public async Task<ActionResult<AuthenticateResponse>> SignUp([FromBody] UserModel model)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest("Some parameters are missing for signing up");
            }
            


            var user = new User { 
                UserName = model.Email, 
                Email = model.Email, 
            };
            var result = await _userManager.CreateAsync(user, model.Password);
            if (result.Succeeded)
            {
                //asign user to role
                var newUser = await _userManager.FindByEmailAsync(model.Email);
                try
                {
                    await _userManager.AddToRoleAsync(newUser, model.UserRole);
                }
                catch (Exception ex)
                {
                    _logger.LogError("Error assigning user to role.", ex);
                    return BadRequest("Role is not valid");
                }

                return BuildToken(model, user.Id).Result;
            }
            else
            {
                foreach(var error in result.Errors)
                {
                    ModelState.AddModelError("Errors:", error.Description);
                }
                return BadRequest(result.Errors);
            }
        }

        [HttpPost("Login")]
        [ProducesResponseType(200)]
        [ProducesResponseType(400)]
        public async Task<ActionResult<AuthenticateResponse>> Login([FromBody] UserModel UserModel)
        {
            var result = await _signInManager.PasswordSignInAsync(UserModel.Email, UserModel.Password, isPersistent: false, lockoutOnFailure: false);
            if (result.Succeeded)
            {
                var user = await _userManager.FindByEmailAsync(UserModel.Email);
                Device device = new Device
                {
                    LastAccess = DateTime.UtcNow,
                    Platform = UserModel.Platform,
                    Token = UserModel.DeviceToken,
                    UserEmail  = UserModel.Email,
                    UserId = user.Id,
                };
                SaveDeviceInfo(device);

                return BuildToken(UserModel, user.Id).Result;
            }
            else
            {
                return BadRequest("Invalid login attempt.");
            }
        }

        [HttpGet("RefreshToken")]
        [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        public async Task<ActionResult<AuthenticateResponse>> RefreshToken()
        {
            var emailClaim = HttpContext.User.Claims.Where(Claim => Claim.Type == "Email").FirstOrDefault();
            var id = HttpContext.User.Claims.Where(claim => claim.Type == "UserId").FirstOrDefault();

            var email = emailClaim.Value;
            UserModel user = new UserModel() { Email = email };
            
            var userWithRoles = await _userManager.FindByEmailAsync(email);
            var roles = await _userManager.GetRolesAsync(userWithRoles);

            return BuildToken(user, id.Value).Result;

        }

        [HttpPost("AssignRoleToUser")]
        [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        public async Task<ActionResult> AssignRoleToUser([FromBody] EditUserRoleDTO editRoleDTO)
        {
            var user = await _userManager.FindByEmailAsync(editRoleDTO.UserEmail);
            await _userManager.AddClaimAsync(user, new Claim(ClaimTypes.Role, editRoleDTO.RoleName));
            await _userManager.AddToRoleAsync(user, editRoleDTO.RoleName);
            return StatusCode(200, "Role assigned succesfuly");
        }

        [HttpPost("RemoveRoleFromUser")]
        [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        public async Task<ActionResult> RemoveRoleFromUser(EditUserRoleDTO editRoleDTO)
        {
            var user = await _userManager.FindByEmailAsync(editRoleDTO.UserEmail);
            await _userManager.RemoveClaimAsync(user, new Claim(ClaimTypes.Role, editRoleDTO.RoleName));
            await _userManager.RemoveFromRoleAsync(user, editRoleDTO.RoleName);
            return StatusCode(200, "Role removed succesfuly");
        }

        [HttpGet("GetMyRoles")]
        [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        public async Task<ActionResult> GetMyRoles()
        {
            var id = HttpContext.User.Claims.Where(claim => claim.Type == "UserId").FirstOrDefault();
            var userId = id.Value;

            var user = await _userManager.FindByIdAsync(userId);
            var roles = await _userManager.GetRolesAsync(user);
            return Ok(roles);
        }

        private void SaveDeviceInfo(Device device)
        {
            try
            {
                _userService.SaveDevice(device);
            }
            catch (Exception ex)
            {
                _logger.LogError("Error saving Device data.", ex);
            }
        }
        private async Task<AuthenticateResponse> BuildToken(UserModel UserModel, string userId)
        {
            var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_configuration["JWT:key"]));
            var creds = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);
            var expiration = DateTime.UtcNow.AddYears(1);

            var user = await _userManager.FindByIdAsync(userId);
            var roles = await _userManager.GetRolesAsync(user);
            string myRoles = string.Join(",", roles);


            var claims = new List<Claim>()
            {
                new Claim("UserId", userId.ToString()),
                new Claim("Email", UserModel.Email),
                new Claim("Roles", myRoles),
            };

            JwtSecurityToken token = new JwtSecurityToken(
               issuer: "undercover-api",
               audience: null,
               claims: claims,
               expires: expiration,
               signingCredentials: creds
               );

            return new AuthenticateResponse()
            {
                UserId = Guid.Parse(userId),
                UserName = UserModel.Email,
                UserRoles = myRoles,
                Token = new JwtSecurityTokenHandler().WriteToken(token),
                Expiration = expiration,
            };
        }
    }
}
