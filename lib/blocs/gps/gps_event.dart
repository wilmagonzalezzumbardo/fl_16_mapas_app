part of 'gps_bloc.dart';

abstract class GpsEvent extends Equatable {
  const GpsEvent();

  @override
  List<Object> get props => [];
}

//evento que modificará el estado
class OnGpsPermissionEvent extends GpsEvent {
  final bool isGpsEnable;
  final bool isGpsPermissionGranted;
  OnGpsPermissionEvent({
    required this.isGpsEnable, 
    required this.isGpsPermissionGranted});
}
