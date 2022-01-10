using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.ChangeTracking;
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
       
        public DbSet<ArtistPost> ArtistPosts { get; set; }

        public DbSet<ArtistPicture> ArtistPictures { get; set; }
        public override int SaveChanges()
        {
            return base.SaveChanges();
        }

        public override EntityEntry Entry(object entity)
        {
            return base.Entry(entity);
        }

        public DbSet<PlacePicture> PlacePictures { get; set; }
        public DbSet<Notification> Notifications { get; set; }

        public DbSet<User> Users { get; set; }
       
        public DbSet<Device> Devices { get; set; }

        public DbSet<Attendant> Attendants { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            modelBuilder.HasAnnotation("Relational:Collation", "Modern_Spanish_CI_AS");

            modelBuilder.Entity<Attendant>()
                .ToTable("Attendants")
                .HasKey(a => new { a.UserId, a.ConcertId });

            modelBuilder.Entity<Attendant>()
                .HasOne(a => a.User)
                .WithMany(b => b.Attendants)
            .HasForeignKey(a => a.UserId);

            modelBuilder.Entity<Attendant>()
                .HasOne(a => a.Concert)
                .WithMany(c => c.Attendants)
                .HasForeignKey(a => a.ConcertId);
            ////////////////////

            //modelBuilder.Entity<ArtistGenre>()
            //    .HasKey(ag => new { ag.ArtistId, ag.GenreId });

            //modelBuilder.Entity<ArtistGenre>()
            //.HasOne(ag => ag.Artist)
            //.WithMany(b => b.Genres)
            //.HasForeignKey(bc => bc.ArtistId);

            //modelBuilder.Entity<ArtistGenre>()
            //.HasOne(bc => bc.Genre)
            //.WithMany(c => c.Artists)
            //.HasForeignKey(bc => bc.GenreId);


            // var adminRole = new IdentityRole()
            // {
            //     Id = Guid.NewGuid().ToString(),
            //     Name = "admin",
            //     NormalizedName = "admin",
            // };
            // var patientRole = new IdentityRole()
            // {
            //     Id = Guid.NewGuid().ToString(),
            //     Name = "artist",
            //     NormalizedName = "artist",
            // };
            // var placeOwenerRole = new IdentityRole()
            // {
            //     Id = Guid.NewGuid().ToString(),
            //     Name = "placeOwner",
            //     NormalizedName = "placeOwner",
            // };
            // var userRole = new IdentityRole()
            // {
            //     Id = Guid.NewGuid().ToString(),
            //     Name = "user",
            //     NormalizedName = "user",
            // };

            // modelBuilder.Entity<IdentityRole>().HasData(adminRole);
            // modelBuilder.Entity<IdentityRole>().HasData(patientRole);
            // modelBuilder.Entity<IdentityRole>().HasData(userRole);
            // modelBuilder.Entity<IdentityRole>().HasData(placeOwenerRole);

            // var countryArgentina = new Country()
            // {
            //     Id = Guid.NewGuid(),
            //     Name = "Argentina"
            // };

            // modelBuilder.Entity<Country>().HasData(countryArgentina);


            // var genreRock = new Genre()
            // {
            //     Id = Guid.NewGuid(),
            //     Name = "Rock"
            // };

            // var genreBlues = new Genre()
            // {
            //     Id = Guid.NewGuid(),
            //     Name = "Blues"
            // };

            // var genreJazz = new Genre()
            // {
            //     Id = Guid.NewGuid(),
            //     Name = "Jazz"
            // };
            // var genreHipHop = new Genre()
            // {
            //     Id = Guid.NewGuid(),
            //     Name = "Hip Hop"
            // };
            // var genrePop = new Genre()
            // {
            //     Id = Guid.NewGuid(),
            //     Name = "Pop"
            // };
            // var genreMetal = new Genre()
            // {
            //     Id = Guid.NewGuid(),
            //     Name = "Metal"
            // };
            // var genrePunk = new Genre()
            // {
            //     Id = Guid.NewGuid(),
            //     Name = "Punk"
            // };

            // modelBuilder.Entity<Genre>().HasData(genreRock);
            // modelBuilder.Entity<Genre>().HasData(genreBlues);
            // modelBuilder.Entity<Genre>().HasData(genreJazz);
            // modelBuilder.Entity<Genre>().HasData(genreHipHop);
            // modelBuilder.Entity<Genre>().HasData(genrePop);
            // modelBuilder.Entity<Genre>().HasData(genrePunk);
            // modelBuilder.Entity<Genre>().HasData(genreMetal);

            // var artist = new Artist
            // {
            //     Id = Guid.NewGuid(),
            //     Name = "Cadena Perpetua",
            //     Bio = "Banda que surge en los sotanos del bajo Flores, cuando un grupo de amigos se junta a celebrar la prision domiciliaria de un entrañable del rock barrial.",
            //     CreatedDate = DateTime.UtcNow,
            //     PictureUrl = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOWx6qhLanoAcmkfVaSS2aGF1AHPhadAWp_iBX84YTTlPG0e2DreIcykftE_5rWCfwAN4&usqp=CAU",
            //     Followers = 121,
            //     TwitterAccount = "@cadenaperpetua",
            //     FacebookAccount = "cadenaperpetua",
            //     YouTubeAccount = "CadenaPerpetua",
            //     ManagerName =   "Ariel Sanchez",
            //     ManagerContact = "15-4444-5555",
            // };
            //// artist.Genres = new System.Collections.Generic.List<Genre>();
            // //artist.Genres.Add(genreMetal);
            // //artist.Genres.Add(genreRock);
            // modelBuilder.Entity<Artist>().HasData(artist);

            // var artist2 = new Artist
            // {
            //     Id = Guid.NewGuid(),
            //     Name = "A tu vieja le va a gustar",
            //     Bio = "Luego de una noche de sexo y alcohol los muchachos se pusieron a cantar la marcha peronista y descubrieron que tenian futuro en la música",
            //     CreatedDate = DateTime.UtcNow,
            //     PictureUrl = "https://lastfm.freetls.fastly.net/i/u/ar0/76b85924715ef309bab8885621a65a66.jpg",
            //     Followers = 150,
            //     TwitterAccount = "@ATVLVAG",
            //     FacebookAccount = "A_tu_Vieja",
            //     YouTubeAccount = "tu_vieja",
            //     ManagerName = "Ariel Sanchez",
            //     ManagerContact = "15-4444-5555",
            // };

            // //artist2.Genres = new System.Collections.Generic.List<Genre>();
            // //artist2.Genres.Add(genreRock);

            // modelBuilder.Entity<Artist>().HasData(artist2);

            // var place = new Place
            // {
            //     Id = Guid.NewGuid(),
            //     Name = "Kitano Jazz",
            //     CreatedDate = DateTime.UtcNow,
            //     //Country = countryArgentina,
            //     CoverPicture = "https://media-cdn.tripadvisor.com/media/photo-s/0a/f9/f4/77/kitano-bar-lounge.jpg",
            //     Description = "Pub fundado en 1980 durante la epoca mas represiva de la Argentina. Muchas bandas se juntaban a expresar su rebeldia. Desde entonces seguimos apoyando al under",
            //     Likes = 37,
            //     Dislikes = 1,
            //     Floor = "Planta baja",
            //     PhoneNumber = "4800-4777"  ,
            //     Seats  = 28,
            //     Province = "CABA",
            //     StreetName = "Av Corrientes",
            //     StreetNumber = "1780",
            //     Standing = 60,
            //     City = "Buenos Aires",
            // };
            // //place.Country = countryArgentina;

            // //modelBuilder.Entity<Place>().HasData(new[] { place });


            // var place2 = new Place
            // {
            //     Id = Guid.NewGuid(),
            //     Name = "La Chapita",
            //     CreatedDate = DateTime.UtcNow,
            //     //Country = countryArgentina,
            //     CoverPicture = "https://s3-media0.fl.yelpcdn.com/bphoto/CKMkJVnmiM3YnUUnGG4jCg/l.jpg",
            //     Likes = 128,
            //     Dislikes = 4,
            //     Floor = "Sotano",
            //     PhoneNumber = "4200-0000",
            //     Seats = 50,
            //     Province = "Buenos Aires",
            //     StreetName = "Misiones",
            //     StreetNumber = "530",
            //     Standing = 60,
            //     City = "El Palomar",
            // };
            //place2.Country = countryArgentina;

            //modelBuilder.Entity<Place>().HasData(new[] { place2 });
        }

    }
}
