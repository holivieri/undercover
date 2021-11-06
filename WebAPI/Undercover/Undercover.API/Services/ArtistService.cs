using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
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
                .Include("Genres")

                .Include("Concerts")
                .Include("Posts")
                .Include("Albums")
                .Where(a => a.Id == id).FirstOrDefault();
        }

        public List<Artist> GetAllArtist()
        {
            return _dbContext
                .Artists
                .Include(a => a.Genres)
                .Include("Concerts")
                .Include("Posts")
                .Include("Albums")
                .OrderBy(a => a.Name)
                .ToList();
        }

        public List<Artist> GetAllArtist(Genre genre)
        {
            return _dbContext
                .Artists
                .Include("Genres")
                .Include("Concerts")
                .Include("Posts")
                .Include("Albums")
                //.Where(a => genre.Artists.Contains(a));
                .OrderBy(a => a.Name)
                .ToList();
        }
    }
}
