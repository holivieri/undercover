import 'dart:convert';

List<ArtistTweet> artistTweetFromJson(String str) => List<ArtistTweet>.from(
    json.decode(str).map((x) => ArtistTweet.fromJson(x)));

String artistTweetToJson(List<ArtistTweet> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ArtistTweet {
  ArtistTweet({
    required this.createdAt,
    required this.idStr,
    required this.text,
    required this.truncated,
    required this.retweetCount,
    required this.favoriteCount,
    required this.favorited,
    required this.retweeted,
    required this.lang,
  });

  factory ArtistTweet.fromJson(Map<String, dynamic> json) => ArtistTweet(
        createdAt: json['created_at'],
        idStr: json['id_str'],
        text: json['text'],
        truncated: json['truncated'],
        retweetCount: json['retweet_count'],
        favoriteCount: json['favorite_count'],
        favorited: json['favorited'],
        retweeted: json['retweeted'],
        lang: json['lang'],
      );

  final String createdAt;
  final String idStr;
  final String text;
  final bool truncated;
  final int retweetCount;
  final int favoriteCount;
  final bool favorited;
  final bool retweeted;
  final String lang;

  Map<String, dynamic> toJson() => {
        'created_at': createdAt,
        'id_str': idStr,
        'text': text,
        'truncated': truncated,
        'retweet_count': retweetCount,
        'favorite_count': favoriteCount,
        'favorited': favorited,
        'retweeted': retweeted,
        'lang': lang,
      };
}
