﻿using Microsoft.AspNetCore.Identity;
using System.Collections.Generic;

namespace Undercover.API.Entities
{
    public partial class User : IdentityUser
    {

        public virtual List<Notification> Notifications { get; set; }

        public virtual List<Device> Devices { get; set; }

        public List<Attendant> Attendants { get; set; }

        public virtual List<Artist> MyArtists { get; set; }

        public virtual List<Place> MyPlaces { get; set; }

        public virtual List<Genre> MyGenres { get; set; }
    }
}
