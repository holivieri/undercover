import 'dart:convert';

import 'package:http/http.dart';

import '../models/concert_model.dart';
import '../utils/http.dart';

class ConcertsService {
  Future<Concert?> getConcert(String concertId) async {
    final _apiResponse = await Client().get(
      Uri.parse('$apiUrl/Concert/$concertId'),
      headers: returnUndercoverHeaders(),
    );

    if (_apiResponse.statusCode != 200) {
      assert(
        _apiResponse.statusCode == 200,
        'Get Concert endpoint is NOT working',
      );
      return null;
    }

    final Concert _concert = Concert.fromJson(json.decode(_apiResponse.body));

    return _concert;
  }

  Future<List<Concert>> getNextConcerts() async {
    final _apiResponse = await Client().get(
      Uri.parse('$apiUrl/Concert/GetNextConcerts'),
      headers: returnUndercoverHeaders(),
    );

    if (_apiResponse.statusCode != 200) {
      assert(
        _apiResponse.statusCode == 200,
        'Concert endpoint is NOT working',
      );
      return [];
    }

    final List _decodedResponse = json.decode(
      _apiResponse.body,
    );

    return [
      for (final Map<String, dynamic> _record in _decodedResponse)
        Concert.fromJson(_record)
    ];
  }
}
