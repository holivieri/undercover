using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;
using System.Net.Http;
using System.Threading.Tasks;
using Undercover.API.Models;

namespace Undercover.API.Services
{
    public class TwitterService : ITwitterService
    {

        private readonly ILogger<TwitterService> _logger;
        private readonly IConfiguration _settings;


        public TwitterService(ILogger<TwitterService> logger, IConfiguration settings)
        {
            _logger = logger;
            _settings = settings;
        }

        public async Task<Tweets> getTweets(long twitterUserId)
        {
            string url = _settings["Twitter:url"];
            url += "/" + twitterUserId.ToString() + "/tweets?tweet.fields=public_metrics,created_at";

            _logger.LogInformation("URL: " + url);

            using (var httpClient = new HttpClient())
            {
                using (var requestMessage = new HttpRequestMessage(HttpMethod.Get, url))
                {
                    requestMessage.Headers.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", _settings["Twitter:BearerToken"]);
                    var response = await httpClient.SendAsync(requestMessage);
                    var jsonString = await response.Content.ReadAsStringAsync();
                    return JsonConvert.DeserializeObject<Tweets>(jsonString);
                }
            }
        }

    }
}
