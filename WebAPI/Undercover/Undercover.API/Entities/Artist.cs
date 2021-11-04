using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Undercover.API.Entities
{
    public class Artist
    {
        [Key]
        public Guid Id { get; set; }

        [Required]
        public DateTime CreatedDate { get; set; }

        [Required]
        [StringLength(200)]
        public string Name { get; set; }

        [StringLength(1000)]
        public string Bio { get; set; }

        [StringLength(300)]
        public string PictureUrl { get; set; }

        //[Required]
        public virtual List<ArtistGenres> Genres { get; set; }

        public List<Concert> Concerts { get; set; }

        public List<Album> Albums { get; set; }

        [Required]
        public long Followers { get; set; }


        [StringLength(300)]
        public string TwitterAccount { get; set; }

        [StringLength(300)]
        public string FacebookAccount { get; set; }

        [StringLength(300)]
        public string YouTubeAccount { get; set; }
        
        [StringLength(300)]
        public string SpotifyAccount { get; set; }

        [StringLength(300)]
        public string SoundCloudAccount { get; set; }

        [StringLength(100)]
        public string ManagerName { get; set; }
        
        [StringLength(300)]
        public string ManagerContact { get; set; }



    }
}
