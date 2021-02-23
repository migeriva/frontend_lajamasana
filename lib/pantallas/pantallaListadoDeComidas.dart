import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lajamasana/pantallas/pantallaInformacionDeComidas.dart';
class ListadoComidas extends StatefulWidget {
  @override
  _ListadoComidasState createState() => _ListadoComidasState();
}

class _ListadoComidasState extends State<ListadoComidas> {
  var _horarios = ["Desayuno", "Almuerzo", "Merienda"];
  String _hint = "Almuerzo";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          contenedorPrincipal(),
          dropdownHorario(),
          listado(),
        ],
      ),
    );
  }

  Widget listado() {
    return Container(
      color: Color(0xff77D353).withOpacity(.06),
      height: 508,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Positioned(
            top: 20,
            left: 20,
            child: Text(
              "Menu",
              style: TextStyle(
                fontFamily: "Roboto",
                fontSize: 20,
                fontStyle: FontStyle.italic,
                color: Color(0xff3F9C90),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            top: 70,
            left: 30,
            child: Container(
              width: 160,
              height: 250,
              decoration: BoxDecoration(
                border: Border.all(width: 3, color: Color(0xff77D353)),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                children: [
                  Image.asset("assets/imagenes/calysupremo.png"),
                  Text("CalySupremo"),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: RaisedButton(
                        color: Color(0xff4FD053),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => PantallaDeComida()));
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        child: Text("Ver mas")),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 70,
            left: 220,
            child: Container(
              width: 160,
              height: 250,
              decoration: BoxDecoration(
                border: Border.all(width: 3, color: Color(0xff77D353)),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                children: [
                  Image.asset("assets/imagenes/rollycaly.png"),
                  Text("RollyCaly"),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: RaisedButton(
                      color: Color(0xff4FD053),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => PantallaDeComida()));
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      child: Text("Ver mas"),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget contenedorPrincipal() {
    return Padding(
      padding: EdgeInsets.only(top: 25),
      child: Container(
        color: Colors.white,
        height: 90,
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            Padding(
                padding: EdgeInsets.only(left: 20, right: 30),
                child: Container(
                  child: Column(
                    children: [
                      Padding(padding: EdgeInsets.only(top: 10)),
                      Text(
                        "Perfil",
                        style: TextStyle(
                          color: Color(0xff969FAA),
                          fontFamily: "Roboto",
                          fontSize: 17,
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 15)),
                      Text(
                        "Perder Peso",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Roboto",
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                )),
            Padding(
              padding: EdgeInsets.only(left: 155, right: 10),
              child: Image.asset(
                "assets/imagenes/logo.png",
                width: 80,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget dropdownHorario() {
    return Container(
        height: 60,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: DropdownButton(
            isExpanded: true,
            items: _horarios.map((String item) {
              return DropdownMenuItem(
                value: item,
                child: Text(
                  item,
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              );
            }).toList(),
            onChanged: (_valor) => {
              setState(() {
                _hint = _valor;
              })
            },
            hint: Text(
              _hint,
              style: TextStyle(
                fontFamily: "Roboto",
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ),
        ));
  }
}
