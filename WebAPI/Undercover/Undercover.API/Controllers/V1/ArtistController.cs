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
    public class ArtistController : ControllerBase
    {
        private readonly IArtistService _artistService;
        private readonly ILogger<ArtistController> _logger;
        private readonly ITwitterService _twitterService;
        private readonly IYoutubeService _youtubeService;


        public ArtistController(IArtistService artistService, ILogger<ArtistController> logger, ITwitterService twitterService, IYoutubeService youtubeService)
        {
            _artistService = artistService;
            _logger = logger;
            _twitterService = twitterService;
            _youtubeService = youtubeService;
        }

        /// <summary>
        /// Obtiene todos los artistas
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        public async Task<ActionResult<List<Artist>>> Get()
        {
            try
            {
                var result =  _artistService.GetAllArtist();
                return Ok(result);
            }
            catch (Exception ex)
            {
                _logger.LogError("Error on GetAllArtist", ex);
                return StatusCode(StatusCodes.Status500InternalServerError, "Error getting all artist");
            }
        }

        /// <summary>
        /// Obtiene los artistas que el usuario sigue
        /// </summary>
        /// <returns></returns>
        [HttpGet("GetMyArtists")]
        [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        public async Task<ActionResult<List<Artist>>> GetMyArtists()
        {
            try
            {
                string userId = HttpContext.User.Claims.Where(x => x.Type == "UserId").FirstOrDefault().Value;

                var result = _artistService.GetMyArtist(userId);

                if (result == null)
                {
                    _logger.LogWarning("There are no artists");
                    return BadRequest("my_artist_not_found");
                }

                return Ok(result);
            }
            catch (Exception ex)
            {
                _logger.LogError("Error on Get My Artist", ex);
                return StatusCode(StatusCodes.Status500InternalServerError, "Error getting my artists");
            }
        }


        [HttpGet("GetRecommendedArtists")]
        [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        public async Task<ActionResult<List<Artist>>> GetRecommendedArtists()
        {
            try
            {
                string userId = HttpContext.User.Claims.Where(x => x.Type == "UserId").FirstOrDefault().Value;

                var result = _artistService.GetMyRecommendedArtists(userId);

                if (result == null)
                {
                    _logger.LogWarning("There are no recommended artists");
                    return BadRequest("recommended_artist_not_found");
                }

                return Ok(result);
            }
            catch (Exception ex)
            {
                _logger.LogError("Error on GetRecommended Artist", ex);
                return StatusCode(StatusCodes.Status500InternalServerError, "Error getting recommended artists");
            }
        }



        /// <summary>
        /// Obtiene un artista segun su Id
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpGet("{id}")]
        [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
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


        [HttpGet("GetTweets")]
        [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        public async Task<IActionResult> GetTweets(string twitterUserName)
        {
            try
            {
                var result = await _twitterService.getTweets(twitterUserName);

               return Ok(result);
            }
            catch (Exception ex)
            {
                _logger.LogError("Error on Get Tweets", ex);
                return StatusCode(StatusCodes.Status500InternalServerError, "Error getting tweets");
            }
        }

        [HttpGet("GetYoutubeVideos")]
        [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        public async Task<IActionResult> GetYoutubeVideos()
        {
            try
            {
                var result = _youtubeService.GetVideos("UC-NxzTwCAdyO_HRMahoxHfQ");
                return Ok(await result);
            }
            catch (Exception ex)
            {
                _logger.LogError("Error on Get Youtube Videos", ex);
                return StatusCode(StatusCodes.Status500InternalServerError, "Error on Get Youtube Videos");
            }
        }

        [HttpGet("Search")]
        [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        public ActionResult<List<Artist>> Search(string name)
        {
            try
            {
                var result = _artistService.SearchArtist(name);
                return Ok(result);
            }
            catch (Exception ex)
            {
                _logger.LogError("Error on Search Artists", ex);
                return StatusCode(StatusCodes.Status500InternalServerError, "Error on Search Artists");
            }
        }
    }
}
