
using System.ComponentModel.DataAnnotations;

namespace Undercover.API.Models
{
    public class UserModel
    {
        [Required]
        [EmailAddress]
        public string Email { get; set; }

        [Required]
        public string Password { get; set; }

        public string UserRole { get; set; }

        public string DeviceToken { get; set; }
        public string Platform { get; set; }

    }
}
