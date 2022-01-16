using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
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

        [HttpPost("AddArtistToUser")]
        public ActionResult AddArtistToUser(Guid ArtistId)
        {
            try
            {
                string userId = "9a9c3f4b-240d-4dde-8d93-c95c52a27f51"; //Local //TODO take this one from
                var user = _userService.GetUser(userId);
                if (user != null)
                {
                    _userService.AddArtist(user, ArtistId);

                    return Ok();
                }
                return BadRequest();
            }
            catch (Exception ex)
            {
                _logger.LogError("Error on AddArtistToUser", ex);
                return StatusCode(StatusCodes.Status500InternalServerError, "Error on AddArtistToUser");
            }
        }

        [HttpPost("RemoveArtistToUser")]
        public ActionResult RemoveArtistToUser(Guid ArtistId)
        {
            try
            {
                string userId = "9a9c3f4b-240d-4dde-8d93-c95c52a27f51"; //Local //TODO take this one from
                var user = _userService.GetUser(userId);
                if (user != null)
                {
                    _userService.RemoveArtist(user, ArtistId);

                    return Ok();
                }
                return BadRequest();
            }
            catch (Exception ex)
            {
                _logger.LogError("Error on RemoveArtistToUser", ex);
                return StatusCode(StatusCodes.Status500InternalServerError, "Error on RemoveArtistToUser");
            }
        }

        [HttpPost("AddPlaceToUser")]
        public ActionResult AddPlaceToUser(Guid PlaceId)
        {
            try
            {
                string userId = "9a9c3f4b-240d-4dde-8d93-c95c52a27f51"; //Local //TODO take this one from
                var user = _userService.GetUser(userId);
                if (user != null)
                {
                    _userService.AddPlace(user, PlaceId);

                    return Ok();
                }
                return BadRequest();
            }
            catch (Exception ex)
            {
                _logger.LogError("Error on AddPlaceToUser", ex);
                return StatusCode(StatusCodes.Status500InternalServerError, "Error on AddPlaceToUser");
            }
        }

        [HttpPost("RemovePlaceToUser")]
        public ActionResult RemovePlaceToUser(Guid PlaceId)
        {
            try
            {
                string userId = "9a9c3f4b-240d-4dde-8d93-c95c52a27f51"; //Local //TODO take this one from
                var user = _userService.GetUser(userId);
                if (user != null)
                {
                    _userService.RemovePlace(user, PlaceId);

                    return Ok();
                }
                return BadRequest();
            }
            catch (Exception ex)
            {
                _logger.LogError("Error on RemovePlaceToUser", ex);
                return StatusCode(StatusCodes.Status500InternalServerError, "Error on RemovePlaceToUser");
            }
        }

        [HttpPost("AddGenreToUser")]
        public ActionResult AddGenreToUser(Guid GenreId)
        {
            try
            {
                string userId = "9a9c3f4b-240d-4dde-8d93-c95c52a27f51"; //Local //TODO take this one from
                var user = _userService.GetUser(userId);
                if (user != null)
                {
                    _userService.AddGenre(user, GenreId);

                    return Ok();
                }
                return BadRequest();
            }
            catch (Exception ex)
            {
                _logger.LogError("Error on AddGenreToUser", ex);
                return StatusCode(StatusCodes.Status500InternalServerError, "Error on AddGenreToUser");
            }
        }

        [HttpPost("RemoveGenreToUser")]
        public ActionResult RemoveGenreToUser(Guid GenreId)
        {
            try
            {
                string userId = "9a9c3f4b-240d-4dde-8d93-c95c52a27f51"; //Local //TODO take this one from
                var user = _userService.GetUser(userId);
                if (user != null)
                {
                    _userService.RemoveGenre(user, GenreId);

                    return Ok();
                }
                return BadRequest();
            }
            catch (Exception ex)
            {
                _logger.LogError("Error on RemoveGenreToUser", ex);
                return StatusCode(StatusCodes.Status500InternalServerError, "Error on RemoveGenreToUser");
            }
        }

        [HttpGet("GetMyArtists")]
        public async Task<ActionResult<List<Artist>>> GetMyArtists()
        {
            try
            {
                // string userId = "9a9c3f4b-240d-4dde-8d93-c95c52a27f51"; //Server //TODO take this one from Token

                string userId = "9a9c3f4b-240d-4dde-8d93-c95c52a27f51"; //Local //TODO take this one from Token


                var result = _userService.GetMyArtist(userId);
                return Ok(result);
            }
            catch (Exception ex)
            {
                _logger.LogError("Error on GetAllArtist", ex);
                return StatusCode(StatusCodes.Status500InternalServerError, "Error getting all artist");
            }
        }


    }
}
