using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Undercover.API.Entities
{
    public class Album
    {
        [Key]
        public Guid Id { get; set; }

        [Required]
        [StringLength(200)]
        public string Title { get; set; }

        [StringLength(300)]
        public string ImageUrl { get; set; }

        [Required]
        public int ReleaseYear { get; set; }

        public List<Song> Songs { get; set; }


    }
}
