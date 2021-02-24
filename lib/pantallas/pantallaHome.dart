import 'package:flutter/material.dart';
import 'package:lajamasana/widgets/hexagono.dart';
import 'package:lajamasana/pantallas/pantallaloginPage.dart';

class PantallaHome extends StatefulWidget {
  @override
  _PantallaHomeState createState() => _PantallaHomeState();
}

class _PantallaHomeState extends State<PantallaHome> {
  List<String> dias = [
    "Lunes",
    "Martes",
    "Miercoles",
    "Jueves",
    "Viernes",
    "Sabado",
    "Domingo"
  ];
  Map<String, List<double>> posiciones = {
    "top": [100, 150],
    "top_left": [165, 50],
    "bottom_left": [295, 50],
    "bottom": [360, 150],
    "bottom_right": [295, 250],
    "top_right": [165, 250],
    "center": [225, 150]
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
            width: 60,
            height: 60,
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
              //         fit: BoxFit.fill,
              //         image: AssetImage('assets/imagenes/logo.png'),
              //       )
              //   ),
              // ),  //Aqui va la imagen en caso de tenerla
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
            ],
          ),
        ),
      ),
      body: crearHome(),
    );
  }

  Widget crearFondo(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.25,
          width: MediaQuery.of(context).size.width,
          color: Color(0xff77D353).withOpacity(0.51),
        ),
        Positioned(
          top: 40,
          child: ClipOval(
            child: Container(
              alignment: Alignment.topCenter,
              height: MediaQuery.of(context).size.height * 0.40,
              width: MediaQuery.of(context).size.width,
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
    for (int i = 0; i < dias.length; i++) {
      List<double> p = posiciones[posicion[i]];
      widgets.add(
        Padding(
          padding: EdgeInsets.only(top: p[0], left: p[1]),
          child: Hexagono(
              i != 6 ? 0xff969FAA : 0xffFFFFFF, dias[i], 0, i != 6 ? 1 : 0),
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
      child: Hexagono(0xff77D353, dias[dia - 1], 0, 0),
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
        child: Hexagono(0xff77D353, dias[i], 0, 0),
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
        child: Hexagono(0xff77D353, dias[i], 0, 0),
      ));
      j++;
      i++;
    }

    widgets.add(Padding(
      padding: EdgeInsets.only(
          top: posiciones["bottom"][0], left: posiciones["bottom"][1]),
      child: Hexagono(0xff969FAA, dias[6], 0, 1),
    ));

    return widgets;
  }
}
