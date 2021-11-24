import '../models/concert_model.dart';
import '../services/concerts_service.dart';

class ConcertsRepository {
  ConcertsRepository(this._concertsService);

  final ConcertsService _concertsService;

  static List<Concert> _cacheList = <Concert>[];
  static DateTime _lastUpdate = DateTime.now().toUtc();
  static const maxTimeCache = 15;

  Future<List<Concert>> getNextConcerts() async {
    if (_cacheList.isEmpty) {
      _cacheList = await _concertsService.getNextConcerts();
      _lastUpdate = DateTime.now().toUtc();
    } else if (DateTime.now().toUtc().difference(_lastUpdate).inMinutes >
        maxTimeCache) {
      _cacheList = await _concertsService.getNextConcerts();
      _lastUpdate = DateTime.now().toUtc();
    }

    return _cacheList;
  }

  Future<Concert?> getConcert(String concertId) async {
    //check cache
    if (_cacheList.any((concert) => concert.id == concertId)) {
      return _cacheList.where((concert) => concert.id == concertId).first;
    } else {
      return _concertsService.getConcert(concertId);
    }
  }
}
