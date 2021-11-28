import 'dart:convert';

YoutubeResponse youtubeResponseFromJson(String str) =>
    YoutubeResponse.fromJson(json.decode(str));

String youtubeResponseToJson(YoutubeResponse data) =>
    json.encode(data.toJson());

class YoutubeResponse {
  YoutubeResponse({
    required this.kind,
    required this.etag,
    required this.nextPageToken,
    required this.regionCode,
    required this.pageInfo,
    required this.items,
  });

  factory YoutubeResponse.fromJson(Map<String, dynamic> json) =>
      YoutubeResponse(
        kind: json['kind'],
        etag: json['etag'],
        nextPageToken: json['nextPageToken'],
        regionCode: json['regionCode'],
        pageInfo: PageInfo.fromJson(json['pageInfo']),
        items: List<Item>.from(
          json['items'].map((x) => Item.fromJson(x)),
        ),
      );

  final String kind;
  final String etag;
  final String nextPageToken;
  final String regionCode;
  final PageInfo pageInfo;
  final List<Item> items;

  Map<String, dynamic> toJson() => {
        'kind': kind,
        'etag': etag,
        'nextPageToken': nextPageToken,
        'regionCode': regionCode,
        'pageInfo': pageInfo.toJson(),
        'items': List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Item {
  Item({
    required this.kind,
    required this.etag,
    required this.id,
    required this.snippet,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        kind: json['kind'],
        etag: json['etag'],
        id: Id.fromJson(json['id']),
        snippet: Snippet.fromJson(json['snippet']),
      );

  final String kind;
  final String etag;
  final Id id;
  final Snippet snippet;

  Map<String, dynamic> toJson() => {
        'kind': kind,
        'etag': etag,
        'id': id.toJson(),
        'snippet': snippet.toJson(),
      };
}

class Id {
  Id({
    required this.kind,
    required this.videoId,
  });

  factory Id.fromJson(Map<String, dynamic> json) => Id(
        kind: json['kind'],
        videoId: json['videoId'],
      );

  final String kind;
  final String videoId;

  Map<String, dynamic> toJson() => {
        'kind': kind,
        'videoId': videoId,
      };
}

class Snippet {
  Snippet({
    required this.publishedAt,
    required this.channelId,
    required this.title,
    required this.description,
    required this.thumbnails,
    required this.channelTitle,
    required this.publishTime,
  });

  factory Snippet.fromJson(Map<String, dynamic> json) => Snippet(
        publishedAt: DateTime.parse(json['publishedAt']),
        channelId: json['channelId'],
        title: json['title'],
        description: json['description'],
        thumbnails: Thumbnails.fromJson(json['thumbnails']),
        channelTitle: json['channelTitle'],
        publishTime: DateTime.parse(json['publishTime']),
      );

  final DateTime publishedAt;
  final String channelId;
  final String title;
  final String description;
  final Thumbnails thumbnails;
  final String channelTitle;
  final DateTime publishTime;

  Map<String, dynamic> toJson() => {
        'publishedAt': publishedAt.toIso8601String(),
        'channelId': channelId,
        'title': title,
        'description': description,
        'thumbnails': thumbnails.toJson(),
        'channelTitle': channelTitle,
        'publishTime': publishTime.toIso8601String(),
      };
}

class Thumbnails {
  Thumbnails({
    required this.thumbnailsDefault,
    required this.medium,
    required this.high,
  });

  factory Thumbnails.fromJson(Map<String, dynamic> json) => Thumbnails(
        thumbnailsDefault: Default.fromJson(json['default']),
        medium: Default.fromJson(json['medium']),
        high: Default.fromJson(json['high']),
      );

  final Default thumbnailsDefault;
  final Default medium;
  final Default high;

  Map<String, dynamic> toJson() => {
        'default': thumbnailsDefault.toJson(),
        'medium': medium.toJson(),
        'high': high.toJson(),
      };
}

class Default {
  Default({
    required this.url,
    required this.width,
    required this.height,
  });

  factory Default.fromJson(Map<String, dynamic> json) => Default(
        url: json['url'],
        width: json['width'],
        height: json['height'],
      );

  final String url;
  final int width;
  final int height;

  Map<String, dynamic> toJson() => {
        'url': url,
        'width': width,
        'height': height,
      };
}

class PageInfo {
  PageInfo({
    required this.totalResults,
    required this.resultsPerPage,
  });

  factory PageInfo.fromJson(Map<String, dynamic> json) => PageInfo(
        totalResults: json['totalResults'],
        resultsPerPage: json['resultsPerPage'],
      );

  final int totalResults;
  final int resultsPerPage;

  Map<String, dynamic> toJson() => {
        'totalResults': totalResults,
        'resultsPerPage': resultsPerPage,
      };
}
