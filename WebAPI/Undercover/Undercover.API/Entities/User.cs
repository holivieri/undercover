using Microsoft.AspNetCore.Identity;
using System.Collections.Generic;

namespace Undercover.API.Entities
{
    public partial class User : IdentityUser
    {
        public List<Artist> MyArtists { get; set; }

        public List<Place> MyPlaces { get; set; }

        public List<Genre> MyGenres { get; set; }

        public List<Concert> MyConcerts { get; set; }

        public List<UserPicture> MyPictures { get; set; }

        public Country MyCountry { get; set; }

    }
}
