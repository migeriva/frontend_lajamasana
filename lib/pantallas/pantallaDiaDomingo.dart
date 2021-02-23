import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lajamasana/hexagono.dart';

class PantallaDomingo extends StatefulWidget {
  @override
  _PantallaDomingoState createState() => _PantallaDomingoState();
}

//Hexagono(0xff969FAA, "Lunes", 0)
class _PantallaDomingoState extends State<PantallaDomingo> {
  var listaDias = [
    "Lunes",
    "Martes",
    "Miercoles",
    "Jueves",
    "Viernes",
    "Sabado",
    "Domingo"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        crearFondo(context),
        contenedorPrincipal(),
        Padding(
          padding: EdgeInsets.only(top: 200, left: 150),
          child: Hexagono(0xff969FAA, listaDias[0], 0),
        ),
        Padding(
          padding: EdgeInsets.only(top: 265, left: 50),
          child: Hexagono(0xff969FAA, listaDias[1], 0),
        ),
        Padding(
          padding: EdgeInsets.only(top: 395, left: 50),
          child: Hexagono(0xff969FAA, listaDias[2], 0),
        ),
        Padding(
          padding: EdgeInsets.only(top: 460, left: 150),
          child: Hexagono(0xff969FAA, listaDias[3], 0),
        ),
        Padding(
          padding: EdgeInsets.only(top: 395, left: 250),
          child: Hexagono(0xff969FAA, listaDias[4], 0),
        ),
        Padding(
          padding: EdgeInsets.only(top: 265, left: 250),
          child: Hexagono(0xff969FAA, listaDias[5], 0),
        ),
        Padding(
          padding: EdgeInsets.only(top: 325, left: 150),
          child: Hexagono(0xffFFFFFF, listaDias[6], 0),
        ),
      ],
    ));
  }

  //Modificar para el boton de cerrar sesion
  Widget contenedorPrincipal() {
    return Padding(
      padding: EdgeInsets.only(top: 25),
      child: Container(
        color: Colors.white,
        height: 90,
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 30, right: 30),
              child: Text(
                "Bienvenido\nAndres Morales",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "Roboto",
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 155, right: 10),
              child: Image.asset(
                "assets/imagenes/logo.png",
                width: 80,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget crearFondo(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.4,
          width: MediaQuery.of(context).size.width,
          color: Color(0xff77D353).withOpacity(0.51),
        ),
        Positioned(
          top: 160,
          child: ClipOval(
            child: Container(
              alignment: Alignment.topCenter,
              height: MediaQuery.of(context).size.height * 0.40,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
