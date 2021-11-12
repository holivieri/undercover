import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/concert_model.dart';

part 'concerts_event.dart';
part 'concerts_state.dart';

class ConcertsBloc extends Bloc<ConcertsEvent, ConcertsState> {
  ConcertsBloc() : super(ConcertsInitial()) {
    on<ConcertsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
