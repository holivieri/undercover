﻿using Microsoft.AspNetCore.Identity;
using System.Collections.Generic;

namespace Undercover.API.Entities
{
    public partial class User : IdentityUser
    {
        public virtual List<Notification> Notifications { get; set; }
    }
}
