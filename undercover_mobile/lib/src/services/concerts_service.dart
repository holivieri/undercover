import 'dart:convert';

import 'package:http/http.dart';

import '../models/concert_model.dart';
import '../utils/http.dart';

class ConcertsService {
  Future<List<Concert>> getConcerts() async {
    final _apiResponse = await Client().get(
      Uri.parse('$apiUrl/Concert'),
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
