part of 'my_artists_bloc.dart';

@immutable
abstract class MyArtistsBlocEvent {}

class LoadMyArtists extends MyArtistsBlocEvent {}

class LoadArtist extends MyArtistsBlocEvent {
  LoadArtist(this.artistId);

  final String artistId;
}
