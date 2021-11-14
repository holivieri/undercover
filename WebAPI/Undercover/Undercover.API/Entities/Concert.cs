using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Undercover.API.Entities
{
    public class Concert
    {
        [Key]
        public Guid Id { get; set; }
        
        [Required]
        public DateTime Date { get; set; }
        
        [Required]
        public Place Place { get; set; }

        public Artist Artist { get; set; }


    }
}
