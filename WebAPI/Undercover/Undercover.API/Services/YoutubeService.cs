using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;

namespace Undercover.API.Services
{
    public class YoutubeService : IYoutubeService
    {
        private readonly ILogger<YoutubeService> _logger;
        private readonly IConfiguration _settings;

        public YoutubeService(IConfiguration settings, ILogger<YoutubeService> logger)
        {
            _logger = logger;
            _settings = settings;
        }

        public async Task<dynamic> GetVideos(string channelId)
        {
            string url = _settings["Youtube:url"];
            string apiKey = _settings["Youtube:ApiKey"];


            _logger.LogInformation("URL: " + url);

            var fullUrl = url + $"key={apiKey}&channelId={channelId}&part=snippet,id&order=date&maxResults=20";


            var result = await new HttpClient().GetStringAsync(fullUrl);
            if (result != null)
            {
                return JsonConvert.DeserializeObject(result);
            }
            return null;
        }

        

    }
}
