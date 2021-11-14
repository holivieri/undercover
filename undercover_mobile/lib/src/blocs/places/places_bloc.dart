import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/place_mode.dart';
import '../../repositories/places_repository.dart';

part 'places_event.dart';
part 'places_state.dart';

class PlacesBloc extends Bloc<PlacesEvent, PlacesState> {
  PlacesBloc(this.placesRepository) : super(PlacesInitial()) {
    on<LoadPlaces>((event, emit) async {
      final list = await placesRepository.getAllPlaces();
      emit(PlacesLoaded(list));
    });
  }

  final PlacesRepository placesRepository;
}
