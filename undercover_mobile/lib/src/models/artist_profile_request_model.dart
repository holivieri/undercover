import 'dart:convert';

ArtistProfileRequest artistProfileRequestFromJson(String str) =>
    ArtistProfileRequest.fromJson(json.decode(str));

String artistProfileRequestToJson(ArtistProfileRequest data) =>
    json.encode(data.toJson());

class ArtistProfileRequest {
  ArtistProfileRequest({
    required this.artist,
    this.isArtist = true,
    this.isPlaceOwner = false,
  });

  factory ArtistProfileRequest.fromJson(Map<String, dynamic> json) =>
      ArtistProfileRequest(
        artist: ArtistBasicProfile.fromJson(json['artist']),
        isArtist: json['isArtist'],
        isPlaceOwner: json['isPlaceOwner'],
      );

  final ArtistBasicProfile artist;
  final bool isArtist;
  final bool isPlaceOwner;

  Map<String, dynamic> toJson() => {
        'artist': artist.toJson(),
        'isArtist': isArtist,
        'isPlaceOwner': isPlaceOwner,
      };
}

class ArtistBasicProfile {
  ArtistBasicProfile({
    required this.name,
    required this.bio,
    required this.pictureUrl,
    required this.genres,
    this.pictures,
    this.twitterAccount,
    this.facebookAccount,
    this.youTubeAccount,
    this.spotifyAccount,
    this.soundCloudAccount,
    this.managerName,
    this.managerContact,
  });

  factory ArtistBasicProfile.fromJson(Map<String, dynamic> json) =>
      ArtistBasicProfile(
        name: json['name'],
        bio: json['bio'],
        pictureUrl: json['pictureUrl'],
        genres: List<Genre>.from(json['genres'].map((x) => Genre.fromJson(x))),
        pictures: json['pictures'] == null
            ? null
            : List<Picture>.from(
                json['pictures'].map((x) => Picture.fromJson(x))),
        twitterAccount: json['twitterAccount'],
        facebookAccount: json['facebookAccount'],
        youTubeAccount: json['youTubeAccount'],
        spotifyAccount: json['spotifyAccount'],
        soundCloudAccount: json['soundCloudAccount'],
        managerName: json['managerName'],
        managerContact: json['managerContact'],
      );

  final String name;
  final String bio;
  final String pictureUrl;
  final List<Picture>? pictures;
  final List<Genre> genres;
  final String? twitterAccount;
  final String? facebookAccount;
  final String? youTubeAccount;
  final String? spotifyAccount;
  final String? soundCloudAccount;
  final String? managerName;
  final String? managerContact;

  Map<String, dynamic> toJson() => {
        'name': name,
        'bio': bio,
        'pictureUrl': pictureUrl,
        'pictures': pictures == null
            ? null
            : List<dynamic>.from(pictures!.map((x) => x.toJson())),
        'genres': List<dynamic>.from(genres.map((x) => x.toJson())),
        'twitterAccount': twitterAccount,
        'facebookAccount': facebookAccount,
        'youTubeAccount': youTubeAccount,
        'spotifyAccount': spotifyAccount,
        'soundCloudAccount': soundCloudAccount,
        'managerName': managerName,
        'managerContact': managerContact,
      };
}

class Genre {
  Genre({
    required this.id,
    required this.name,
  });

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        id: json['id'],
        name: json['name'],
      );

  final String id;
  final String name;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}

class Picture {
  Picture({
    required this.pictureUrl,
    this.likes = 0,
  });

  factory Picture.fromJson(Map<String, dynamic> json) => Picture(
        pictureUrl: json['pictureUrl'],
        likes: json['likes'],
      );

  final String pictureUrl;
  final int likes;

  Map<String, dynamic> toJson() => {
        'pictureUrl': pictureUrl,
        'likes': likes,
      };
}
