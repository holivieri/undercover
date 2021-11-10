import 'dart:convert';

import 'package:http/http.dart';

import '../models/artist_model.dart';
import '../utils/http.dart';

class ArtistService {
  Future<List<Artist>> getMyArtists() async {
    final _apiResponse = await Client().get(
      Uri.parse('$apiUrl/Artist'),
      headers: returnUndercoverHeaders(),
    );

    if (_apiResponse.statusCode != 200) {
      assert(
        _apiResponse.statusCode == 200,
        'Artists endpoint is NOT working',
      );
      return [];
    }

/*     Map<String, dynamic> _apiResponseBody;
    try {
      _apiResponseBody = json.decode(_apiResponse.body);
    } on Exception catch (error) {
      return [];
    } */

    final List _decodedResponse = json.decode(
      _apiResponse.body,
    );

    return [
      for (final Map<String, dynamic> _record in _decodedResponse)
        Artist.fromJson(_record)
    ];
  }
}
