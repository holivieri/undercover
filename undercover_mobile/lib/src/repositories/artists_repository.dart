import 'package:undercover_mobile/src/models/artist_model.dart';
import 'package:undercover_mobile/src/services/artists_service.dart';

class ArtistRepository {
  final ArtistService _artistService;

  ArtistRepository(this._artistService);

  List<Artist> getMyArtists() {
    //check cache
    return _artistService.getMyArtists();
  }
}
