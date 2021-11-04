﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Undercover.API.Entities
{
    public class Place
    {
        [Key]
        public Guid Id { get; set; }

        [Required]
        [StringLength(200)]
        public string Name { get; set; }

        [Required]
        public DateTime CreatedDate { get; set; }

        public long TotalCapacity { get { return Seats + Standing; } }

        public long Seats { get; set; }
        public long Standing { get; set; }

        [StringLength(10)]
        public string Floor { get; set; }

        [Required]
        [StringLength(100)]
        public string StreetName { get; set; }
        
        [Required]
        [StringLength(30)]
        public string StreetNumber { get; set; }

        [Required]
        [StringLength(100)]
        public string City { get; set; }

        [Required]
        [StringLength(100)]
        public string Province { get; set; }

        [Required]
        public Country Country { get; set; }
    }
}
