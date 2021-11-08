import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/artist_model.dart';
import '../../repositories/artists_repository.dart';

part 'my_artists_bloc_event.dart';
part 'my_artists_bloc_state.dart';

class MyArtistsBloc extends Bloc<MyArtistsBlocEvent, MyArtistsBlocState> {
  MyArtistsBloc(this.artistRepository) : super(LoadingArtists()) {
    /* on<MyArtistsBlocEvent>((event, emit) {

    } */
    on<LoadMyArtists>((event, emit) async {
      final artists = await artistRepository.getMyArtists();
      return emit(ArtistsLoaded(artists));
    });
  }
  final ArtistRepository artistRepository;

  @override
  Stream<MyArtistsBlocState> mapEventToState(MyArtistsBlocEvent event) async* {
    if (event is LoadMyArtists) {
      yield LoadingArtists();
      final artists = await artistRepository.getMyArtists();
      yield ArtistsLoaded(artists);
    } else {
      yield ArtistsError('unknown event $event');
    }
  }
}
