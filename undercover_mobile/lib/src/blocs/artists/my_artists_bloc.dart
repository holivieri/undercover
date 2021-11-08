import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:undercover_mobile/src/models/artist_model.dart';
import 'package:undercover_mobile/src/repositories/artists_repository.dart';

part 'my_artists_bloc_event.dart';
part 'my_artists_bloc_state.dart';

class MyArtistsBloc extends Bloc<MyArtistsBlocEvent, MyArtistsBlocState> {
  MyArtistsBloc(this.artistRepository) : super(MyArtistsBlocInitial()) {
    on<MyArtistsBlocEvent>((event, emit) {
      // TODO: implement event handler
      if (event is LoadMyArtists) {}
    });
  }
  final ArtistRepository artistRepository;

  @override
  Stream<MyArtistsBlocState> mapEventToState(MyArtistsBlocEvent event) async* {
    if (event is LoadMyArtists) {
      yield LoadingArtists();
      final artists = artistRepository.getMyArtists();
      yield ArtistsLoaded(artists);
    } else {
      yield ArtistsError('unknown event $event');
    }
  }
}
