part of 'concerts_bloc.dart';

@immutable
abstract class ConcertsState {}

class ConcertsInitial extends ConcertsState {}

class LoadingNextConcerts extends ConcertsState {}

class NextConcertsLoaded extends ConcertsState {
  NextConcertsLoaded(this.concerts);

  final List<Concert> concerts;
}
