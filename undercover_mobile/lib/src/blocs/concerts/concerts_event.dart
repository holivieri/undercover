part of 'concerts_bloc.dart';

@immutable
abstract class ConcertsEvent {}

class LoadNextConcerts extends ConcertsEvent {}

class LoadConcert extends ConcertsEvent {
  LoadConcert(this.concertId);

  final String concertId;
}
