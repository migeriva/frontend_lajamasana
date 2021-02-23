import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lajamasana/pantallas/pantallaPerfiles.dart';
import 'package:lajamasana/pantallas/pantallaDiaDomingo.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //Funcion para validar el usuario

  bool _recordar = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                crearFondo(context),
                crearLogo(context),
                crearNombre(context),
                crearCampos(context),
                crearBotones(),
                crearRecordatorio(),
              ],
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
          height: MediaQuery.of(context).size.height * 0.7,
          width: MediaQuery.of(context).size.width,
          color: Color(0xff77D353).withOpacity(0.51),
        ),
        Positioned(
          top: 290,
          child: ClipOval(
            child: Container(
              alignment: Alignment.topCenter,
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }

  Widget crearLogo(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5),
      child: Center(
        child: Image.asset(
          "assets/imagenes/logo.png",
          height: MediaQuery.of(context).size.height * 0.4,
          width: MediaQuery.of(context).size.width * 0.4,
        ),
      ),
    );
  }

  Widget crearNombre(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 230),
      child: Center(
        child: Text(
          "La Jama Sana",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            fontFamily: "Lato", //"Times New Roman",
            color: Colors.green,
          ),
        ),
      ),
    );
  }

  Widget crearCampos(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 340),
      child: Center(
        child: Column(
          children: <Widget>[
            campoUsuario(),
            Padding(padding: EdgeInsets.all(10)),
            campoContra(),
          ],
        ),
      ),
    );
  }

  Widget campoUsuario() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          // padding: EdgeInsets.only(top: 7),
          child: Text(
            "Usuario:    ",
            style: TextStyle(
              fontSize: 17,
              fontFamily: "Lato",
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        Padding(padding: EdgeInsets.only(left: 35)),
        Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.only(left: 20),
          width: 150,
          height: 30,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                color: Color(0xff77D353),
                width: 3,
              )),
          child: TextField(
            decoration: InputDecoration(
              focusedBorder: null,
              disabledBorder: null,
            ),
          ),
        )
      ],
    );
  }

  Widget campoContra() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          // padding: EdgeInsets.only(top: 7),
          child: Text(
            "Contraseña: ",
            style: TextStyle(
              fontSize: 17,
              fontFamily: "Lato",
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        Padding(padding: EdgeInsets.only(left: 20)),
        Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.only(left: 20),
          width: 150,
          height: 30,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                color: Color(0xff77D353),
                width: 3,
              )),
          child: TextField(
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
          ),
        )
      ],
    );
  }

  Widget crearBotones() {
    return Container(
      padding: EdgeInsets.only(top: 460),
      child: Center(
        child: Column(
          children: <Widget>[
            botonIngresar(),
            Padding(padding: EdgeInsets.all(10)),
            botonRegistrarse(),
          ],
        ),
      ),
    );
  }

  Widget botonIngresar() {
    return RaisedButton(
      onPressed: () {
        var route = MaterialPageRoute(builder: (context)=> PantallaDomingo());
        Navigator.of(context).pushAndRemoveUntil(route, (r)=>false);
        //Validacion de usuario
      },
      color: Color(0xff77D353),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40),
      ),
      padding: EdgeInsets.symmetric(horizontal: 45, vertical: 15),
      child: Text(
        "Ingresar",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 17,
          fontFamily: "Roboto",
        ),
      ),
    );
  }

  Widget botonRegistrarse() {
    return RaisedButton(
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
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 17,
          fontFamily: "Roboto",
        ),
      ),
    );
  }

  //En veremos xdxd
  Widget crearRecordatorio() {
    return Container(
      padding: EdgeInsets.only(top: 600),
      child: Center(
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
      )),
    );
  }
}
