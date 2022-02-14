import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

part 'gps_event.dart';
part 'gps_state.dart';

class GpsBloc extends Bloc<GpsEvent, GpsState> {
  GpsBloc()
      : super(const GpsState(
            isGpsEnabled: false, isGpsPermissionGranted: false)) {
    on<GpsAndPermissionEvent>((event, emit) {
      emit(state.copyWith(
        isGpsEnabled: event.isGpsEnabled,
        isGpsPermissionGranted: event.isGpsPermissionsGranted,
      ));
    });

    _init();
  }

  StreamSubscription? gpsServiceSubscription;

  Future<void> _init() async {
    final bool isEnabled = await _checkGpsStatus();
    add(
      GpsAndPermissionEvent(
          isGpsEnabled: isEnabled,
          isGpsPermissionsGranted: state.isGpsPermissionGranted),
    );
  }

  Future<bool> _checkGpsStatus() async {
    final bool isEnable = await Geolocator.isLocationServiceEnabled();

    gpsServiceSubscription =
        Geolocator.getServiceStatusStream().listen((event) {
      final bool isEnabled;
      if (event.index == 1) {
        isEnabled = true;
      } else {
        isEnabled = false;
      }
      add(
        GpsAndPermissionEvent(
            isGpsEnabled: isEnabled,
            isGpsPermissionsGranted: state.isGpsPermissionGranted),
      );
    });

    return isEnable;
  }

  @override
  Future<void> close() {
    gpsServiceSubscription?.cancel();
    return super.close();
  }
}
