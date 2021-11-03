using System;
using System.ComponentModel.DataAnnotations;

namespace Undercover.API.Entities
{
    public class Song
    {
        [Key]
        public Guid Id { get; set; }

        [Required]
        [StringLength(200)]
        public string Title { get; set; }

        [StringLength(100)]
        public string Songwriter { get; set; }
    }
}
