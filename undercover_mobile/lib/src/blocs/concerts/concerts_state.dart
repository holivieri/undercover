part of 'concerts_bloc.dart';

@immutable
abstract class ConcertsState {}

class ConcertsInitial extends ConcertsState {}

class LoadingNextConcerts extends ConcertsState {}

class NextConcertsLoaded extends ConcertsState {
  NextConcertsLoaded(this.concerts);

  final List<Concert> concerts;
}

class LoadingConcert extends ConcertsState {}

class ConcertLoaded extends ConcertsState {
  ConcertLoaded(this.concert);

  final Concert concert;
}

class ConcertError extends ConcertsState {
  ConcertError(this.errorMessage);

  final String errorMessage;
}
