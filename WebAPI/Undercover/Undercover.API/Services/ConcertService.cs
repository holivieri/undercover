using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using Undercover.API.Data;
using Undercover.API.Entities;

namespace Undercover.API.Services
{
    public class ConcertService : IConcertService
    {
        private readonly IApplicationDbContext _dbContext;

        public ConcertService(IApplicationDbContext dbContext)
        {
            _dbContext = dbContext;
        }

        public Concert Get(Guid id)
        {
            return _dbContext.Concerts.Find(id);
        }

        public List<Concert> GetNextConcerts()
        {
            return _dbContext.Concerts
                .Include(c => c.Artist)
                .Include(c => c.Artist).ThenInclude(z => z.Genres)
                .Include(z => z.Artist).ThenInclude(z => z.Albums)
                .Include(z => z.Artist).ThenInclude(z => z.Posts)
                .Include(c => c.Artist).ThenInclude(x => x.Genres).ThenInclude(y => y.Genre)
                .Include(c => c.Place).ThenInclude(x => x.Country)
                .Where(c => c.Date >= DateTime.UtcNow)
                .OrderBy(c => c.Date)
                .ToList();
        }

        public List<Concert> GetNextConcerts(string city)
        {
            return _dbContext.Concerts
                .Include(c => c.Artist)
                .Include(c => c.Artist).ThenInclude(z => z.Genres)
                .Include(z => z.Artist).ThenInclude(z => z.Albums)
                .Include(z => z.Artist).ThenInclude(z => z.Posts)
                .Include(c => c.Place).ThenInclude(x => x.Country)
                .Where(c => c.Date >= DateTime.UtcNow && c.Place.City == city)
                .OrderBy(c => c.Date)
                .ToList();
        }


    }
}
