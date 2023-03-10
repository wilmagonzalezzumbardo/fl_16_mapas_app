import 'dart:collection';

import 'package:fl_16_mapas_app/blocs/blocs.dart';
import 'package:fl_16_mapas_app/widgets/btncurrentlocation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:fl_16_mapas_app/views/views.dart';
//se va a cambiar a statefull widget, para usar el initstate, que se ejecuta cuando se crea por primera vez se construye el widget

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  void initState() {
    // TODO: implement initState
    final locationBloc = BlocProvider.of<LocationBloc>(context);
    //locationBloc.getCurrentPosition();
    locationBloc.startFollowingUser();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    final locationBloc = BlocProvider.of<LocationBloc>(context);
    locationBloc.stopFollingUser();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LocationBloc, LocationState>(builder: (context, state) {
        if (state.lastKnowPosition == null)
          return Center(
              child: Text(
                  "Espere un momento por favor, la ultima posicòn es nula"));
        //return Center (child: Text("hola"));
        return SingleChildScrollView(
          child: Stack(
            children: [
              /*
              SizedBox
              (
                height: 30,
                width: 40,
              ),
              Icon
              (
                Icons.abc,
                size: 50,
              ),
              //Text("hola Wilma"),
              */
              MapView1(initialPosition: state.lastKnowPosition!),
            ],
          ),
        );
        /*
        return Center
        (
          child: Text( "la ubicaciòn es latitud:  ${state.lastKnowPosition!.latitude} longitud:  ${state.lastKnowPosition!.longitude}"),
        );
        */
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          /*
          IconButton(
              onPressed: () {
                print("on pressed del floatin");
              },
              icon: Icon(
                Icons.my_location_outlined,
                color: Colors.yellow,
                size: 40,
              )),
            */
            BtnCurrentLocation(),
        ],
      ),
    );
  }
}
