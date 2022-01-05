using System;
using System.ComponentModel.DataAnnotations;

namespace Undercover.API.Entities
{
    public class Notification
    {
        [Key]
        public Guid Id { get; set; }

        [Required]
        [StringLength(100)]
        public string Title { get; set; }

        [Required]
        [StringLength(50)]
        public string Category { get; set; }

        [Required]
        [StringLength(1000)]
        public string Message { get; set; }

        [Required]
        public bool Deleted { get; set; }
        
        [Required]
        public DateTime CreatedDate { get; set; }
        
        public User User { get; set; }

    }
}
