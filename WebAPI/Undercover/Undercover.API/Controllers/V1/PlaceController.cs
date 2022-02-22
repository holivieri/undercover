using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using NetTopologySuite;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Undercover.API.Entities;
using Undercover.API.Services;

namespace Undercover.API.Controllers.V1
{
    [Route("api/V1/[controller]")]
    [ApiController]
    public class PlaceController : ControllerBase
    {
        private readonly IPlaceService _placeService;
        private readonly ILogger<PlaceController> _logger;

        public PlaceController(IPlaceService placeService, ILogger<PlaceController> logger)
        {
            _placeService = placeService;
            _logger = logger;

        }

        [HttpGet]
        [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        public async Task<ActionResult<List<Place>>> Get()
        {
            try
            {
                return Ok(_placeService.GetAllPlaces());
            }
            catch (Exception ex)
            {
                _logger.LogError("Error on Get all places", ex);
                return StatusCode(StatusCodes.Status500InternalServerError, "Error getting all places");
            }
        }


        [HttpGet("GetByCity")]
        [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        public async Task<ActionResult> GetByCity(double Latitude, double Longitude, double distance = 25000)
        {
            try
            {
                var geometryFactory = NtsGeometryServices.Instance.CreateGeometryFactory(srid: 4326);

                var result = _placeService.GetAllPlaces(geometryFactory.CreatePoint(new NetTopologySuite.Geometries.Coordinate(Longitude, Latitude)), distance);


                return Ok(result);
            }
            catch (Exception ex)
            {
                _logger.LogError("Error on Get by City", ex);
                return StatusCode(StatusCodes.Status500InternalServerError, "Error getting places by city");
            }
        }


        [HttpGet("{id}")]
        [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        public async Task<ActionResult<List<Place>>> Get(Guid id)
        {
            try
            {
                var result = _placeService.Get(id);
                if(result == null)
                {
                    _logger.LogWarning("Place not found", id);
                    return BadRequest("place_not_found");
                }
                return Ok(result);
            }
            catch (Exception ex)
            {
                _logger.LogError("Error on Get a place", ex);
                return StatusCode(StatusCodes.Status500InternalServerError, "Error getting a place");
            }
        }

    }
}
