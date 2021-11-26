import 'dart:convert';

import 'package:http/http.dart';

import '../models/artist_model.dart';
import '../models/twitter_response_model.dart';
import '../utils/http.dart';

class ArtistService {
  Future<Artist?> getArtist(String id) async {
    final _apiResponse = await Client().get(
      Uri.parse('$apiUrl/Artist/$id'),
      headers: returnUndercoverHeaders(),
    );

    if (_apiResponse.statusCode != 200) {
      assert(
        _apiResponse.statusCode == 200,
        'Artist endpoint is NOT working',
      );
      return null;
    }

    final Artist artist = Artist.fromJson(
      json.decode(
        _apiResponse.body,
      ),
    );

    return artist;
  }

  Future<TweeterResponse?> getTweets() async {
    final _apiResponse = await Client().get(
      Uri.parse('$apiUrl/Artist/GetTweets'),
      headers: returnUndercoverHeaders(),
    );

    if (_apiResponse.statusCode != 200) {
      assert(
        _apiResponse.statusCode == 200,
        'Tweets endpoint is NOT working',
      );
      return null;
    }

    final _decodedResponse = json.decode(
      _apiResponse.body,
    );

    return TweeterResponse.fromJson(_decodedResponse);
  }

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

    final List _decodedResponse = json.decode(
      _apiResponse.body,
    );

    return [
      for (final Map<String, dynamic> _record in _decodedResponse)
        Artist.fromJson(_record)
    ];
  }
}
