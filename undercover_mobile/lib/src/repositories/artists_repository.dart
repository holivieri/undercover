import '../models/artist_model.dart';
import '../services/artists_service.dart';

class ArtistRepository {
  ArtistRepository(this._artistService);

  final ArtistService _artistService;

  static List<Artist> _cacheList = <Artist>[];
  static DateTime _lastUpdate = DateTime.now().toUtc();
  static const maxTimeCache = 15;

  Future<List<Artist>> getMyArtists() async {
    if (_cacheList.isEmpty) {
      _cacheList = await _artistService.getMyArtists();
      _lastUpdate = DateTime.now().toUtc();
    } else if (DateTime.now().toUtc().difference(_lastUpdate).inMinutes >
        maxTimeCache) {
      _cacheList = await _artistService.getMyArtists();
      _lastUpdate = DateTime.now().toUtc();
    }

    return _cacheList;
  }

  Future<Artist?> getArtist(String id) async {
    //check cache
    if (_cacheList.any((element) => element.id == id)) {
      return _cacheList.where((artist) => artist.id == id).first;
    } else {
      return _artistService.getArtist(id);
    }
  }
}
