import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/artist_model.dart';
import '../../models/twitter_response_model.dart';
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
      final TweeterResponse? tweets = await artistRepository.getArtistTweets();
      if (tweets == null) {
        emit(TweetsError('No se pueden cargar los Tweets'));
      } else {
        emit(TweetsLoaded(tweets));
      }
    });
    on<LoadArtistYoutubeVideos>((event, emit) async {
      final YoutubeResponse? videos = await artistRepository.getYoutbeVideos();
      if (videos == null) {
        emit(ArtistsError('No se puede cargar los videos'));
      } else {
        emit(YoutubeVideosLoaded(videos));
      }
    });
  }
  final ArtistRepository artistRepository;
}
