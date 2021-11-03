using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Undercover.API.Entities
{
    public class Genre
    {
        [Key]
        public Guid Id { get; set; }

        [Required]
        [StringLength(100)]
        public string Name { get; set; }

        public List<ArtistGenres> Artists { get; set; }

    }
}
