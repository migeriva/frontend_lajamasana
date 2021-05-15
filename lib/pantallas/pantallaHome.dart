import 'package:flutter/material.dart';
import 'package:lajamasana/widgets/hexagono.dart';
import 'package:lajamasana/pantallas/pantallaLogin.dart';
import 'package:lajamasana/constantes/constantes.dart';
import 'package:lajamasana/modelos/usuarios_model.dart';
import 'package:lajamasana/pantallas/pantallaInfoDia.dart';

class PantallaHome extends StatefulWidget {
  final Usuario user;

  PantallaHome(this.user);

  @override
  _PantallaHomeState createState() => _PantallaHomeState();
}

class _PantallaHomeState extends State<PantallaHome> {
  Map<String, List<double>> posiciones = {
    "top": [100, 150],
    "top_left": [165, 50],
    "bottom_left": [295, 50],
    "bottom": [360, 150],
    "bottom_right": [295, 250],
    "top_right": [165, 250],
    "center": [230, 150]
  };
  List<String> posicion = [
    "top",
    "top_right",
    "bottom_right",
    "bottom",
    "bottom_left",
    "top_left",
    "center"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(left: 260),
          child: Image.asset(
            "assets/imagenes/logo.png",
            width: 55,
            height: 55,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      drawer: Container(
        width: 250,
        child: Drawer(
          child: ListView(
            children: [
              // UserAccountsDrawerHeader(
              //   accountName: Text("AdoptMe"),
              //   accountEmail: Text("Adopcion de mascotas"),
              //   decoration: BoxDecoration(
              //       image: DecorationImage(
              //     fit: BoxFit.fill,
              //     image: AssetImage('assets/imagenes/logo.png'),
              //   )),
              // ),
              //Aqui va la imagen en caso de tenerla
              //En caso de poner mas opciones aqui iran
              ListTile(
                title: Text("Cerrar Sesión"),
                trailing: Icon(Icons.exit_to_app),
                onTap: () => Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => LoginPage()),
                    (route) => false),
              ),
              Divider(
                thickness: 2,
                height: 5,
              ),
              ListTile(
                title: Text("Ver comidas por dia"),
                trailing: Icon(Icons.fastfood),
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => PantallaInformacionDia())),
              ),
              Divider(
                thickness: 2,
                height: 5,
              ),
            ],
          ),
        ),
      ),
      body: crearHome(),
    );
  }

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
          top: _height * .08,
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

  Widget crearHome() {
    List<Widget> widgets = [crearFondo(context)];

    int diaActual = DateTime.now().add(Duration(hours: -5)).weekday;
    if (diaActual == 7) {
      widgets.addAll(homeDomingo());
    } else {
      widgets.addAll(homeSemana(diaActual));
    }

    return Stack(
      children: widgets,
    );
  }

  List<Widget> homeDomingo() {
    List<Widget> widgets = [];
    for (int i = 0; i < Constantes.dias.length; i++) {
      List<double> p = posiciones[posicion[i]];
      widgets.add(
        Padding(
          padding: EdgeInsets.only(top: p[0], left: p[1]),
          child: Hexagono(Constantes.dias[i], 0),
        ),
      );
    }
    return widgets;
  }

//Funcion rara, revisar en grupo
  List<Widget> homeSemana(int dia) {
    List<Widget> widgets = [];

    widgets.add(Padding(
      padding: EdgeInsets.only(
          top: posiciones["center"][0], left: posiciones["center"][1]),
      child: Hexagono(Constantes.dias[dia - 1], 0),
    ));

    int j = 0;
    int i = 0;
    while (j < 3) {
      if (i == dia - 1) {
        i++;
      }
      widgets.add(Padding(
        padding: EdgeInsets.only(
            top: posiciones[posicion[j]][0], left: posiciones[posicion[j]][1]),
        child: Hexagono(Constantes.dias[i], 0),
      ));
      j++;
      i++;
    }

    j++;
    while (i < 6) {
      if (dia - 1 == 5 && i == 5) {
        break;
      }
      if (i == dia - 1) {
        i++;
      }
      widgets.add(Padding(
        padding: EdgeInsets.only(
            top: posiciones[posicion[j]][0], left: posiciones[posicion[j]][1]),
        child: Hexagono(Constantes.dias[i], 0),
      ));
      j++;
      i++;
    }

    widgets.add(Padding(
      padding: EdgeInsets.only(
          top: posiciones["bottom"][0], left: posiciones["bottom"][1]),
      child: Hexagono(Constantes.dias[6], 0),
    ));

    return widgets;
  }
}
