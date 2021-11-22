using Microsoft.AspNetCore.Identity;

namespace Undercover.API.Entities
{
    public partial class User : IdentityUser
    {
        public string UserEmail { get; set; }
        public string UserPassword { get; set; }
    }
}
