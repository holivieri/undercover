import '../models/artist_model.dart';
import '../services/artists_service.dart';

class ArtistRepository {
  ArtistRepository(this._artistService);

  final ArtistService _artistService;

  Future<List<Artist>> getMyArtists() async {
    //check cache
    return _artistService.getMyArtists();
  }
}
