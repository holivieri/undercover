using Microsoft.AspNetCore.Identity;
using System;

namespace Undercover.API.Entities
{
    public partial class User : IdentityUser
    {
        public User()
        {
        }

        public string UserEmail { get; set; }
        public string UserPassword { get; set; }
        
    }
}
