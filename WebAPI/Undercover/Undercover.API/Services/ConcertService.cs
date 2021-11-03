﻿using System;
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

        public List<Concert> GetNextConcerts()
        {
            return _dbContext.Concerts
                .Where(c => c.Date >= DateTime.UtcNow)
                .OrderBy(c => c.Date)
                .ToList();
        }

        public List<Concert> GetNextConcerts(string city)
        {
            return _dbContext.Concerts
                .Where(c => c.Date >= DateTime.UtcNow && c.Place.City == city)
                .OrderBy(c => c.Date)
                .ToList();
        }


    }
}
