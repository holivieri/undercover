using System;
using System.ComponentModel.DataAnnotations;

namespace Undercover.API.Entities
{
    public class Device
    {
        [Key]
        public string Token { get; set; }

        [Required]
        [StringLength(100)]
        public string Platform { get; set; }

        [Required]
        [StringLength(256)]
        [EmailAddress]
        public string UserEmail { get; set; }

        [Required]
        public DateTime LastAccess { get; set; }
        
        [Required]
        [StringLength(450)]
        public string UserId { get; set; }

    }
}
