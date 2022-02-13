part of 'gps_bloc.dart';

class GpsState extends Equatable {
  const GpsState({
    required this.isGpsEnabled,
    required this.isGpsPermissionGranted,
  });

  GpsState copyWith({
    bool? isGpsEnabled,
    bool? isGpsPermissionGranted,
  }) =>
      GpsState(
          isGpsEnabled: isGpsEnabled ?? this.isGpsEnabled,
          isGpsPermissionGranted:
              isGpsPermissionGranted ?? this.isGpsPermissionGranted);

  final bool isGpsEnabled;
  final bool isGpsPermissionGranted;

  @override
  List<Object> get props => [
        isGpsEnabled,
        isGpsPermissionGranted,
      ];

  @override
  String toString() =>
      '{ isGpsEnabled: $isGpsEnabled, isGpsPermissionGranted: $isGpsPermissionGranted }';
}
