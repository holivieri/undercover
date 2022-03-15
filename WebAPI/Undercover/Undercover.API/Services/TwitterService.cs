﻿using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;
using System.Collections.Generic;
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

        public async Task<List<ArtistTweet>> getTweets(string userName)
        {
            if (string.IsNullOrEmpty(userName))
            {
                userName = "undercover_ok";
            }
            string url = "https://api.twitter.com/1.1/statuses/user_timeline.json?screen_name=" + userName;
            _logger.LogInformation("URL: " + url);

            using (var httpClient = new HttpClient())
            {
                using (var requestMessage = new HttpRequestMessage(HttpMethod.Get, url))
                {
                    requestMessage.Headers.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", _settings["Twitter:BearerToken"]);
                    var response = await httpClient.SendAsync(requestMessage);
                   var jsonString = await response.Content.ReadAsStringAsync();
                    if (jsonString.Contains("errors"))
                    {
                        return new List<ArtistTweet>();
                    }

                    return JsonConvert.DeserializeObject<List<ArtistTweet>>(jsonString);
                }
            }
        }
    }
}
