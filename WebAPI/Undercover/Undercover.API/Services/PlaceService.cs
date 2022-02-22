using Microsoft.EntityFrameworkCore;
using NetTopologySuite.Geometries;
using System;
using System.Collections.Generic;
using System.Linq;
using Undercover.API.Data;
using Undercover.API.Entities;

namespace Undercover.API.Services
{
    public class PlaceService : IPlaceService
    {
        private readonly IApplicationDbContext _dbContext;

        public PlaceService(IApplicationDbContext dbContext)
        {
            _dbContext = dbContext;
        }

        public Place Get(Guid id)
        {
            return _dbContext.Places
                .Include(p => p.Country)
                .Where(p => p.Deleted == false && p.Id == id)
                .SingleOrDefault();
        }

        public List<Place> GetAllPlaces()
        {
            return _dbContext.Places
                .Include(p => p.Country)
                .Where(p => p.Deleted == false)
                .OrderBy(c => c.Name)
                .ToList();
        }

        public List<Place> GetAllPlaces(Point location, double distance)
        {
            return _dbContext.Places
                .Include(p => p.Country)
                .Where(p => p.Deleted == false && p.LatLng.Distance(location) < distance)
                .OrderBy(c => c.Name)
                .ToList();
        }

    }
}
