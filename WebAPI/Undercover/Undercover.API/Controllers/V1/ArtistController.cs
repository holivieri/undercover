using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using Undercover.API.Entities;
using Undercover.API.Services;

namespace Undercover.API.Controllers.V1
{
    [Route("api/V1/[controller]")]
    [ApiController]
    public class ArtistController : ControllerBase
    {
        private readonly IArtistService _artistService;
        private readonly ILogger<ArtistController> _logger;

        public ArtistController(IArtistService artistService, ILogger<ArtistController> logger)
        {
            _artistService = artistService;
            _logger = logger;
        }

        /// <summary>
        /// Obtiene todos los artistas
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public async Task<ActionResult<List<Artist>>> Get()
        {
            try
            {
                return Ok(_artistService.GetAllArtist());
            }
            catch (Exception ex)
            {
                _logger.LogError("Error on GetAllArtist", ex);
                return StatusCode(StatusCodes.Status500InternalServerError, "Error getting all artist");
            }
            
        }


        /// <summary>
        /// Obtiene un artista segun su Id
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpGet("{id}")]
        public async Task<ActionResult<List<Artist>>> Get(Guid id)
        {
            try
            {
                var result = _artistService.Get(id);
                if(result == null)
                {
                    _logger.LogWarning("Artist not found", id);
                    return BadRequest("artist_not_found");
                }

                return Ok(result);
            }
            catch (Exception ex)
            {
                _logger.LogError("Error on Get Artist", ex);
                return StatusCode(StatusCodes.Status500InternalServerError, "Error getting an artist");

            }
            
        }
    }
}
