using System;
using System.ComponentModel.DataAnnotations;

namespace Undercover.API.Entities
{
    public class Attendant
    {
        [Required]
        public Concert Concert { get; set; }

        [Required]
        public User User { get; set; }

        [Required]
        public Guid ConcertId { get; set; }

        [Required]
        [StringLength(450)]
        public string UserId { get; set; }

        [StringLength(300)]
        public string Comments { get; set; }

        public int? Calification { get; set; }

    }
}
