using NetTopologySuite.Geometries;
using System;
using System.Collections.Generic;
using Undercover.API.Entities;

namespace Undercover.API.Services
{
    public interface IPlaceService
    {
        List<Place> GetAllPlaces();
        List<Place> GetAllPlaces(Point location, double distance);

        Place Get(Guid id);
    }
}