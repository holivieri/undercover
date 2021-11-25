using System;
using System.Collections.Generic;

using System.Globalization;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;

namespace Undercover.API.Models
{
    // Root myDeserializedClass = JsonConvert.DeserializeObject<Root>(myJsonResponse); 
    public class PublicMetrics
    {
        public int retweet_count { get; set; }
        public int reply_count { get; set; }
        public int like_count { get; set; }
        public int quote_count { get; set; }
    }

    public class Tweet
    {
        public string text { get; set; }
        public PublicMetrics public_metrics { get; set; }
        public string id { get; set; }
        public DateTime created_at { get; set; }
    }

    public class Meta
    {
        public string oldest_id { get; set; }
        public string newest_id { get; set; }
        public int result_count { get; set; }
        public string next_token { get; set; }
    }

    public class Tweets
    {
        public List<Tweet> data { get; set; }
        public Meta meta { get; set; }
    }


}
