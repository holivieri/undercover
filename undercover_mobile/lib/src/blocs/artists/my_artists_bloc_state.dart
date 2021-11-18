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

class ArtistsError extends MyArtistsBlocState {
  ArtistsError(this.errorMessage);

  final String errorMessage;
}
