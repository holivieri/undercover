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
    [Route("api/[controller]")]
    [ApiController]
    public class GenreController : ControllerBase
    {
        private readonly ICommonService _commonService;
        private readonly ILogger<GenreController> _logger;

        public GenreController(ICommonService commonService, ILogger<GenreController> logger)
        {
            _commonService = commonService;
            _logger = logger;
        }

        [HttpGet]
        public async Task<ActionResult<List<Genre>>> Get()
        {
            try
            {
                return Ok(_commonService.GetAllGenres());
            }
            catch (Exception ex)
            {
                _logger.LogError("Error on Get all genres", ex);
                return StatusCode(StatusCodes.Status500InternalServerError, "Error getting all genres");
            }
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<List<Genre>>> Get(Guid id)
        {
            try
            {
                var result = _commonService.GetGenre(id);
                if(result == null )
                {
                    _logger.LogWarning("Genre not found", id);
                    return BadRequest("genre_not_found");
                }
                return Ok(result);
            }
            catch (Exception ex)
            {
                _logger.LogError("Error on Get all genres", ex);
                return StatusCode(StatusCodes.Status500InternalServerError, "Error getting a genre");
            }
            
        }

    }
}
