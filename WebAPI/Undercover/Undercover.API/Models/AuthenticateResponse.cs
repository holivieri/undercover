using System;

namespace Undercover.API.Models
{
    public class AuthenticateResponse
    {
        public Guid UserId { get; set; }
        public string UserName { get; set; }
        public string Token { get; set; }
        public DateTime Expiration { get; set; }
        
        /// <summary>
        /// Roles. Comma separated
        /// </summary>
        public string UserRoles { get; set; }

    }
}
