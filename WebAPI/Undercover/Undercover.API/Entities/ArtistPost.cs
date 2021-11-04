using System;
using System.ComponentModel.DataAnnotations;

namespace Undercover.API.Entities
{
    public class ArtistPost
    {
        [Key]
        public Guid Id { get; set; }

        [Required]
        public DateTime CreatedDate { get; set; }

        [Required]
        [StringLength(200)]
        public string Title { get; set; }

        [StringLength(1000)]
        public string Details { get; set; }

        [StringLength(300)]
        public string PictureUrl { get; set; }

    }
}
