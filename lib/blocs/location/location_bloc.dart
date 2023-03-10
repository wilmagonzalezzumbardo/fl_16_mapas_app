import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fl_16_mapas_app/blocs/blocs.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  StreamSubscription<Position>? positionStream;

  /*
  esta clase se elimino, solo se manejará una sola clase para manejar el estado
  LocationBloc() : super(LocationInitial()) {
    on<LocationEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
  */

  LocationBloc() : super(LocationState()) {
    on<LocationEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<OnNewUserLocationEvent>((event, emit) {
      emit(state.copyWith(
        lastKnowPosition: event.newLocation,
        myLocationHistory: [...state.myLocationHistory, event.newLocation],
      ));
    });

    on<onStartFollowingUserEvent>(
      (event, emit) {
        emit(state.copyWith(followingUser: true));
      },
    );
    on<onStopFollowingUserEvent>(
      (event, emit) {
        emit(state.copyWith(followingUser: false));
      },
    );
  }

  Future getCurrentPosition() async {
    final position = await Geolocator.getCurrentPosition();
    add(OnNewUserLocationEvent(LatLng(position.latitude, position.longitude)));
    print("position $position");
    //hay que retornar un objeto de tipo latlon
  }

  void startFollowingUser() {
    // cada vez que se use algo como LISTEN, SE TIENE QUE DESTRUIR
    positionStream = Geolocator.getPositionStream().listen((event) {
      final position = event;
      add(OnNewUserLocationEvent(
          LatLng(position.latitude, position.longitude)));
      add(onStartFollowingUserEvent());
      print(event);
    });
  }

  void stopFollingUser() {
    positionStream?.cancel();
    add(onStopFollowingUserEvent());
  }

  @override
  Future<void> close() {
    // TODO: implement close
    stopFollingUser();

    return super.close();
  }
}
