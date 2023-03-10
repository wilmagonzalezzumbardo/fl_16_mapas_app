import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../blocs/map/map_bloc.dart';

class MapView1 extends StatelessWidget {
  final LatLng initialPosition;
  const MapView1({Key? key, required this.initialPosition}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mapBloc = BlocProvider.of<MapBloc>(context);
    final CameraPosition initialCameraPosition = CameraPosition(
      target: initialPosition,
      zoom: 14.4746,
    );
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height,
      child: GoogleMap(
        mapType: MapType.normal,
        compassEnabled: true,
        myLocationEnabled: true,
        initialCameraPosition: initialCameraPosition,
        zoomControlsEnabled: false,
        myLocationButtonEnabled: false,
        onMapCreated: (controller) => mapBloc.add(onMapInitializedEvent(controller)),
        ),
        //marcadores
        //polylines
        //cuando se mueve el mapa
      );
    
  }
}
