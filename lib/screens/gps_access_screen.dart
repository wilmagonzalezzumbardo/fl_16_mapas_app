import 'package:fl_16_mapas_app/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GpsAccessScreen extends StatelessWidget {
  const GpsAccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<GpsBloc, GpsState>(builder: (context, state) {
          print("dentro del gps_access_screen.... state: $state");
          return state.isGpsEnabled == true
              ? _EnabledGpsMessage()
              : _AccessButton();
        }),
      ),
      //_AccessButton(),
    );
  }
}

class _AccessButton extends StatelessWidget {
  const _AccessButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            'Es necesario el acceso al GPS',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
          ),
        ),
        MaterialButton(
            color: Colors.black,
            shape: StadiumBorder(),
            elevation: 0,
            splashColor: Colors.transparent,
            child: Text(
              'Solicitar Acceso',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              
              final gpsBloc = BlocProvider.of<GpsBloc>(context);
              //final gpsBloc = context.read<GpsBloc>();
              gpsBloc.askGpsAccess();
              
              print('en el boton');
            }),
      ],
    );
  }
}

class _EnabledGpsMessage extends StatelessWidget {
  const _EnabledGpsMessage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Debe de habilitar el GPS',
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
      ),
    );
  }
}
