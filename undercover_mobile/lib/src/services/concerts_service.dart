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

  Future<bool> updateAssistance(
      {required String concertId, required bool attendance}) async {
    final _apiResponse = await Client().post(
      Uri.parse(
          '$apiUrl/Concert/SetAssistance?concertId=$concertId&attendance=$attendance'),
      headers: returnUndercoverHeaders(),
    );

    if (_apiResponse.statusCode != 200) {
      assert(
        _apiResponse.statusCode == 200,
        'Concert endpoint is NOT working',
      );
      return false;
    }
    return _apiResponse.body.toLowerCase() == 'true';
  }

  Future<bool> checkUserAttendance({required String concertId}) async {
    final _apiResponse = await Client().get(
      Uri.parse('$apiUrl/Concert/checkUserAttendance?concertId=$concertId'),
      headers: returnUndercoverHeaders(),
    );

    if (_apiResponse.statusCode != 200) {
      assert(
        _apiResponse.statusCode == 200,
        'Concert endpoint is NOT working',
      );
      return false;
    }
    return _apiResponse.body.toLowerCase() == 'true';
  }
}
