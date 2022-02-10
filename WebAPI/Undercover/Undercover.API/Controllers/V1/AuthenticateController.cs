using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using Microsoft.IdentityModel.Tokens;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.IdentityModel.Tokens.Jwt;
using System.IO;
using System.Linq;
using System.Net;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using Undercover.API.DTOs;
using Undercover.API.Entities;
using Undercover.API.Models;
using Undercover.API.Services;
using static Google.Apis.Auth.GoogleJsonWebSignature;

namespace Undercover.API.Controllers.V1
{
    [Route("api/v1/[controller]")]
    [ApiController]
    public class AuthenticateController : ControllerBase
    {
        private readonly UserManager<User> _userManager;
        private readonly SignInManager<User> _signInManager;
        private readonly IConfiguration _configuration;
        private readonly ILogger<AuthenticateController> _logger;
        private readonly IUserService _userService;

        public AuthenticateController(
            UserManager<User> userManager,
            SignInManager<User> signInManager,
            IConfiguration configuration,
            IUserService userService,
            ILogger<AuthenticateController> logger
            )
        {
            _userManager = userManager;
            _signInManager = signInManager;
            _configuration = configuration;
            _userService = userService;
            _logger = logger;
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
                UserProfile = _userService.CheckProfile(user.Id),
                Token = new JwtSecurityTokenHandler().WriteToken(token),
                Expiration = expiration,
            };
        }


        #region Social Login


        [HttpPost("auth/google")]
        [ProducesDefaultResponseType]
        public async Task<ActionResult<AuthenticateResponse>> GoogleLogin(string googleTokenId, string platform, string deviceToken)
        {
            Payload payload = new Payload();
            try
            {
                payload = await ValidateAsync(googleTokenId, new ValidationSettings
                {
                    Audience = new[] { _configuration["Google:WebClient"], _configuration["Google:AndroidApiKey"], _configuration["Google:IOSApiKey"]}
                });
            }
            catch(Exception ex)
            {
                _logger.LogError("Failed add a user linked to a login.", ex);
                return BadRequest();
            }

            var user = await GetOrCreateExternalLoginUser("google", payload.Subject, payload.Email, payload.GivenName, payload.FamilyName);
            Device device = new Device
            {
                LastAccess = DateTime.UtcNow,
                Platform = platform,
                Token = deviceToken,
                UserEmail = user.Email,
                UserId = user.Id,
            };
            SaveDeviceInfo(device);
            UserModel userModel = new UserModel
            {
                Email = user.Email,
                Platform = platform,
                DeviceToken = deviceToken,
                UserRole = _userService.CheckProfile(user.Id),
            };
            return BuildToken(userModel, user.Id).Result;
        }

        [HttpPost("auth/facebook")]
        [ProducesDefaultResponseType]
        public async Task<ActionResult<AuthenticateResponse>> FacebookLogin(string facebookTokenId, string platform, string deviceToken)
        {
            try
            {
                if (string.IsNullOrEmpty(facebookTokenId))
                {
                    throw new ValidationException("Invalid Facebook token");
                }

                string facebookGraphUrl = "https://graph.facebook.com/me?fields=first_name,last_name,email,picture&access_token=" + facebookTokenId; // + " &access_token=937170850506670|8caa7a8193147b668ec2749d7c794be8";

                WebRequest request = WebRequest.Create(facebookGraphUrl);
                request.Credentials = CredentialCache.DefaultCredentials;

                using (WebResponse response = await request.GetResponseAsync())
                {
                    var status = ((HttpWebResponse)response).StatusCode;

                    Stream dataStream = response.GetResponseStream();

                    StreamReader reader = new StreamReader(dataStream);
                    string responseFromServer = reader.ReadToEnd();

                    var facebookUser = JsonConvert.DeserializeObject<FacebookResponse>(responseFromServer);

                    bool valid = facebookUser != null && !string.IsNullOrWhiteSpace(facebookUser.Email);
                    if (!valid)
                    {
                        throw new ValidationException("Invalid Facebook token");
                    }

                    var user = await GetOrCreateExternalLoginUser("facebook", facebookUser.Id, facebookUser.Email, facebookUser.FirstName, facebookUser.LastName);
                    Device device = new Device
                    {
                        LastAccess = DateTime.UtcNow,
                        Platform = platform,
                        Token = deviceToken,
                        UserEmail = user.Email,
                        UserId = user.Id,
                    };
                    SaveDeviceInfo(device);

                    UserModel userModel = new UserModel
                    {
                        Email = user.Email,
                        DeviceToken = deviceToken,
                        Platform = platform,
                        UserRole = _userService.CheckProfile(user.Id),
                    };
                    return BuildToken(userModel, user.Id).Result;
                }
            }
            catch (Exception ex)
            {
                _logger.LogError("Failed add a user linked to a login.", ex);
                return BadRequest();
            }
        }


        private async Task<User> GetOrCreateExternalLoginUser(string provider, string key, string email, string firstName, string lastName)
        {
            // Login already linked to a user
            var user = await _userManager.FindByLoginAsync(provider, key);
            if (user != null)
                return user;

            user = await _userManager.FindByEmailAsync(email);
            if (user == null)
            {
                // No user exists with this email address, we create a new one
                user = new User
                {
                    Email = email,
                    UserName = email,
                    FirstName = firstName,
                    LastName = lastName,
                };

                await _userManager.CreateAsync(user);
            }

            // Link the user to this login
            var info = new UserLoginInfo(provider, key, provider.ToUpperInvariant());
            var result = await _userManager.AddLoginAsync(user, info);
            if (result.Succeeded)
                return user;

            _logger.LogError("Failed add a user linked to a login.");
            _logger.LogError(string.Join(Environment.NewLine, result.Errors.Select(e => e.Description)));
            return null;
        }

        #endregion

    }
}
