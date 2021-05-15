import 'package:flutter/material.dart';
import 'package:lajamasana/constantes/constantes.dart';
import 'package:lajamasana/modelos/usuarios_model.dart';
import 'package:lajamasana/pantallas/pantallaHome.dart';

class PantallaDatos extends StatefulWidget {
  @override
  _PantallaDatosState createState() => _PantallaDatosState();
}

class _PantallaDatosState extends State<PantallaDatos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [crearFondo(context), crearContenido()],
      ),
    );
  }

  Widget crearContenido() {
    double _height = MediaQuery.of(context).size.height;

    return Container(
      width: double.infinity,
      height: _height,
      child: Column(
        children: [
          Container(
            height: _height * .85,
            child: crearInputs(_height * .85),
          ),
          Container(
            height: _height * .15,
            child: crearBoton(),
          ),
        ],
      ),
    );
  }

  Widget crearInputs(double height) {
    return Container(
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * .5,
            child: pesoInput(height),
          ),
          Container(
            width: MediaQuery.of(context).size.width * .5,
            child: estaturaInput(height),
          ),
        ],
      ),
    );
  }

  Widget pesoInput(double height) {
    return Container(
      child: Column(
        children: [
          Container(
            height: height * .4,
            padding: EdgeInsets.only(top: 120),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    "Ingrese su peso:",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Lato",
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xff77D353), width: 3),
                          borderRadius: BorderRadius.circular(30)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xff77D353), width: 3),
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: height * .6,
            alignment: Alignment.center,
            child: Image.asset(
              "assets/imagenes/height.png",
            ),
          ),
        ],
      ),
    );
  }

  Widget estaturaInput(double height) {
    return Container(
      child: Column(
        children: [
          Container(
            height: height * .6,
            alignment: Alignment.center,
            child: Image.asset(
              "assets/imagenes/weight.jpg",
            ),
          ),
          Container(
            height: height * .4,
            padding: EdgeInsets.only(bottom: 110),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    "Ingrese su estatura:",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Lato",
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xff77D353), width: 3),
                          borderRadius: BorderRadius.circular(30)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xff77D353), width: 3),
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget crearBoton() {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return Container(
        width: _width,
        height: _height * .13,
        padding: EdgeInsets.symmetric(horizontal: 100, vertical: 25),
        child: ElevatedButton(
          onPressed: () {
            Usuario user;
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => PantallaHome(user),
              ),
              (route) => false,
            );
          },
          style: Constantes.styleButton(Color(0xff77D353)),
          child: Text(
            "Crear Usuario",
            style: TextStyle(
                fontSize: 20, fontFamily: "Roboto", color: Colors.black),
          ),
        ));
  }

  Widget crearFondo(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Positioned(
          top: _height * .60,
          child: Container(
            height: _height * 0.40,
            width: _width,
            color: Color(0xff77D353).withOpacity(0.51),
          ),
        ),
        Positioned(
          top: _height * .45,
          child: ClipOval(
            child: Container(
              height: _height * 0.40,
              width: _width,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
