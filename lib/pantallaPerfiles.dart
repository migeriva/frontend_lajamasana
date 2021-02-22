import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'pantallaSuscripciones.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PantallaPerfiles extends StatefulWidget {
  @override
  _PantallaPerfilesState createState() => _PantallaPerfilesState();
}

class _PantallaPerfilesState extends State<PantallaPerfiles> {
  var _perfiles = [];
  List<Widget> _widgets = [];

  //Se esta usando un servidor con nodejs para que muestre solo la lista de los perfiles
  void getPerfiles() async {
    var response = await http.get("http://10.0.2.2:3000/perfiles");
    var datos = json.decode(response.body) as List;
    setState(() {
      _perfiles = datos;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getPerfiles();
    // this.opcionPerfil();
  }

  @override
  Widget build(BuildContext context) {
    this.opcionPerfil();
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [crearFondo(context), crearTexto()] + _widgets ,
          )
        ],
      ),
    );
  }

  void opcionPerfil() {
    List<double> alturas = [80, 100, 80];
    double padding = 170;

    for (var i = 0; i < _perfiles.length; i++) {
      _widgets.add(Container(
        padding: EdgeInsets.only(top: padding),
        alignment: Alignment.center,
        child: RaisedButton(
          color: Colors.white,
          child: Container(
            width: 300,
            height: 100,
            child: Row(
              children: [
                Image.asset(
                  "assets/imagenes/" + _perfiles[i]["imagen"],
                  height: alturas[i],
                  width: 100,
                ),
                Padding(padding: EdgeInsets.only(right: 30)),
                Text(
                  _perfiles[i]["nombre"],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: "Roboto",
                    fontSize: 20,
                  ),
                )
              ],
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: BorderSide(color: Color(0xff77D353), width: 2),
          ),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => PantallaSuscripciones()));
          },
        ),
      ));
      padding += 150;
    }
  }

  //Texto principal
  Widget crearTexto() {
    return Center(
        child: Padding(
      padding: EdgeInsets.only(top: 80),
      child: Text(
        "¿Cuál es tu objetivo?",
        style: TextStyle(
          fontFamily: "Roboto",
          fontWeight: FontWeight.bold,
          fontSize: 35,
        ),
      ),
    ));
  }

  //Fondo de pantalla
  Widget crearFondo(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.6,
          width: MediaQuery.of(context).size.width,
          color: Color(0xff77D353).withOpacity(0.51),
        ),
        Positioned(
          top: 240,
          child: ClipOval(
            child: Container(
              alignment: Alignment.topCenter,
              height: MediaQuery.of(context).size.height * 0.45,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
