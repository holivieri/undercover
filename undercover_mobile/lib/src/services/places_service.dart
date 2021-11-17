import 'dart:convert';

import 'package:http/http.dart';
import '../models/place_model.dart';

import '../utils/http.dart';

class PlacesService {
  Future<Place?> getPlace(String id) async {
    final _apiResponse = await Client().get(
      Uri.parse('$apiUrl/Place/$id'),
      headers: returnUndercoverHeaders(),
    );

    if (_apiResponse.statusCode != 200) {
      assert(
        _apiResponse.statusCode == 200,
        'Place endpoint is NOT working',
      );
      return null;
    }
    final Place place = Place.fromJson(
      json.decode(
        _apiResponse.body,
      ),
    );

    return place;
  }

  Future<List<Place>> getAllPlaces() async {
    final _apiResponse = await Client().get(
      Uri.parse('$apiUrl/Place'),
      headers: returnUndercoverHeaders(),
    );

    if (_apiResponse.statusCode != 200) {
      assert(
        _apiResponse.statusCode == 200,
        'Places endpoint is NOT working',
      );
      return [];
    }

    final List _decodedResponse = json.decode(
      _apiResponse.body,
    );

    return [
      for (final Map<String, dynamic> _record in _decodedResponse)
        Place.fromJson(_record)
    ];
  }
}
