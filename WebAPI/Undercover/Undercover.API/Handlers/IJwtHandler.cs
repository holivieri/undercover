using Google.Apis.Auth;
using System.Threading.Tasks;
using Undercover.API.Entities;
using Undercover.API.Models;

namespace Undercover.API.JwtFeatures
{
    public interface IJwtHandler
    {
        Task<string> GenerateToken(User user);
        Task<GoogleJsonWebSignature.Payload> VerifyGoogleToken(ExternalAuthDto externalAuth);
    }
}