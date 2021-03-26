import 'package:flutter/material.dart';
import 'package:lajamasana/pantallas/pantallaListaComidas.dart';
import 'package:lajamasana/constantes/constantes.dart';

class Hexagono extends StatefulWidget {
  final String dia;
  final double calorias;

  Hexagono(this.dia, this.calorias);

  @override
  _HexagonoState createState() => _HexagonoState();
}

class _HexagonoState extends State<Hexagono> {
  int _diaActual = DateTime.now().add(Duration(hours: -5)).weekday;
  bool _disabled = true;

  @override
  Widget build(BuildContext context) {
    Constantes.dias[_diaActual - 1] == widget.dia
        ? _disabled = false
        : _disabled = true;

    if (widget.dia == "Domingo") {
      return carritoCompras();
    }
    return dia(widget.dia, widget.calorias);
  }

  Widget carritoCompras() {
    return ClipRRect(
      child: ClipPath(
        clipper: MyCustomClipper(),
        child: Container(
          width: 120,
          height: 120,
          child: ElevatedButton(
            onPressed: _disabled
                ? null
                : () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ListadoComidas()));
                  },
            child: Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Color(0xff4FD053),
              ),
              child: Image.asset(
                "assets/imagenes/carrodecompras.png",
                scale: 8,
              ),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  _disabled ? Color(0xff77D353).withOpacity(.5) : Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  Widget dia(String dia, double calorias) {
    return ClipRRect(
      child: ClipPath(
        clipper: MyCustomClipper(),
        child: Container(
          width: 120,
          height: 120,
          child: ElevatedButton(
            onPressed: _disabled
                ? null
                : () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ListadoComidas()));
                  },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(_disabled
                  ? Color(0xff77D353).withOpacity(.5)
                  : Color(0xff77D353).withOpacity(.8)),
              shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
            ),
            child: Text(dia + "\n\n" + calorias.toStringAsFixed(0) + " Kcal",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 15, fontFamily: "Roboto", color: Colors.black)),
          ),
        ),
      ),
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Size p1 = Size(size.width * .25, 0);
    Size p2 = Size(0, size.height * .5);
    Size p3 = Size(size.width * 0.25, size.height);
    Size p4 = Size(size.width * 0.75, size.height);
    Size p5 = Size(size.width, size.height * .5);
    Size p6 = Size(size.width * 0.75, 0);

    Path path = Path();

    path.moveTo(p1.width, p1.height);
    path.lineTo(p2.width, p2.height);
    path.lineTo(p3.width, p3.height);
    // usar - path.quadraticBezierTo(x1, y1, x2, y2)
    path.lineTo(p4.width, p4.height);
    path.lineTo(p5.width, p5.height);
    path.lineTo(p6.width, p6.height);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
