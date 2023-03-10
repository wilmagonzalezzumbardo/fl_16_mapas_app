import 'package:flutter/material.dart';

class CustomSnackBar extends SnackBar {

  CustomSnackBar({
    Key? key, 
    required cTexto, 
    String btnLabel = 'Ok',
    Duration duration = const Duration (seconds:  2),
    VoidCallback? onOk,
    }) : super(
    key: key,
    content: Text(cTexto),
    duration: duration,
    action: SnackBarAction(
      label: btnLabel, 
      onPressed: (){
        if (onOk != null )
        {
          onOk;
        }
        
      }
    ),
  );
}
