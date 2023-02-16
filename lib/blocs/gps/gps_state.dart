part of 'gps_bloc.dart';

class GpsState extends Equatable {
  final bool isGpsEnabled;
  final bool isGpsPermissionGranted;

  bool get isReady => isGpsEnabled && isGpsPermissionGranted;

  //cuando se ponen las llaves indica que los parametros serà por nombre
  const GpsState(
      {required this.isGpsEnabled, required this.isGpsPermissionGranted});

  //metodo que regresa una copia del estado actual
// marca error tiene que ser con flecha.......
/*
  GpsState copyWith
    ({
    bool? isGpsEnabled,
    bool? isGpsPermissionGranted
    }) 
    {
      GpsState(
          isGpsEnabled: isGpsEnabled ?? this.isGpsEnabled,
          isGpsPermissionGranted:
              isGpsPermissionGranted ?? this.isGpsPermissionGranted);
    }
*/

  GpsState copyWith(
          {bool? isGpsEnabled, bool? isGpsPermissionGranted}) =>
      GpsState(
          isGpsEnabled: isGpsEnabled ?? this.isGpsEnabled,
          isGpsPermissionGranted:
              isGpsPermissionGranted ?? this.isGpsPermissionGranted);

  @override
  // aca van las variables que van a permitir determinar si ha cambiado el estado o no
  List<Object> get props => [isGpsEnabled, isGpsPermissionGranted];

  @override
  // para cuando se manda un print,
  String toString() =>
      '{ isGpsEnable: $isGpsEnabled, isGpsPermiisionGranted: $isGpsPermissionGranted }';
}
