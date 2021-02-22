import 'package:flutter/material.dart';
import 'package:lajamasana/pantallaDeComidas.dart';

import 'listadoDeComidas.dart';

class Hexagono extends StatefulWidget {
  int color;
  String dia;
  double calorias;

  int activo = 0;

  Hexagono(this.color, this.dia, this.calorias);

  @override
  _HexagonoState createState() => _HexagonoState();
}

class _HexagonoState extends State<Hexagono> {
  @override
  Widget build(BuildContext context) {
    if (widget.dia == "Domingo") {
      return ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: ClipPath(
          clipper: MyCustomClipper(),
          child: Container(
              color: Color(widget.color),
              height: 120,
              width: 120,
              child: Container(
                  padding: EdgeInsets.only(top: 25),
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        child: RaisedButton(
                          child: Padding(
                              padding: EdgeInsets.only(top: 3, left: 3),
                              child: Image.asset(
                                  "assets/imagenes/carrodecompras.png")),
                          color: Color(0xff4FD053),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ListadoComidas()));
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                        ),
                      )
                    ],
                  ))),
        ),
      );
    }
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: ClipPath(
        clipper: MyCustomClipper(),
        child: Container(
            height: 120,
            width: 120,
            child: RaisedButton(
              color: Color(0xff77D353).withOpacity(.65),
              onPressed: widget.activo == 0
                  ? () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ListadoComidas()));
                    }
                  : () {
                      print("Dia " + widget.dia);
                    },
              child: Container(
                  padding: EdgeInsets.only(top: 30),
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Text(
                        widget.dia + "\n",
                        style: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 15,
                          color: Colors.black,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      Text(
                        widget.calorias.toStringAsFixed(0) + " Kcal",
                        style: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 15,
                          color: Colors.black,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ],
                  )),
            )),
      ),
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
//      ..lineTo(0, 0)
      ..lineTo(size.width * 0.25, 0)
      ..lineTo(0, size.height * 0.5)
      ..lineTo(size.width * 0.25, size.height)
      ..lineTo(size.width * 0.75, size.height)
      ..lineTo(size.width, size.height * .5)
      ..lineTo(size.width * 0.75, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
