part of 'places_bloc.dart';

@immutable
abstract class PlacesState {}

class PlacesInitial extends PlacesState {}

class LoadingPlaces extends PlacesState {}

class PlacesLoaded extends PlacesState {
  PlacesLoaded(this.places);

  final List<Place> places;
}

class PlacesError extends PlacesState {
  PlacesError(this.errorMessage);

  final String errorMessage;
}
