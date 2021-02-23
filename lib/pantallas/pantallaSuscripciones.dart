import 'package:flutter/material.dart';
import 'file:///C:/Users/Miguelito/Desktop/app/frontend_lajamasana/lajamasana/lib/pantallas/pantallaDiaDomingo.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PantallaSuscripciones extends StatefulWidget {
  @override
  _PantallaSuscripcionesState createState() => _PantallaSuscripcionesState();
}

class _PantallaSuscripcionesState extends State<PantallaSuscripciones> {
  double disabled = 0xff969FAA;
  var _suscripcionesN = [];
  List<Widget> _widgets = [];
  int _selectedRadio = 0;

  void getSuscripciones() async {
    var response = await http.get("http://10.0.2.2:3000/suscripciones");
    var datos = json.decode(response.body) as List;
    setState(() {
      _suscripcionesN = datos;
    });
  }

  void setSelectedTile(int val) {
    setState(() {
      _selectedRadio = val;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getSuscripciones();
  }

  @override
  Widget build(BuildContext context) {
    this.crearSuscripciones();
    return Scaffold(
        body: ListView(
      children: [
        Column(
          children: [crearTexto()] + _widgets + [crearBoton()],
        ),
      ],
    ));
  }

  //Texto
  Widget crearTexto() {
    return Center(
        child: Padding(
      padding: EdgeInsets.only(top: 35, bottom: 20),
      child: Text(
        "Planes de suscripción",
        style: TextStyle(
          fontFamily: "Roboto",
          fontWeight: FontWeight.bold,
          fontSize: 23,
        ),
      ),
    ));
  }

  //Boton
  Widget crearBoton() {
    return Padding(
        padding: EdgeInsets.only(top: 15),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Container(
            height: 50,
            width: 200,
            child: RaisedButton(
              child: Text(
                "Suscribirse",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: "Roboto",
                ),
              ),
              disabledColor: Color(0xff77D353).withOpacity(0.5),
              color: Color(0xff77D353),
              onPressed: _selectedRadio != 0
                  ? () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => PantallaDomingo()),
                          (route) => false);
                    }
                  : null,
            ),
          ),
        ));
  }

  void crearSuscripciones() {
    double padding = 10;
    for (var i = 0; i < _suscripcionesN.length; i++) {
      _widgets.add(Padding(
        padding: EdgeInsets.only(top: padding),
        child: Container(
          color: Color(int.parse(_suscripcionesN[i]["color"])).withOpacity(.50),
          height: 115,
          child: RadioListTile(
            value: _suscripcionesN[i]["id"] + 1,
            groupValue: _selectedRadio,
            onChanged: (val) {
              _widgets.clear();
              setSelectedTile(val);
            },
            activeColor: Colors.black,
            selected: false,
            title: Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                _suscripcionesN[i]["nombre"],
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: "Roboto",
                    fontSize: 20),
              ),
            ),
            subtitle: Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                _suscripcionesN[i]["duracion"] +
                    "\nIncluye " +
                    _suscripcionesN[i]["cantidad"],
                style: TextStyle(fontFamily: "Roboto", fontSize: 15),
              ),
            ),
            secondary: Container(
              padding: EdgeInsets.only(right: 15),
              alignment: Alignment.center,
              height: 100,
              width: 150,
              child: Column(
                children: [
                  Text(
                    "\$" + _suscripcionesN[i]["precio"].toStringAsFixed(2),
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  Text(
                    "+ impuestos aplicables",
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: "Roboto",
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ));
    }
  }
}
