using Newtonsoft.Json;
using System.Collections.Generic;

namespace Undercover.API.Models
{
    public partial class ArtistTweet
    {
        [JsonProperty("created_at")]
        public string CreatedAt { get; set; }

        [JsonProperty("id_str")]
        public string IdStr { get; set; }

        [JsonProperty("text")]
        public string Text { get; set; }

        [JsonProperty("truncated")]
        public bool Truncated { get; set; }

        [JsonProperty("retweet_count")]
        public long RetweetCount { get; set; }

        [JsonProperty("favorite_count")]
        public long FavoriteCount { get; set; }

        [JsonProperty("favorited")]
        public bool Favorited { get; set; }

        [JsonProperty("retweeted")]
        public bool Retweeted { get; set; }

        [JsonProperty("lang")]
        public string Lang { get; set; }

    }

    public partial class ArtistTweet
    {
        public static List<ArtistTweet> FromJson(string json) => JsonConvert.DeserializeObject<List<ArtistTweet>>(json);
    }

    public static class Serialize
    {
        public static string ToJson(this List<ArtistTweet> self) => JsonConvert.SerializeObject(self);
    }
}
