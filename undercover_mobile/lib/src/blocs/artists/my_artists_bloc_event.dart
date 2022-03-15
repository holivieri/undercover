part of 'my_artists_bloc.dart';

@immutable
abstract class MyArtistsBlocEvent {}

class LoadMyArtists extends MyArtistsBlocEvent {}

class LoadArtist extends MyArtistsBlocEvent {
  LoadArtist(this.artistId);

  final String artistId;
}

class LoadArtistTweets extends MyArtistsBlocEvent {
  LoadArtistTweets(this.twitterAccount);

  final String twitterAccount;
}

class LoadArtistYoutubeVideos extends MyArtistsBlocEvent {}

class SearchArtists extends MyArtistsBlocEvent {
  SearchArtists(this.artistName);

  final String artistName;
}
