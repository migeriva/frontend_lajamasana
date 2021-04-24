import 'package:flutter/material.dart';

class Constantes {
  //URL
  //No usadas
  static final String urlPerfiles = "";
  static final String urlSuscripciones = "";
  static final String urlUsuarios = "";
  static final String urlImages =
      "http://10.0.3.2:8000/static"; //Esto depende del emulador donde esten
  //TextStyle

  static final TextStyle styleLogo = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.bold,
    fontFamily: "Lato",
    color: Colors.green,
  );

  static final TextStyle styleLabel = TextStyle(
      fontSize: 17,
      fontFamily: "Lato",
      fontWeight: FontWeight.bold,
      color: Colors.black);

  static final styleButton = (Color color) => ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(color),
        shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
      );

  static final dropdownMenuItemStyle = (String value) => Container(
        padding: EdgeInsets.all(10),
        child: Text(
          value,
          style: TextStyle(
            fontSize: 17,
            fontStyle: FontStyle.italic,
            color: Colors.black,
            fontFamily: "Roboto",
          ),
        ),
      );
  //Listas
  static final List<String> dias = [
    "Lunes",
    "Martes",
    "Miércoles",
    "Jueves",
    "Viernes",
    "Sábado",
    "Domingo"
  ];
}
