import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/artist_model.dart';
import '../../models/artist_tweet.dart';
import '../../models/youtube_response_model.dart';
import '../../repositories/artists_repository.dart';

part 'my_artists_bloc_event.dart';
part 'my_artists_bloc_state.dart';

class MyArtistsBloc extends Bloc<MyArtistsBlocEvent, MyArtistsBlocState> {
  MyArtistsBloc(this.artistRepository) : super(LoadingArtists()) {
    on<LoadMyArtists>((event, emit) async {
      final artists = await artistRepository.getMyArtists();
      emit(ArtistsLoaded(artists));
    });
    on<LoadArtist>((event, emit) async {
      final Artist? artist = await artistRepository.getArtist(event.artistId);
      if (artist == null) {
        ArtistsError('No existe ese artista');
      } else {
        emit(ArtistLoaded(artist));
      }
    });
    on<LoadArtistTweets>((event, emit) async {
      final List<ArtistTweet?> tweets =
          await artistRepository.getArtistTweets(event.twitterAccount);
      emit(TweetsLoaded(tweets));
    });
    on<LoadArtistYoutubeVideos>((event, emit) async {
      final YoutubeResponse? videos = await artistRepository.getYoutbeVideos();
      if (videos == null) {
        emit(ArtistsError('errorLoadingVideos'));
      } else {
        emit(YoutubeVideosLoaded(videos));
      }
    });
    on<SearchArtists>((event, emit) async {
      emit(SearchingArtists());
      final List<Artist> artists =
          await artistRepository.searchArtists(event.artistName);
      emit(ArtistsFound(artists));
    });
  }
  final ArtistRepository artistRepository;
}
