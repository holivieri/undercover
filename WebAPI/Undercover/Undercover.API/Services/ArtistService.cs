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
                .Include(a => a.Genres)
                .Include(a => a.Concerts).ThenInclude(x => x.Place).ThenInclude(x => x.Country)
                .Include(a => a.Posts)
                .Include(a => a.Albums)
                .Where(a => a.Id == id).FirstOrDefault();
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
                .OrderBy(a => a.Name)
                .ToList();
        }

        public List<Artist> GetAllArtist(Genre genre)
        {
            return _dbContext
                .Artists
                .Include(a => a.Genres)
                .Include(a => a.Concerts).ThenInclude(x => x.Place).ThenInclude(x => x.Country)
                .Include(a => a.Concerts).ThenInclude(a => a.Artist)
                .Include(a => a.Posts)
                .Include(a => a.Albums)
                //.Where(a => a.Genres.Select( x => x.Genre.Name).Contains(genre)));
                .OrderBy(a => a.Name)
                .ToList();
        }
    }
}
