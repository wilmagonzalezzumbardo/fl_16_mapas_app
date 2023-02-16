import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
part 'gps_event.dart';
part 'gps_state.dart';

class GpsBloc extends Bloc<GpsEvent, GpsState> {
  StreamSubscription? gpsServiceSubscription;

  GpsBloc()
      : super(GpsState(isGpsEnabled: false, isGpsPermissionGranted: false)) {
    on<GpsEvent>((event, emit) {
      // TODO: implement event handler
    });
    /*
    on<OnGpsPermissionEvent>
    (
      (event, emit)
      {
        emit(state.copyWith(
          isGpsEnabled: event.isGpsEnable,
          isGpsPermissionGranted:  event.isGpsPermissionGranted
        ));
      }
    );
    */
    on<OnGpsPermissionEvent>((event, emit) => emit(state.copyWith(
        isGpsEnabled: event.isGpsEnable,
        isGpsPermissionGranted: event.isGpsPermissionGranted)));
    _init();
  }

  Future<void> _init() async {
    /*
    final isEnable = await _checkGpsState();
    final isGranted = await _chekPermissedGranted();
    print('_init .... isEnable $isEnable   is granted... $isGranted');
    add(OnGpsPermissionEvent(
        isGpsEnable: isEnable, isGpsPermissionGranted: isGranted));
    */
    final gpsInitStatus = await Future.wait(
      [
        _checkGpsState(),
        _chekPermissedGranted()
      ]
    );
    add(OnGpsPermissionEvent(
        isGpsEnable: gpsInitStatus[0], isGpsPermissionGranted: gpsInitStatus[1]));
  }

  Future<bool> _chekPermissedGranted() async {
    final isGranted = await Permission.location.isGranted;
    return isGranted;
  }

  Future<bool> _checkGpsState() async {
    print("dentro del _checkGpsState");
    final isEnable = await Geolocator.isLocationServiceEnabled();
    gpsServiceSubscription =
        Geolocator.getServiceStatusStream().listen((event) {
      print('_checkGpsState .... services status $event');
      final isEnabled = (event.index == 1) ? true : false;
      print('_checkGpsState .... isEnabled $isEnabled');
      add(OnGpsPermissionEvent(
          isGpsEnable: isEnabled,
          isGpsPermissionGranted: state.isGpsPermissionGranted));
    });
    return isEnable;
  }

  Future<void> askGpsAccess() async {
    final status = await Permission.location.request();
    switch (status) {
      case PermissionStatus.granted:
        // TODO: Handle this case.
        add(OnGpsPermissionEvent(
            isGpsEnable: state.isGpsEnabled, isGpsPermissionGranted: true));
        //openAppSettings();
        break;

      case PermissionStatus.denied:
      case PermissionStatus.restricted:
      case PermissionStatus.limited:
      case PermissionStatus.permanentlyDenied:
        add(OnGpsPermissionEvent(
            isGpsEnable: state.isGpsEnabled, isGpsPermissionGranted: false));
        openAppSettings();
    }
  }

  @override
  Future<void> close() {
    // TODO: implement close
    gpsServiceSubscription?.cancel();
    return super.close();
  }
}
