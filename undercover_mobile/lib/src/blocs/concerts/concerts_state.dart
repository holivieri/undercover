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
  ConcertLoaded({required this.concert, required this.attendance});

  final Concert concert;
  final bool attendance;
}

class ConcertError extends ConcertsState {
  ConcertError(this.errorMessage);

  final String errorMessage;
}
