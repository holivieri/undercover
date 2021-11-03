using System;

namespace Undercover.API.Models
{
    public class UserToken
    {
        public string userName { get; set; }
        public string Token { get; set; }
        public DateTime Expiration { get; set; }
    }
}
