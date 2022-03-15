using System.Collections.Generic;
using System.Threading.Tasks;
using Undercover.API.Models;

namespace Undercover.API.Services
{
    public interface ITwitterService
    {
        Task<List<ArtistTweet>> getTweets(string userName);
    }
}