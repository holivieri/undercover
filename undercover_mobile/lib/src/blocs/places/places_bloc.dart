import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/place_model.dart';
import '../../repositories/places_repository.dart';

part 'places_event.dart';
part 'places_state.dart';

class PlacesBloc extends Bloc<PlacesEvent, PlacesState> {
  PlacesBloc(this.placesRepository) : super(PlacesInitial()) {
    on<LoadPlaces>((event, emit) async {
      final list = await placesRepository.getAllPlaces();
      emit(PlacesLoaded(list));
    });
    on<FetchPlace>((event, emit) async {
      final place = await placesRepository.getPlace(event.placeId);
      if (place == null) {
        emit(PlacesError('No existe ese lugar'));
      } else {
        emit(PlaceLoaded(place));
      }
    });
  }

  final PlacesRepository placesRepository;
}
