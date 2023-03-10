import 'package:fl_16_mapas_app/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/blocs.dart';

class BtnCurrentLocation extends StatelessWidget {
  const BtnCurrentLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locationBloc = BlocProvider.of<LocationBloc>(context);
    final mapBloc = BlocProvider.of<MapBloc>(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: CircleAvatar(
        backgroundColor: Colors.yellow,
        maxRadius: 25,
        child: IconButton(
          icon: Icon(
            Icons.my_location_outlined,
            color: Colors.deepOrange,
          ),
          onPressed: () {
            print("en el onpressed del boton....");
            final userLocation = locationBloc.state.lastKnowPosition;
            /*
            final snack = SnackBar(content: Text("miguel y wilma"));
            */
            
            if (userLocation == null) 
            {
              final snack = CustomSnackBar(
                cTexto: "Alita, miguel y yo",
                btnLabel: "Salir",
                duration: Duration(seconds: 10),
                onOk: () {
                  print(" ONOK.... en el on press duration 10 secons");
                },
              );
              ScaffoldMessenger.of(context).showSnackBar(snack);
            }
            else
            {
              mapBloc.moveCamera(userLocation);
            }
          },
        ),
      ),
    );
  }
}
