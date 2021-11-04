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
    public class CountryController : ControllerBase
    {
        private readonly ICommonService _commonService;
        private readonly ILogger<CountryController> _logger;

        public CountryController(ICommonService commonService, ILogger<CountryController> logger)
        {
            _commonService = commonService;
            _logger = logger;
        }

        [HttpGet]
        public async Task<ActionResult<List<Country>>> Get()
        {
            try
            {
                return Ok(_commonService.GetAllCountries());
            }
            catch (Exception ex )
            {
                _logger.LogError("Error on Get All Countries", ex);
                return StatusCode(StatusCodes.Status500InternalServerError, "Error getting all countries");
            }
           
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<Country>> Get(Guid id)
        {
            try
            {
                var result = _commonService.GetCountry(id);

                if (result == null)
                {
                    _logger.LogWarning("There is no country", id);
                    return BadRequest("No existe ningun pais con ese codigo");
                }

                return Ok(result);
            }
            catch (Exception ex)
            {
                _logger.LogError("Error on Get Country", ex);
                return StatusCode(StatusCodes.Status500InternalServerError, "Error getting a country");
            }
        }

    }
}
