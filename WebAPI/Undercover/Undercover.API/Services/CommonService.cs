﻿using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using Undercover.API.Data;
using Undercover.API.Entities;

namespace Undercover.API.Services
{
    public class CommonService : ICommonService
    {
        private readonly IApplicationDbContext _dbContext;

        public CommonService(IApplicationDbContext dbContext)
        {
            _dbContext = dbContext;
        }

        public List<Genre> GetAllGenres()
        {
            return _dbContext.Genres
                //.Include(a => a.Artists).ThenInclude(b => b.Artist)
                .OrderBy(c => c.Name)
                .ToList();
        }
        public Genre GetGenre(Guid id)
        {
            return _dbContext.Genres.Find(id);
        }

        public List<Country> GetAllCountries()
        {
            return _dbContext.Countries
                .OrderBy(c => c.Name)
                .ToList();
        }

        public Country GetCountry(Guid id)
        {
            return _dbContext.Countries.Find(id);
        }
    }
}
