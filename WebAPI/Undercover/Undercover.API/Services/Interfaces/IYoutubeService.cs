using System.Threading.Tasks;

namespace Undercover.API.Services
{
    public interface IYoutubeService
    {
        Task<dynamic> GetVideos(string channelId);
    }
}