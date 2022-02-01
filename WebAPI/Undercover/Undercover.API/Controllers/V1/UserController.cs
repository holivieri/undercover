using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
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
        public ActionResult<List<Notification>> GetNotifications()
        {

            try
            {
                return Ok(_userService.GetNotifications("9a9c3f4b-240d-4dde-8d93-c95c52a27f51"));
            }
            catch (Exception ex)
            {
                _logger.LogError("Error on Get Notifications", ex);
                return StatusCode(StatusCodes.Status500InternalServerError, "Error getting notifications");
            }
        }

        [HttpPost("DeleteNotification")]
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
        public ActionResult<Notification> CreateNotification([FromBody] Notification notification)
        {
            try
            {
                _userService.CreateNotification(notification, Guid.Parse("9a9c3f4b-240d-4dde-8d93-c95c52a27f51"));
                return Ok();
            }
            catch (Exception ex)
            {
                _logger.LogError("Error on Create Notification", ex);
                return StatusCode(StatusCodes.Status500InternalServerError, "Error creating a notification");
            }
        }

        [HttpPost("SendPushNotification")]
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
        public ActionResult GetUser()
        {
            try
            {
                string userId = "9a9c3f4b-240d-4dde-8d93-c95c52a27f51"; //Server //TODO take this one from Token

                // string userId = "9a9c3f4b-240d-4dde-8d93-c95c52a27f51"; //Local //TODO take this one from Token

                var user = _userService.GetUser(userId);

                return Ok(user);
            }
            catch (Exception ex)
            {
                _logger.LogError("Error on Get User", ex);
                return StatusCode(StatusCodes.Status500InternalServerError, "Error on Get User");
            }
            
        }

        [HttpGet("CheckProfile")]
        public ActionResult<bool> CheckProfile()
        {
            try
            {
                // string userId = "9a9c3f4b-240d-4dde-8d93-c95c52a27f51"; //Server //TODO take this one from Token

                string userId = "9a9c3f4b-240d-4dde-8d93-c95c52a27f51"; //Local //TODO take this one from Token

                return Ok(_userService.CheckProfile(userId));
            }
            catch (Exception ex)
            {
                _logger.LogError("Error on Check Profile", ex);
                return StatusCode(StatusCodes.Status500InternalServerError, "Error on Check Profile");
            }

            
        }

        [HttpPost("CreateProfile")]
        public ActionResult<bool> CreateProfile(Profile profile)
        {
            try
            {
                // string userId = "9a9c3f4b-240d-4dde-8d93-c95c52a27f51"; //Server //TODO take this one from Token

                string userId = "9a9c3f4b-240d-4dde-8d93-c95c52a27f51"; //Local //TODO take this one from Token

                return Ok(_userService.CreateProfile(userId, profile));
            }
            catch (Exception ex)
            {
                _logger.LogError("Error on Create Profile", ex);
                return StatusCode(StatusCodes.Status500InternalServerError, "Error on Create Profile");
            }
        }

    }
}
