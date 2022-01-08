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
            return _dbContext.Concerts
                .Include(c => c.Artist)
                .Include(c => c.Artist).ThenInclude(z => z.Genres)
                .Include(z => z.Artist).ThenInclude(z => z.Albums)
                .Include(z => z.Artist).ThenInclude(z => z.Posts)
                .Include(c => c.Artist).ThenInclude(x => x.Genres)
                .Include(c => c.Place).ThenInclude(x => x.Country)
                .Where(c => c.Id == id)
                .OrderBy(c => c.Date)
                .FirstOrDefault();
        }

        public List<Concert> GetNextConcerts()
        {
            return _dbContext.Concerts
                .Include(c => c.Artist)
                .Include(c => c.Artist).ThenInclude(z => z.Genres)
                .Include(z => z.Artist).ThenInclude(z => z.Albums)
                .Include(z => z.Artist).ThenInclude(z => z.Posts)
                .Include(c => c.Artist).ThenInclude(x => x.Genres)
                .Include(c => c.Place).ThenInclude(x => x.Country)
                .Include(c => c.Attendants).ThenInclude(x => x.User)
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

        public bool SetAssistance(Guid concertId, Guid userId)
        {
            var concert = _dbContext.Concerts.Find(concertId);
            var user = _dbContext.Users.Find(userId.ToString());

            if (concert != null && user != null)
            {
                Attendant attendant = new Attendant {
                    ConcertId = concertId,
                    UserId = userId.ToString(),
                    User = user,
                };
                concert.Attendants = new List<Attendant>();
                concert.Attendants.Add(attendant);

            }
            _dbContext.SaveChanges();
            return true;

        }


    }
}
