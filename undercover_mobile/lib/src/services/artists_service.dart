import 'dart:convert';

import 'package:http/http.dart';

import '../models/artist_model.dart';
import '../models/artist_profile_request_model.dart';
import '../models/twitter_response_model.dart';
import '../models/user_preferences.dart';
import '../models/youtube_response_model.dart';
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

  Future<YoutubeResponse?> getYoutubeVideos() async {
    final _apiResponse = await Client().get(
      Uri.parse('$apiUrl/Artist/GetYoutubeVideos'),
      headers: returnUndercoverHeaders(),
    );

    if (_apiResponse.statusCode != 200) {
      assert(
        _apiResponse.statusCode == 200,
        'GetYoutubeVideos endpoint is NOT working',
      );
      return null;
    }

    final _decodedResponse = json.decode(
      _apiResponse.body,
    );

    return YoutubeResponse.fromJson(_decodedResponse);
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

  Future<List<Artist>> searchArtist(String artistName) async {
    final _apiResponse = await Client().get(
      Uri.parse('$apiUrl/Artist/Search?name=$artistName'),
      headers: returnUndercoverHeaders(),
    );

    if (_apiResponse.statusCode != 200) {
      assert(
        _apiResponse.statusCode == 200,
        'Artists Search endpoint is NOT working',
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

  Future<bool> createNewArtistProfile(
    ArtistProfileRequest artistProfile,
  ) async {
    final _apiResponse = await Client().post(
      Uri.parse('$apiUrl/User/CreateProfile'),
      headers: returnUndercoverHeaders(),
      body: jsonEncode(artistProfile),
    );

    if (_apiResponse.statusCode != 200) {
      assert(
        _apiResponse.statusCode == 200,
        'CreateProfile endpoint is NOT working',
      );
      return false;
    }
    UserPreferences().profile = myProfile.artist;

    return true;
  }
}
