using System.Threading.Tasks;
using Undercover.API.Models;

namespace Undercover.API.Services
{
    public interface ITwitterService
    {
        Task<Tweets> getTweets(string userName);
    }
}