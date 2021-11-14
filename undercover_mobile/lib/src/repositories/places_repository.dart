import '../models/place_mode.dart';
import '../services/places_service.dart';

class PlacesRepository {
  PlacesRepository(this.placesService);

  final PlacesService placesService;

  Future<List<Place>> getAllPlaces() async {
    return placesService.getAllPlaces();
  }
}
