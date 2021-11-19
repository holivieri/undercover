import '../models/concert_model.dart';
import '../services/concerts_service.dart';

class ConcertsRepository {
  ConcertsRepository(this.concertsService);

  final ConcertsService concertsService;

  Future<List<Concert>> getNextConcerts() async {
    return concertsService.getNextConcerts();
  }

  Future<Concert?> getConcert(String concertId) async {
    return concertsService.getConcert(concertId);
  }
}
