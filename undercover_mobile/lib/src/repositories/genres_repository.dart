import '../models/genre_model.dart';
import '../services/genres_service.dart';

class GenresRespository {
  GenresRespository(this._genresService);

  final GenresService _genresService;

  static List<Genre> _cacheList = <Genre>[];
  static DateTime _lastUpdate = DateTime.now().toUtc();
  static const maxTimeCache = 60;

  Future<List<Genre>> getGenres() async {
    if (_cacheList.isEmpty) {
      _cacheList = await _genresService.getAllGenres();
      _lastUpdate = DateTime.now().toUtc();
    } else if (DateTime.now().toUtc().difference(_lastUpdate).inMinutes >
        maxTimeCache) {
      _cacheList = await _genresService.getAllGenres();
      _lastUpdate = DateTime.now().toUtc();
    }

    return _cacheList;
  }
}
