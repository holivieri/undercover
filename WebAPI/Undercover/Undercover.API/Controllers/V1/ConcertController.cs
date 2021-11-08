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
    [Route("api/V1/[controller]")]
    [ApiController]
    public class ConcertController : ControllerBase
    {
        private readonly IPlaceService _placeService;
        private readonly IConcertService _concertService;
        private readonly ILogger<ConcertController> _logger;

        public ConcertController(IPlaceService placeService, 
            IConcertService concertService, 
            ILogger<ConcertController> logger)
        {
            _placeService = placeService;
            _concertService = concertService;
            _logger = logger;
        }


        [HttpGet("{id}")]
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



        [HttpGet(Name = "GetNextConcerts")]
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

        [HttpGet( "{city}", Name = "GetNextConcertsByCity")]
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

    }
}
