using System;
using System.ComponentModel.DataAnnotations;

namespace Undercover.API.Entities
{
    public class ArtistPicture
    {
        [Key]
        public Guid Id { get; set; }

        [Required]
        [StringLength(300)]
        public string PictureUrl { get; set; }
        
        public long Likes { get; set; }

    }
}
