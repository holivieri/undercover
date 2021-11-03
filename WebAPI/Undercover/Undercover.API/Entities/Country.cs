using System;
using System.ComponentModel.DataAnnotations;

namespace Undercover.API.Entities
{
    public class Country
    {
        [Key]
        public Guid Id { get; set; }
        
        [Required]
        [StringLength(50)]
        public string Name { get; set; }
    }
}
