import 'package:fl_16_mapas_app/blocs/blocs.dart';
import 'package:fl_16_mapas_app/screens/gps_access_screen.dart';
import 'package:fl_16_mapas_app/screens/map_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<GpsBloc, GpsState>(builder: (context, state) {
      print("en el loadign screen-v scaffold  state.isReady $state.isReady");
      return state.isReady ? MapScreen() : GpsAccessScreen();
    }));
  }
}
