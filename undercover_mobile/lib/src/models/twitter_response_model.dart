import 'dart:convert';

TweeterResponse tweeterResponseFromJson(String str) =>
    TweeterResponse.fromJson(json.decode(str));

String tweeterResponseToJson(TweeterResponse data) =>
    json.encode(data.toJson());

class TweeterResponse {
  TweeterResponse({
    required this.data,
  });

  factory TweeterResponse.fromJson(Map<String, dynamic> json) =>
      TweeterResponse(
        data: List<Tweet>.from(json['data'].map((x) => Tweet.fromJson(x))),
      );

  final List<Tweet> data;

  Map<String, dynamic> toJson() => {
        'data': List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Tweet {
  Tweet({
    required this.text,
    required this.publicMetrics,
    required this.id,
    required this.createdAt,
  });

  factory Tweet.fromJson(Map<String, dynamic> json) => Tweet(
        text: json['text'],
        publicMetrics: PublicMetrics.fromJson(json['public_metrics']),
        id: json['id'],
        createdAt: DateTime.parse(json['created_at']),
      );

  final String text;
  final PublicMetrics publicMetrics;
  final String id;
  final DateTime createdAt;

  Map<String, dynamic> toJson() => {
        'text': text,
        'public_metrics': publicMetrics.toJson(),
        'id': id,
        'created_at': createdAt.toIso8601String(),
      };
}

class PublicMetrics {
  PublicMetrics({
    required this.retweetCount,
    required this.replyCount,
    required this.likeCount,
    required this.quoteCount,
  });

  factory PublicMetrics.fromJson(Map<String, dynamic> json) => PublicMetrics(
        retweetCount: json['retweet_count'],
        replyCount: json['reply_count'],
        likeCount: json['like_count'],
        quoteCount: json['quote_count'],
      );

  final int retweetCount;
  final int replyCount;
  final int likeCount;
  final int quoteCount;

  Map<String, dynamic> toJson() => {
        'retweet_count': retweetCount,
        'reply_count': replyCount,
        'like_count': likeCount,
        'quote_count': quoteCount,
      };
}
