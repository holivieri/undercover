using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using Undercover.API.Entities;
using Undercover.API.Services;

namespace Undercover.API.Controllers.V1
{
    [Route("api/v1/[controller]")]
    [ApiController]
    public class UserController : ControllerBase
    {
        private readonly IUserService _userService;
        private readonly ILogger<UserController> _logger;

        public UserController(IUserService userService, ILogger<UserController> logger)
        {
            _logger = logger;
            _userService = userService;
        }

        [HttpGet("GetNotifications")]
        [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        public ActionResult<List<Notification>> GetNotifications()
        {
            try
            {
                string userId = HttpContext.User.Claims.Where(x => x.Type == "UserId").FirstOrDefault().Value;

                return Ok(_userService.GetNotifications(userId));
            }
            catch (Exception ex)
            {
                _logger.LogError("Error on Get Notifications", ex);
                return StatusCode(StatusCodes.Status500InternalServerError, "Error getting notifications");
            }
        }

        [HttpPost("DeleteNotification")]
        [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        public ActionResult<Notification> DeleteNotification(Guid notificationId)
        {
            try
            {
                _userService.DeleteNotification(notificationId);
                return Ok();
            }
            catch (Exception ex)
            {
                _logger.LogError("Error on Delete Notification", ex);
                return StatusCode(StatusCodes.Status500InternalServerError, "Error deleting a notification");
            }
        }
        [HttpPost("CreateNotification")]
        [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        public ActionResult<Notification> CreateNotification([FromBody] Notification notification)
        {
            try
            {
                string userId = HttpContext.User.Claims.Where(x => x.Type == "UserId").FirstOrDefault().Value;

                _userService.CreateNotification(notification, userId);
                return Ok();
            }
            catch (Exception ex)
            {
                _logger.LogError("Error on Create Notification", ex);
                return StatusCode(StatusCodes.Status500InternalServerError, "Error creating a notification");
            }
        }

        [HttpPost("SendPushNotification")]
        [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        public ActionResult SendPushNotification([FromBody] string[] emails)
        {
            try
            {
                //TODO Terminar
                return Ok();
            }
            catch (Exception ex)
            {

                throw;
            }
        }
        [HttpGet("GetUser")]
        [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        public ActionResult GetUser()
        {
            try
            {
                string userId = HttpContext.User.Claims.Where(x => x.Type == "UserId").FirstOrDefault().Value;

                var user = _userService.GetUser(userId);

                return Ok(user);
            }
            catch (Exception ex)
            {
                _logger.LogError("Error on Get User", ex);
                return StatusCode(StatusCodes.Status500InternalServerError, "Error on Get User");
            }
            
        }

        [HttpPost("CreateProfile")]
        [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        public ActionResult<bool> CreateProfile(Profile profile)
        {
            try
            {
                string userId = HttpContext.User.Claims.Where(x => x.Type == "UserId").FirstOrDefault().Value;

                return Ok(_userService.CreateProfile(userId, profile));
            }
            catch (Exception ex)
            {
                _logger.LogError("Error on Create Profile", ex);
                return StatusCode(StatusCodes.Status500InternalServerError, "Error on Create Profile. " + ex.Message);
            }
        }

    }
}
