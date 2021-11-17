part of 'places_bloc.dart';

@immutable
abstract class PlacesEvent {}

class LoadPlaces extends PlacesEvent {}

class FetchPlace extends PlacesEvent {
  FetchPlace(this.placeId);

  final String placeId;
}
