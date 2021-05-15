import 'package:flutter/material.dart';
import 'package:lajamasana/constantes/constantes.dart';
import 'package:lajamasana/pantallas/pantallaDatos.dart';

class PantallaDatosPersonales extends StatefulWidget {
  @override
  _PantallaDatosPersonalesState createState() =>
      _PantallaDatosPersonalesState();
}

class _PantallaDatosPersonalesState extends State<PantallaDatosPersonales> {
  //int _selectedRadio = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [crearFondo(context), crearBody()],
      ),
    );
  }

  Widget crearBody() {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [crearLogo(), crearTitulo(), crearCampos(), crearBoton()],
      ),
    );
  }

  //El logo en el principio
  Widget crearLogo() {
    double _height = MediaQuery.of(context).size.height * .25;
    return Container(
      width: double.infinity,
      height: _height,
      child: Image.asset(
        "assets/imagenes/logo.png",
        scale: 7,
        alignment: Alignment.bottomCenter,
      ),
    );
  }

  Widget crearTitulo() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      width: double.infinity,
      child: Text(
        "Datos Personales",
        style: TextStyle(
          fontFamily: "Lato",
          fontWeight: FontWeight.bold,
          fontSize: 25,
          color: Color(0xff77D353).withOpacity(.83),
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  //Para los datos
  Widget crearCampos() {
    List<Widget> fields = [];
    List<String> labels = [
      "Nombre",
      "Fecha",
      "Email",
      "Usuario",
      "Contraseña",
      "Dirección",
      "Género"
    ];

    //Falta poner los radiobutton para el genero
    for (int i = 0, len = 7; i < len; ++i) {
      fields.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * .3,
              height: 40,
              alignment: Alignment.centerRight,
              child: Text(
                labels[i] + ":",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Lato",
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * .7,
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
              height: 40,
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
      );
    }

    return Expanded(
      child: Column(
        children: fields,
      ),
    );

    //for (int i = 0; i < 7; i++) {
    //  if (i == 7) {
    //  } else {
    //    labels.add(
    //      Text(
    //        "Hola $i",
    //        style: TextStyle(
    //          fontSize: 18,
    //          fontWeight: FontWeight.bold,
    //          fontFamily: "Lato",
    //        ),
    //      ),
    //    );
    //  }
    //}

    //for (int i = 0; i < 6; ++i) {
    //  inputs.add(
    //    Container(
    //      width: 200,
    //      height: 30,
    //      child: TextField(
    //        textAlign: TextAlign.center,
    //        decoration: InputDecoration(
    //          enabledBorder: OutlineInputBorder(
    //              borderSide: BorderSide(color: Color(0xff77D353), width: 3),
    //              borderRadius: BorderRadius.circular(30)),
    //          focusedBorder: OutlineInputBorder(
    //              borderSide: BorderSide(color: Color(0xff77D353), width: 3),
    //              borderRadius: BorderRadius.circular(30)),
    //        ),
    //      ),
    //    ),
    //  );
    //}

    //inputs.add(
    //  Container(
    //    height: 50,
    //    child: RadioListTile(
    //      value: 1,
    //      groupValue: _selectedRadio,
    //      onChanged: (value) {
    //        setState(() {
    //          _selectedRadio = value;
    //        });
    //      },
    //      activeColor: Colors.black,
    //      selected: false,
    //      title: Text(
    //        "Hombre",
    //        style: TextStyle(
    //            fontWeight: FontWeight.bold,
    //            fontFamily: "Roboto",
    //            fontSize: 20),
    //      ),
    //    ),
    //  ),
    //);

    //return Expanded(
    //  child: Row(
    //    children: [
    //      Container(
    //        width: MediaQuery.of(context).size.width * .30,
    //        child: Column(
    //          children: labels,
    //          mainAxisAlignment: MainAxisAlignment.spaceAround,
    //          crossAxisAlignment: CrossAxisAlignment.end,
    //        ),
    //      ),
    //      Container(
    //        width: MediaQuery.of(context).size.width * .70,
    //        child: Column(
    //          children: inputs,
    //          mainAxisAlignment: MainAxisAlignment.spaceAround,
    //          crossAxisAlignment: CrossAxisAlignment.center,
    //        ),
    //      ),
    //    ],
    //  ),
    //);
  }

  Widget crearBoton() {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return Container(
        width: _width,
        height: _height * .13,
        padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
        margin: EdgeInsets.only(bottom: 30),
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => PantallaDatos()));
          },
          style: Constantes.styleButton(Color(0xff77D353)),
          child: Text(
            "Siguiente",
            style: TextStyle(
                fontSize: 20, fontFamily: "Roboto", color: Colors.black),
          ),
        ));
  }

  //Fondo de pantalla
  Widget crearFondo(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Container(
          height: _height * 0.25,
          width: _width,
          color: Color(0xff77D353).withOpacity(0.51),
        ),
        Positioned(
          top: _height * .10,
          child: ClipOval(
            child: Container(
              alignment: Alignment.topCenter,
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
