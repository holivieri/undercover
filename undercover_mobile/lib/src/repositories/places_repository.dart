import '../models/place_model.dart';
import '../services/places_service.dart';

class PlacesRepository {
  PlacesRepository(this._placesService);

  final PlacesService _placesService;
  static List<Place> _cacheList = <Place>[];
  static DateTime _lastUpdate = DateTime.now().toUtc();
  static const maxTimeCache = 15;

  Future<List<Place>> getAllPlaces() async {
    if (_cacheList.isEmpty) {
      _cacheList = await _placesService.getAllPlaces();
      _lastUpdate = DateTime.now().toUtc();
    } else if (DateTime.now().toUtc().difference(_lastUpdate).inMinutes >
        maxTimeCache) {
      _cacheList = await _placesService.getAllPlaces();
      _lastUpdate = DateTime.now().toUtc();
    }
    return _cacheList;
  }

  Future<Place?> getPlace(String id) async {
    //check cache
    if (_cacheList.any((place) => place.id == id)) {
      return _cacheList.where((place) => place.id == id).first;
    } else {
      return _placesService.getPlace(id);
    }
  }
}
