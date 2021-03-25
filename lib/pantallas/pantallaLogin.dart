import 'package:flutter/material.dart';
import 'package:lajamasana/api/usuario_controller.dart';
import 'package:lajamasana/pantallas/pantallaPerfiles.dart';
import 'package:lajamasana/pantallas/pantallaHome.dart';
import 'package:lajamasana/constantes/constantes.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //Funcion para validar el usuario
  bool _recordar = false;
  String _usuario = ""; //Validacion de vacios en el controlador
  String _pass = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                crearFondo(),
                crearPantalla(),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget crearFondo() {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        Container(
          height: _height * 0.7,
          width: _width,
          color: Color(0xff77D353).withOpacity(0.51),
        ),
        Positioned(
          top: _height * .42, //290,
          child: ClipOval(
            child: Container(
              alignment: Alignment.topCenter,
              height: _height * 0.5,
              width: _width,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }

  Widget crearPantalla() {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return Container(
      width: _width,
      height: _height,
      child: Column(
        children: [
          crearLogo(),
          crearNombre(),
          usuario(),
          pass(),
          botonIngresar(),
          botonRegistrarse(),
          crearRecordatorio(),
        ],
      ),
    );
  }

  Widget crearLogo() {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: 30),
      width: _width,
      height: _height * .35,
      child: Image.asset(
        "assets/imagenes/logo.png",
        width: _width * .45,
        height: _height * .45,
      ),
    );
  }

  Widget crearNombre() {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return Container(
      alignment: Alignment.topCenter,
      width: _width,
      height: _height * .1,
      child: Text(
        "La Jama Sana",
        style: Constantes.styleLogo,
      ),
    );
  }

  Widget usuario() {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return Container(
      width: _width,
      height: _height * .1,
      child: Row(
        children: [
          Container(
            width: _width * .4,
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "Usuario:",
              style: Constantes.styleLabel,
            ),
          ),
          Container(
            width: _width * .5,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(right: 45, top: 18, bottom: 18, left: 10),
            child: TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff77D353), width: 3),
                    borderRadius: BorderRadius.circular(30)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff77D353), width: 3),
                    borderRadius: BorderRadius.circular(30)),
              ),
              onChanged: (data) {
                setState(() {
                  _usuario = data;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget pass() {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return Container(
      width: _width,
      height: _height * .07,
      child: Row(
        children: [
          //Label contra
          Container(
            width: _width * .4,
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "Contraseña:",
              style: Constantes.styleLabel,
            ),
          ),
          //Campo para contra
          Container(
            width: _width * .5,
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(right: 45, top: 7, bottom: 7, left: 10),
            child: TextField(
              textAlign: TextAlign.center,
              obscureText: true,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff77D353), width: 3),
                    borderRadius: BorderRadius.circular(30)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff77D353), width: 3),
                    borderRadius: BorderRadius.circular(30)),
              ),
              onChanged: (data) {
                setState(() {
                  _pass = data;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget botonIngresar() {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return Container(
      width: _width,
      height: _height * .15,
      alignment: Alignment.center,
      child: RaisedButton(
        onPressed: () async {
          bool valido = await UsuarioRetriever.validarUsuario(_usuario, _pass);
          if (valido) {
            var route = MaterialPageRoute(builder: (context) => PantallaHome());
            Navigator.of(context).pushAndRemoveUntil(route, (r) => false);
          } else {
            print("Error en el usuario"); //Pop up o no se que hacer xd
          }
        },
        color: Color(0xff77D353),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        padding: EdgeInsets.symmetric(horizontal: 45, vertical: 15),
        child: Text(
          "Ingresar",
          style: Constantes.styleLabel,
        ),
      ),
    );
  }

  Widget botonRegistrarse() {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return Container(
      width: _width,
      height: _height * .1,
      alignment: Alignment.center,
      child: RaisedButton(
        onPressed: () {
          var route = MaterialPageRoute(builder: (c) => PantallaPerfiles());
          Navigator.of(context).push(route);
        },
        color: Color(0xff77D353),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        padding: EdgeInsets.symmetric(horizontal: 36, vertical: 15),
        child: Text(
          "Registrarse",
          style: Constantes.styleLabel,
        ),
      ),
    );
  }

  //En veremos xdxd
  Widget crearRecordatorio() {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return Container(
      width: _width,
      height: _height * .1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Checkbox(
            value: _recordar,
            onChanged: (bool value) {
              setState(() {
                _recordar = value;
              });
            },
          ),
          Text(
            "¿Recordar contraseña?",
            style: TextStyle(
              fontFamily: "Roboto",
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
