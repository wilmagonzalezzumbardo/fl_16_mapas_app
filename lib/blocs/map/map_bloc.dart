import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fl_16_mapas_app/themes/themes.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  GoogleMapController? _mapController;

  MapBloc() : super(MapState()) {
    on<MapEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<onMapInitializedEvent>(_onInitMap);

    /*
    on<onMapInitializedEvent>(
      (event, emit) {
        emit(state.copyWith(isMapInitialized: true));
      },
    );
    */
  }

  void moveCamera(LatLng newLocation) {
    final cameraUpdate = CameraUpdate.newLatLng(newLocation);
    _mapController?.animateCamera(cameraUpdate);
  }

  void _onInitMap(onMapInitializedEvent event, Emitter<MapState> emit) {
    _mapController = event.controller;
    _mapController!.setMapStyle(jsonEncode(ubertMapThemeNoche));
    /*
    _mapController.moveCamera(cameraUpdate)
    _mapController.animateCamera(cameraUpdate);
    */

    emit(state.copyWith(isMapInitialized: true));
  }
}
