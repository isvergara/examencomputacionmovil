//ISMAEL VERGARA VIDELA
//16.936.330-7
//SEM 2 2023 | COMPUTACIÓN MÓVIL | eICFE1119-07

import 'package:flutter/material.dart';

class InputDecortions {
  static InputDecoration authInputDecoration({
    required String hinText,
    required String labelText,
    IconData? prefixIcon,
  }) {
    return InputDecoration(
        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
          color: Color.fromRGBO(46, 151, 51, 1),
        )),
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
          color: Color.fromRGBO(46, 151, 51, 1),
          width: 3,
        )),
        hintText: hinText,
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.grey),
        prefixIcon: prefixIcon != null
            ? Icon(
                prefixIcon,
                color: const Color.fromRGBO(46, 151, 51, 1),
              )
            : null);
  }
}
