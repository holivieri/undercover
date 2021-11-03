using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using System;
using Undercover.API.Entities;

namespace Undercover.API.Data
{
    public class ApplicationDbContext : IdentityDbContext<User>, IApplicationDbContext
    {
        public ApplicationDbContext(DbContextOptions options) : base(options)
        {

        }

        public DbSet<Artist> Artists { get; set; }
        public DbSet<Genre> Genres { get; set; }
        public DbSet<Concert> Concerts { get; set; }

        public DbSet<Place> Places { get; set; }
        public DbSet<Country> Countries { get; set; }
        public DbSet<ArtistGenres> ArtistGenres { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("Relational:Collation", "Modern_Spanish_CI_AS");


            modelBuilder.Entity<ArtistGenres>()
                .HasKey(ag => new { ag.ArtistId, ag.GenreId });
            
            modelBuilder.Entity<ArtistGenres>()
            .HasOne(ag => ag.Artist)
            .WithMany(b => b.Genre)
            .HasForeignKey(bc => bc.ArtistId);

            modelBuilder.Entity<ArtistGenres>()
            .HasOne(bc => bc.Genre)
            .WithMany(c => c.Artists)
            .HasForeignKey(bc => bc.GenreId);


            var adminRole = new IdentityRole()
            {
                Id = Guid.NewGuid().ToString(),
                Name = "admin",
                NormalizedName = "admin",
            };
            var patientRole = new IdentityRole()
            {
                Id = Guid.NewGuid().ToString(),
                Name = "artist",
                NormalizedName = "artist",
            };
            var placeOwenerRole = new IdentityRole()
            {
                Id = Guid.NewGuid().ToString(),
                Name = "placeOwner",
                NormalizedName = "placeOwner",
            };
            var userRole = new IdentityRole()
            {
                Id = Guid.NewGuid().ToString(),
                Name = "user",
                NormalizedName = "user",
            };

            modelBuilder.Entity<IdentityRole>().HasData(adminRole);
            modelBuilder.Entity<IdentityRole>().HasData(patientRole);
            modelBuilder.Entity<IdentityRole>().HasData(userRole);
            modelBuilder.Entity<IdentityRole>().HasData(placeOwenerRole);

            var countryArgentina = new Country()
            {
                Id = Guid.NewGuid(),
                Name = "Argentina"
            };

            modelBuilder.Entity<Country>().HasData(countryArgentina);


            var genreRock = new Genre()
            {
                Id = Guid.NewGuid(),
                Name = "Rock"
            };

            var genreBlues = new Genre()
            {
                Id = Guid.NewGuid(),
                Name = "Blues"
            };

            var genreJazz = new Genre()
            {
                Id = Guid.NewGuid(),
                Name = "Jazz"
            };
            var genreHipHop = new Genre()
            {
                Id = Guid.NewGuid(),
                Name = "Hip Hop"
            };

            modelBuilder.Entity<Genre>().HasData(genreRock);
            modelBuilder.Entity<Genre>().HasData(genreBlues);
            modelBuilder.Entity<Genre>().HasData(genreJazz);
            modelBuilder.Entity<Genre>().HasData(genreHipHop);

            base.OnModelCreating(modelBuilder);
        }

    }
}
