import 'dart:convert';

import 'package:http/http.dart';

import '../models/genre_model.dart';
import '../utils/http.dart';

class GenresService {
  Future<List<Genre>> getAllGenres() async {
    final _apiResponse = await Client().get(
      Uri.parse('$apiUrl/Genre'),
      headers: returnUndercoverHeaders(),
    );

    if (_apiResponse.statusCode != 200) {
      assert(
        _apiResponse.statusCode == 200,
        'Genres endpoint is NOT working',
      );
      return [];
    }

    final List _decodedResponse = json.decode(
      _apiResponse.body,
    );

    return [
      for (final Map<String, dynamic> _record in _decodedResponse)
        Genre.fromJson(_record)
    ];
  }
}
