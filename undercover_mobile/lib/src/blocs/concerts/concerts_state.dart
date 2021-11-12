part of 'concerts_bloc.dart';

@immutable
abstract class ConcertsState {}

class ConcertsInitial extends ConcertsState {}

class LoadingConcerts extends ConcertsState {}

class ConcertsLoaded extends ConcertsState {
  ConcertsLoaded(this.concerts);

  final List<Concert> concerts;
}
