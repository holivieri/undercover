using System.ComponentModel.DataAnnotations;

namespace Undercover.API.Entities
{
    public class Profile
    {
        [Key]
        public string UserId { get; set; }

        public User User { get; set; }

        public Artist Artist { get; set; }

        public Place Place { get; set; }
        
        [Required]
        public bool isArtist { get; set; }

        [Required]
        public bool isPlaceOwner { get; set; }

    }
}
