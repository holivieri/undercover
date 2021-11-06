using System;

namespace Undercover.API.Entities
{
    public class ArtistGenres
    {
        public Guid ArtistId { get; set; }
        public Artist Artist { get; set; }
        public Guid GenreId { get; set; }

        public Genre Genre { get; set; }
    }
}
