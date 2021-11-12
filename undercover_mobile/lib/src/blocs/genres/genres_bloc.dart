import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/genre_model.dart';
import '../../repositories/genres_repository.dart';

part 'genres_event.dart';
part 'genres_state.dart';

class GenresBloc extends Bloc<GenresEvent, GenresState> {
  GenresBloc(this.genresRepository) : super(GenresInitial()) {
    on<LoadGenres>((event, emit) async {
      try {
        final list = await genresRepository.getGenres();

        emit(GenresLoaded(list));
      } on Exception catch (_) {
        emit(GenresError('No pudimos cargar los generos musicales'));
      }
    });
  }

  final GenresRespository genresRepository;
}
