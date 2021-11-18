import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/artist_model.dart';
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
  }
  final ArtistRepository artistRepository;
}
