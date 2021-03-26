import 'package:flutter/material.dart';

class Constantes {
  //URL
  //No usadas
  static final String urlPerfiles = "";
  static final String urlSuscripciones = "";
  static final String urlUsuarios = "";

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

  static final styleButton = (color) => ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Color(color)),
        shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
      );

  //Listas

  static final List<String> dias = [
    "Lunes",
    "Martes",
    "Miercoles",
    "Jueves",
    "Viernes",
    "Sabado",
    "Domingo"
  ];
}
