part of 'my_artists_bloc.dart';

@immutable
abstract class MyArtistsBlocState {}

class MyArtistsBlocInitial extends MyArtistsBlocState {}

class LoadingArtists extends MyArtistsBlocState {}

class ArtistsLoaded extends MyArtistsBlocState {
  ArtistsLoaded(this.artists);

  final List<Artist> artists;
}

class LoadingArtist extends MyArtistsBlocState {}

class ArtistLoaded extends MyArtistsBlocState {
  ArtistLoaded(this.artist);

  final Artist artist;
}

class LoadingTweets extends MyArtistsBlocState {}

class TweetsLoaded extends MyArtistsBlocState {
  TweetsLoaded(this.tweets);

  final TweeterResponse tweets;
}

class LoadingYoutubeVideos extends MyArtistsBlocState {}

class YoutubeVideosLoaded extends MyArtistsBlocState {
  YoutubeVideosLoaded(this.videos);

  final YoutubeResponse videos;
}

class ArtistsError extends MyArtistsBlocState {
  ArtistsError(this.errorMessage);

  final String errorMessage;
}

class TweetsError extends MyArtistsBlocState {
  TweetsError(this.errorMessage);

  final String errorMessage;
}

class SearchingArtists extends MyArtistsBlocState {}

class ArtistsFound extends MyArtistsBlocState {
  ArtistsFound(this.artists);

  final List<Artist> artists;
}
