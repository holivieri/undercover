import '../models/place_model.dart';
import '../services/places_service.dart';

class PlacesRepository {
  PlacesRepository(this.placesService);

  final PlacesService placesService;

  Future<List<Place>> getAllPlaces() async {
    return placesService.getAllPlaces();
  }
}
