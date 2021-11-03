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
    [Route("api/v1/Undercover")]
    [ApiController]
    public class UndercoverController : ControllerBase
    {
        private readonly ILogger<UndercoverController> logger;
        private readonly IArtistService _artistService;
        private readonly ICommonService _commonService;
        private readonly IPlaceService _placeService;
        private readonly IConcertService _concertService;

        public UndercoverController(IArtistService artistService, 
            ICommonService commonService, 
            IPlaceService placeService, 
            IConcertService concertService)
        {
            _artistService = artistService;
            _commonService = commonService;
            _placeService = placeService;
            _concertService = concertService;
        }


        /// <summary>
        /// Obtiene todos los artistas
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public async Task<ActionResult<List<Artist>>> GetArtists()
        {
            return Ok(_artistService.GetAllArtist());
        }

        //[HttpGet]
        //public async Task<ActionResult<List<Genre>>> GetGenres()
        //{
        //    return Ok(_commonService.GetAllGenres());
        //}

        //[HttpGet]
        //public async Task<ActionResult<List<Country>>> GetCountries()
        //{
        //    return Ok(_commonService.GetAllCountries());
        //}

        //[HttpGet]
        //public async Task<ActionResult<List<Place>>> GetPlaces()
        //{
        //    return Ok(_placeService.GetAllPlaces());
        //}

        //[HttpGet]
        //public async Task<ActionResult<List<Concert>>> GetNextConcerts()
        //{
        //    return Ok(_concertService.GetNextConcerts());
        //}

        //[HttpGet]
        //public async Task<ActionResult<List<Concert>>> GetNextConcertsByCity(string city)
        //{
        //    return Ok(_concertService.GetNextConcerts(city));
        //}

    }
}
