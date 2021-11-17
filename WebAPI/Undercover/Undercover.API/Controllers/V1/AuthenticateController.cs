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

        public AuthenticateController(
            UserManager<User> userManager,
            SignInManager<User> signInManager,
            IConfiguration configuration)
        {
            _userManager = userManager;
            _signInManager = signInManager;
            _configuration = configuration;
        }

        [HttpPost("SignUp")]
        public async Task<ActionResult<UserToken>> SignUp([FromBody] UserModel model)
        {
            // TODO we have to define the process
            var user = new User { UserName = model.Email, Email = model.Email };
            var result = await _userManager.CreateAsync(user, model.Password);
            if (result.Succeeded)
            {
                return BuildToken(model, new List<string>(), user.Id);
            }
            else
            {
                return BadRequest("This username already exists in our database");
            }
        }

        [HttpPost("Login")]
        [ProducesResponseType(200)]
        [ProducesResponseType(400)]
        public async Task<ActionResult<UserToken>> Login([FromBody] UserModel UserModel)
        {
            var result = await _signInManager.PasswordSignInAsync(UserModel.Email, UserModel.Password, isPersistent: false, lockoutOnFailure: false);
            if (result.Succeeded)
            {
                var user = await _userManager.FindByEmailAsync(UserModel.Email);
                var roles = await _userManager.GetRolesAsync(user);
                return BuildToken(UserModel, roles, user.Id);
            }
            else
            {
                ModelState.AddModelError(string.Empty, "Invalid login attempt.");
                return BadRequest(ModelState);
            }
        }

        [HttpGet("RefreshToken")]
        [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        public async Task<ActionResult<UserToken>> RefreshToken()
        {
            var emailClaim = HttpContext.User.Claims.Where(Claim => Claim.Type == "Email").FirstOrDefault();
            var id = HttpContext.User.Claims.Where(claim => claim.Type == "UserId").FirstOrDefault();

            var email = emailClaim.Value;
            UserModel user = new UserModel() { Email = email };
            
            var userWithRoles = await _userManager.FindByEmailAsync(email);
            var roles = await _userManager.GetRolesAsync(userWithRoles);

            return BuildToken(user, roles, id.Value);

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

        private UserToken BuildToken(UserModel UserModel, IList<string> roles, string Id)
        {
            var claims = new List<Claim>
            {
                new Claim("UserId", Id),
                new Claim("Email", UserModel.Email),
                new Claim(JwtRegisteredClaimNames.UniqueName, UserModel.Email),
                new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString())
            };

            foreach (var role in roles)
            {
                claims.Add(new Claim(ClaimTypes.Role, role));
            }

            var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_configuration["JWT:key"]));
            var creds = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);

            var expiration = DateTime.UtcNow.AddYears(1);

            JwtSecurityToken token = new JwtSecurityToken(
               issuer: null,
               audience: null,
               claims: claims,
               expires: expiration,
               signingCredentials: creds);

            return new UserToken()
            {
                Token = new JwtSecurityTokenHandler().WriteToken(token),
                Expiration = expiration,
                userName = UserModel.Email,
            };
        }
    }
}
