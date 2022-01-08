part of 'concerts_bloc.dart';

@immutable
abstract class ConcertsEvent {}

class ConcertInitial extends ConcertsEvent {}

class LoadNextConcerts extends ConcertsEvent {}

class UpdateAssistance extends ConcertsEvent {
  UpdateAssistance({required this.concertId, required this.attendance});

  final bool attendance;
  final String concertId;
}

class LoadConcert extends ConcertsEvent {
  LoadConcert(this.concertId);

  final String concertId;
}
