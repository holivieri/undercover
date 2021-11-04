using System;
using System.Collections.Generic;
using Undercover.API.Entities;

namespace Undercover.API.Services
{
    public interface IPlaceService
    {
        List<Place> GetAllPlaces();
        List<Place> GetAllPlaces(string city);

        Place Get(Guid id);
    }
}