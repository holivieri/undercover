using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;
using System.Collections.Generic;
using System.Net.Http;
using System.Text;
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

        public async Task<List<Tweet>> getTweets(long twitterUserId)
        {
            string url = _settings["Twitter:url"];
            url += "/" + twitterUserId.ToString() + "/tweets?tweet.fields=public_metrics,created_at";

            _logger.LogInformation("URL: " + url);

            using (var httpClient = new HttpClient())
            {
                using (var response = await httpClient.GetAsync(url))
                {
                    response.EnsureSuccessStatusCode();

                    if (response.StatusCode == System.Net.HttpStatusCode.OK)
                    {
                        var jsonString = await response.Content.ReadAsStringAsync();
                        return JsonConvert.DeserializeObject<List<Tweet>>(jsonString);
                    }
                    else
                    {
                        _logger.LogError("Status Code: " + response.StatusCode);
                        _logger.LogError("Response: " + response.ToString());
                        _logger.LogError("Twitter Error");
                        return new List<Tweet>();
                    }
                }
            }

        }

    }
}
