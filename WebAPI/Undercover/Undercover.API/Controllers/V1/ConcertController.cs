using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Undercover.API.Entities;
using Undercover.API.Services;

namespace Undercover.API.Controllers.V1
{
    [Route("api/V1/[controller]")]
    [ApiController]
    public class ConcertController : ControllerBase
    {
        private readonly IConcertService _concertService;
        private readonly ILogger<ConcertController> _logger;

        public ConcertController(IConcertService concertService, 
            ILogger<ConcertController> logger)
        {
            _concertService = concertService;
            _logger = logger;
        }


        [HttpGet("{id}")]
        [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        public async Task<ActionResult<List<Concert>>> Get(Guid id)
        {
            try
            {
                var result = _concertService.Get(id);
                if(result == null)
                {
                    _logger.LogWarning("Artist not found", id);
                    return BadRequest("concert_not_found");
                }
                return Ok(result);
            }
            catch (Exception ex)
            {
                _logger.LogError("Error getting a concert", ex);
                return StatusCode(StatusCodes.Status500InternalServerError, "Error getting a concert");
            }
        }


        
        [HttpGet("GetNextConcerts")]
        [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        public async Task<ActionResult<List<Concert>>> GetNextConcerts()
        {
            try
            {
                return Ok(_concertService.GetNextConcerts());
            }
            catch (Exception ex)
            {
                _logger.LogError("Error getting Next Concerts", ex);
                return StatusCode(StatusCodes.Status500InternalServerError, "Error getting next concerts");
            }
        }

        [HttpGet("GetNextConcertsByCity/{city}")]
        [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        public async Task<ActionResult<List<Concert>>> GetNextConcertsByCity(string city)
        {
            try
            {
                return Ok(_concertService.GetNextConcerts(city));
            }
            catch (Exception ex)
            {
                _logger.LogError("Error getting Next Concerts", ex);
                return StatusCode(StatusCodes.Status500InternalServerError, "Error getting next concerts by city");
            }
        }

        [HttpPost("SetAssistance")]
        [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        public ActionResult SetAssistance(Guid concertId, bool attendance)
        {
            try
            {
                string userId = HttpContext.User.Claims.Where(x => x.Type == "UserId").FirstOrDefault().Value;
                
                var result = _concertService.SetAssistance(concertId, userId, attendance);

                return Ok(attendance);
            }
            catch (Exception ex)
            {
                _logger.LogError("Error setting assistance", ex);
                return StatusCode(StatusCodes.Status500InternalServerError, "Error setting assistance");
            }
        }

        [HttpGet("CheckUserAttendance")]
        [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        public ActionResult<bool> CheckUserAttendance(Guid concertId)
        {
            try
            {
                string userId = HttpContext.User.Claims.Where(x => x.Type == "UserId").FirstOrDefault().Value;

                return Ok(_concertService.CheckUserAttendance(userId, concertId));
            }
            catch (Exception ex)
            {
                _logger.LogError("Error checking assistance", ex);
                return StatusCode(StatusCodes.Status500InternalServerError, "Error checking assistance");
            }
            
        }

    }
}
