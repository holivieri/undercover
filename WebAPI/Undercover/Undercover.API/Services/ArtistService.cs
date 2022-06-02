﻿using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Undercover.API.Data;
using Undercover.API.Entities;

namespace Undercover.API.Services
{
    public class ArtistService : IArtistService
    {
        private readonly IApplicationDbContext _dbContext;

        public ArtistService(IApplicationDbContext dbContext)
        {
            _dbContext = dbContext;
        }

        public Artist Get(Guid id)
        {
            return _dbContext.Artists
                .Include(a => a.Genres)
                .Include(a => a.Concerts).ThenInclude(x => x.Place).ThenInclude(x => x.Country)
                .Include(a => a.Posts)
                .Include(a => a.Albums)
                .Where(a => a.Deleted == false && a.Id == id).FirstOrDefault();
        }

        public List<Artist> GetAllArtist()
        {
            return _dbContext
                .Artists
                .Include(a => a.Genres)
                .Include(a => a.Concerts).ThenInclude(x => x.Place)
                        .ThenInclude(x => x.Country)
                .Include(a => a.Posts)
                .Include(a => a.Albums)
                .Where(a => a.Deleted == false)
                .OrderBy(a => a.Name)
                .ToList();
        }

        public List<Artist> GetAllArtist(Genre genre)
        {
            return _dbContext
                .Artists
                .Include(a => a.Genres)
                .Include(a => a.Concerts).ThenInclude(x => x.Place).ThenInclude(x => x.Country)
                .Include(a => a.Posts)
                .Include(a => a.Albums)
                //.Where(a => a.Genres.Select( x => x.Genre.Name).Contains(genre)));
                .Where(a => a.Deleted == false)
                .OrderBy(a => a.Name)
                .ToList();
        }

        public List<Artist> GetMyArtist(string userId)
        {
            var query = from artist in _dbContext.Artists
                        where artist.Users.Any(a => a.Id == userId)
                        select artist;

            return query.ToList();
        }

        public List<Artist> GetMyRecommendedArtists(string userId)
        {
             var query = from artist in _dbContext.Artists
                         .Include(c => c.Users)
                        where artist.Users.Any(a => a.Id != userId)
                        select artist;

            return query.ToList();
        }

        public List<Artist> SearchArtist(string artistName)
        {
            return _dbContext
              .Artists
              .Include(a => a.Genres)
              .Include(a => a.Concerts).ThenInclude(x => x.Place).ThenInclude(x => x.Country)
              .Include(a => a.Posts)
              .Include(a => a.Albums)
              .Where(a => a.Deleted == false && a.Name.StartsWith(artistName))
              .OrderBy(a => a.Name)
              .ToList();
        }
    }
}
