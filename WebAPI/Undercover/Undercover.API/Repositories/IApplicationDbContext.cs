using Microsoft.EntityFrameworkCore;
using Undercover.API.Entities;

namespace Undercover.API.Data
{
    public interface IApplicationDbContext
    {
        DbSet<Artist> Artists { get; set; }
        DbSet<Concert> Concerts { get; set; }
        DbSet<Place> Places { get; set; }
        DbSet<Genre> Genres { get; set; }

        DbSet<ArtistGenres> ArtistGenres { get; set; }

        DbSet<Country> Countries { get; set; }

    }
}