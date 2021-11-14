using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Undercover.API.Entities
{
    public class PlacePicture
    {
        [Key]
        public Guid Id { get; set; }

        [Required]
        [StringLength(300)]
        public string PictureUrl { get; set; }

        public long Likes { get; set; }
    }
}
