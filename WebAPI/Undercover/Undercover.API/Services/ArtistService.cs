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

        public List<Artist> GetAllArtist()
        {
            return _dbContext
                .Artists
                .OrderBy(a => a.Name)
                .ToList();
        }

        public List<Artist> GetAllArtist(Genre genre)
        {
            return _dbContext
                .Artists
                //.Where(a => genre.Artists.Contains(a));
                .OrderBy(a => a.Name)
                .ToList();
        }
    }
}
