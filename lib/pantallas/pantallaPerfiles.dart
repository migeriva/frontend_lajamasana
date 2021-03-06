import 'package:flutter/material.dart';
import 'package:lajamasana/api/perfiles_controller.dart';
import 'pantallaSuscripciones.dart';
import 'package:lajamasana/modelos/perfiles_model.dart';

class PantallaPerfiles extends StatefulWidget {
  @override
  _PantallaPerfilesState createState() => _PantallaPerfilesState();
}

class _PantallaPerfilesState extends State<PantallaPerfiles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: PerfilesRetrieve.getPerfiles(),
      builder: (BuildContext context, AsyncSnapshot<List<Perfiles>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator()); //Mejorar
        } else {
          return crearPantalla(snapshot.data);
        }
      },
    ));
  }

  Widget crearTexto() {
    double _height = MediaQuery.of(context).size.height;

    return Center(
        child: Padding(
      padding: EdgeInsets.only(top: _height * .1),
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

  Widget crearFondo(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        Container(
          height: _height * 0.6,
          width: _width,
          color: Color(0xff77D353).withOpacity(0.51),
        ),
        Positioned(
          top: _height * .33, //240,
          child: ClipOval(
            child: Container(
              alignment: Alignment.topCenter,
              height: _height * 0.45,
              width: _width,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }

  Widget crearPantalla(List<Perfiles> perfiles) {
    double _height = MediaQuery.of(context).size.height;
    List<double> alturas = [80, 100, 80];
    double padding = _height * .25;
    List<Widget> widgets = [crearFondo(context), crearTexto()];
    for (int i = 0; i < perfiles.length; i++) {
      widgets.add(Container(
        padding: EdgeInsets.only(top: padding),
        alignment: Alignment.center,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
              side: BorderSide(color: Color(0xff77D353), width: 2),
            )),
          ),
          child: Container(
            width: 300,
            height: 100,
            child: Row(
              children: [
                Image.asset(
                  "assets/imagenes/" + perfiles[i].imagen,
                  height: alturas[i],
                  width: 100,
                ),
                Padding(padding: EdgeInsets.only(left: 25)),
                Text(
                  perfiles[i].nombre,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: "Roboto",
                      fontSize: 20,
                      color: Colors.black),
                )
              ],
            ),
          ),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => PantallaSuscripciones()));
          },
        ),
      ));
      padding += 150;
    }

    return ListView(
      children: [
        Stack(
          children: widgets,
        )
      ],
    );
  }
}
