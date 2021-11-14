import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/concert_model.dart';
import '../../repositories/concerts_repository.dart';

part 'concerts_event.dart';
part 'concerts_state.dart';

class ConcertsBloc extends Bloc<ConcertsEvent, ConcertsState> {
  ConcertsBloc(this.concertsRepository) : super(ConcertsInitial()) {
    on<LoadNextConcerts>((event, emit) async {
      final nextConcerts = await concertsRepository.getNextConcerts();
      emit(NextConcertsLoaded(nextConcerts));
    });
  }

  final ConcertsRepository concertsRepository;
}
