using Microsoft.EntityFrameworkCore;
using Undercover.API.Entities;

namespace Undercover.API.Data
{
    public interface IApplicationDbContext
    {
        int SaveChanges();

        DbSet<Artist> Artists { get; set; }
        DbSet<Concert> Concerts { get; set; }
        DbSet<Place> Places { get; set; }
        DbSet<Genre> Genres { get; set; }
        DbSet<Country> Countries { get; set; }
        DbSet<Notification> Notifications { get; set; }

        DbSet<User> Users { get; set; }

    }
}