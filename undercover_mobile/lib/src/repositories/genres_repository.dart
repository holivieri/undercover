import '../models/genre_model.dart';
import '../services/genres_service.dart';

class GenresRespository {
  GenresRespository(this.service);

  final GenresService service;

  Future<List<Genre>> getGenres() async {
    return service.getAllGenres();
  }
}
