import 'dart:convert';

import 'album_model.dart';
import 'concert_model.dart';
import 'post_model.dart';

List<Artist> artistFromJson(String str) =>
    List<Artist>.from(json.decode(str).map((x) => Artist.fromJson(x)));

String artistToJson(List<Artist> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Artist {
  Artist({
    required this.id,
    required this.createdDate,
    required this.name,
    required this.bio,
    required this.genres,
    required this.concerts,
    required this.albums,
    required this.posts,
    required this.followers,
    this.pictureUrl,
    this.twitterAccount,
    this.facebookAccount,
    this.youTubeAccount,
    this.spotifyAccount,
    this.soundCloudAccount,
    this.managerName,
    this.managerContact,
  });

  final String id;
  final DateTime createdDate;
  final String name;
  final String bio;
  final String? pictureUrl;
  final List<GenreElement> genres;
  final List<Concert> concerts;
  final List<Album> albums;
  final List<Post> posts;
  final int followers;
  final String? twitterAccount;
  final String? facebookAccount;
  final String? youTubeAccount;
  final String? spotifyAccount;
  final String? soundCloudAccount;
  final String? managerName;
  final String? managerContact;

  factory Artist.fromJson(Map<String, dynamic> json) => Artist(
        id: json['id'],
        createdDate: DateTime.parse(json['createdDate']),
        name: json['name'],
        bio: json['bio'],
        pictureUrl: json['pictureUrl'],
        genres: List<GenreElement>.from(
            json['genres'].map((x) => GenreElement.fromJson(x))),
        concerts: List<Concert>.from(
            json['concerts'].map((x) => Concert.fromJson(x))),
        albums: List<Album>.from(json['albums'].map((x) => Album.fromJson(x))),
        posts: List<Post>.from(json['posts'].map((x) => Post.fromJson(x))),
        followers: json['followers'],
        twitterAccount: json['twitterAccount'],
        facebookAccount: json['facebookAccount'],
        youTubeAccount: json['youTubeAccount'],
        spotifyAccount: json['spotifyAccount'],
        soundCloudAccount: json['soundCloudAccount'],
        managerName: json['managerName'],
        managerContact: json['managerContact'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'createdDate': createdDate.toIso8601String(),
        'name': name,
        'bio': bio,
        'pictureUrl': pictureUrl,
        'genres': List<dynamic>.from(genres.map((x) => x.toJson())),
        'concerts': List<dynamic>.from(concerts.map((x) => x.toJson())),
        'albums': List<dynamic>.from(albums.map((x) => x.toJson())),
        'posts': List<dynamic>.from(posts.map((x) => x.toJson())),
        'followers': followers,
        'twitterAccount': twitterAccount,
        'facebookAccount': facebookAccount,
        'youTubeAccount': youTubeAccount,
        'spotifyAccount': spotifyAccount,
        'soundCloudAccount': soundCloudAccount,
        'managerName': managerName,
        'managerContact': managerContact,
      };
}

class GenreElement {
  GenreElement({
    required this.artistId,
    required this.genreId,
    required this.genre,
  });

  final String artistId;
  final String genreId;
  final ArtistGenre genre;

  factory GenreElement.fromJson(Map<String, dynamic> json) => GenreElement(
        artistId: json['artistId'],
        genreId: json['genreId'],
        genre: ArtistGenre.fromJson(json['genre']),
      );

  Map<String, dynamic> toJson() => {
        'artistId': artistId,
        'genreId': genreId,
        'genre': genre.toJson(),
      };
}

class ArtistGenre {
  ArtistGenre({
    required this.id,
    required this.name,
    this.artists,
  });

  final String id;
  final String name;
  final List<dynamic>? artists;

  factory ArtistGenre.fromJson(Map<String, dynamic> json) => ArtistGenre(
        id: json['id'],
        name: json['name'],
        artists: json['artists'] == null
            ? null
            : List<dynamic>.from(json['artists'].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'artists':
            artists == null ? null : List<dynamic>.from(artists!.map((x) => x)),
      };
}
