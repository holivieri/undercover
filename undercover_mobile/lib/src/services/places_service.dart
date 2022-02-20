import 'dart:convert';

import 'package:geocoding/geocoding.dart';
import 'package:http/http.dart';

import '../models/place_model.dart';
import '../models/place_owner_profile_request_model.dart';
import '../models/user_preferences.dart';
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

  Future<bool> createNewPlaceOwnerProfile(
    PlaceOwnerProfileRequest placeProfile,
  ) async {
    try {
      final List<Location> locations = await locationFromAddress(
          '${placeProfile.place.streetName}, ${placeProfile.place.city}, ${placeProfile.place.country.name}');

      if (locations.isNotEmpty) {
        print(
            'Latitude: ${locations[0].latitude} Longitude: ${locations[0].longitude}');
        placeProfile.place.latitude = locations[0].latitude;
        placeProfile.place.longitude = locations[0].longitude;
      }
    } on Exception catch (err) {
      print('Error $err');
    }

    final _apiResponse = await Client().post(
      Uri.parse('$apiUrl/User/CreateProfile'),
      headers: returnUndercoverHeaders(),
      body: jsonEncode(placeProfile),
    );

    if (_apiResponse.statusCode != 200) {
      assert(
        _apiResponse.statusCode == 200,
        'CreateProfile endpoint is NOT working',
      );
      return false;
    }
    UserPreferences().profile = myProfile.owner;
    return true;
  }
}
