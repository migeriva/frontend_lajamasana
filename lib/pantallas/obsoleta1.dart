import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lajamasana/pantallas/pantallaHome.dart';

//Obsoleta xdxd

class PantallaDeComida extends StatefulWidget {
  @override
  _PantallaDeComidaState createState() => _PantallaDeComidaState();
}

class _PantallaDeComidaState extends State<PantallaDeComida> {
  List<Widget> listadoComidas = [];
  double _tamanio = 210;
  int comidas = 0;
  var listaDias = [
    "Lunes",
    "Martes",
    "Miercoles",
    "Jueves",
    "Viernes",
    "Sabado"
  ];
  
  String hintDia = "Seleccione un dia";
  String hintHora = "Seleccione la hora";

  //LISTADO DE COMIDAS MEDIANTE EL API

  TimeOfDay _time = TimeOfDay.now();
  TimeOfDay _picked;

  Future<TimeOfDay> seleccionarTiempo(BuildContext context) async {
    _picked = await showTimePicker(context: context, initialTime: _time);
    return _picked;
  }

  Widget comidaPresentacion() {
    return Center(
        child: Column(
      children: [
        Container(
          child: Text(
            "CalySupremo",
            style: TextStyle(
              fontFamily: "Roboto",
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          padding: EdgeInsets.only(top: 25, left: 30),
          alignment: Alignment.centerLeft,
        ),
        Image.asset(
          "assets/imagenes/calysupremo.png",
          height: MediaQuery.of(context).size.height * 0.3,
          width: MediaQuery.of(context).size.width * 0.4,
        ),
      ],
    ));
  }

  Widget divisorPantalla() {
    return Container(
        child: Row(children: [
      Expanded(
          child: Divider(color: Color(0xff4FD053), height: 20, thickness: 3))
    ]));
  }

  Widget comidaInfo() {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 15, left: 25),
            child: Row(
              children: [
                Text(
                  "\$10.00 ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: "Roboto",
                    fontSize: 15,
                    color: Color(0xff4FD053),
                  ),
                ),
                Text(
                  "/ unidad",
                  style: TextStyle(
                    color: Color(0xff969FAA),
                    fontFamily: "Roboto",
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(left: 25, right: 25, top: 10),
            child: Text(
              "Contiene una porción de jamón asado al vino, una porción de tomates cherry y lechuga.",
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 15,
                fontFamily: "Roboto",
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 25, right: 25, top: 15),
            child: Column(
              children: [
                Row(children: [
                  RichText(
                    text: TextSpan(
                      text: "Valor energético",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: "Roboto",
                        fontSize: 15,
                        color: Color(0xff4FD053),
                      ),
                      children: [
                        TextSpan(
                          text: "/nutrientes",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: "Roboto",
                            fontSize: 15,
                            color: Color(0xff969FAA),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(left: 115)),
                  Text(
                    "Ingesta",
                    style: TextStyle(
                      color: Color(0xff4FD053),
                      fontSize: 15,
                      fontFamily: "Roboto",
                    ),
                  ),
                ]),
                Padding(padding: EdgeInsets.only(top: 10)),
                Row(
                  children: [
                    Text(
                      "Valor energetico",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontFamily: "Roboto",
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(left: 120)),
                    Text(
                      "8400kJ/2000kCal",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontFamily: "Roboto",
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget crearBoton() {
    return Padding(
        padding: EdgeInsets.only(top: 25),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Container(
            height: 40,
            width: _tamanio,
            color: Color(0xff4FD053).withOpacity(0.3),
            child: Row(
              children: [
                botonDel(),
                contadorComidas(),
                botonAdd(),
              ],
            ),
          ),
        ));
  }

  Widget contadorComidas() {
    return Padding(
      padding: EdgeInsets.only(left: 6, right: 6),
      child: Text(
        "$comidas unidad(es)",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: "Roboto",
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget botonAdd() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Container(
        height: 30,
        alignment: Alignment.centerLeft,
        child: FloatingActionButton(
          heroTag: "btn2",
          child: Icon(Icons.add),
          backgroundColor: Color(0xff4FD053),
          onPressed: () {
            setState(() {
              listadoComidas.add(comidasListaNotas());
              if (comidas >= 9) {
                _tamanio = 220;
              } else {
                _tamanio = 210;
              }
              comidas = comidas + 1;
            });
          },
        ),
      ),
    );
  }

  Widget botonDel() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Container(
        height: 30,
        alignment: Alignment.centerLeft,
        child: FloatingActionButton(
          heroTag: "btn1",
          child: Icon(Icons.remove),
          backgroundColor: Color(0xff4FD053),
          onPressed: () {
            setState(() {
              if (comidas < 1) {
                print("No se puede disminuir mas.");
              } else {
                listadoComidas.removeLast();
                comidas = comidas - 1;
                if (comidas < 10) {
                  _tamanio = 210;
                } else {
                  _tamanio = 220;
                }
              }
            });
          },
        ),
      ),
    );
  }

  Widget crearBotonCalendario() {
    return Padding(
        padding: EdgeInsets.only(top: 20),
        child: RaisedButton(
          color: Color(0xff4FD053),
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => PantallaHome()));
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          child: Container(
            height: 55,
            width: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Color(0xff4FD053),
            ),
            child: Row(
              children: [
                Padding(padding: EdgeInsets.only(left: 10)),
                Image.asset("assets/imagenes/calendario.png",
                    height: 40, width: 40),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text("Ver calendario",
                      style: TextStyle(fontSize: 15, fontFamily: "Roboto")),
                ),
              ],
            ),
          ),
        ));
  }

  Widget comidasListaNotas() {

    String hint_dia = "Seleccione un dia";
    String hint_hora = "Seleccione la hora";

    return Container(
      width: 400,
      height: 200,
      padding: EdgeInsets.only(top: 30, left: 35),
      child: Column(
        children: [
          Row(
            children: [
              DropdownButton(
                items: listaDias.map((String a) {
                  return DropdownMenuItem(
                    value: a,
                    child: Text(
                      a,
                      style: TextStyle(
                        fontFamily: "Roboto",
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (_valor) => {
                  setState(() {
                    hint_dia = _valor;
                  })
                },
                hint: Text(
                  hint_dia,
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 30)),
              Text(
                hint_hora,
                style: TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
              IconButton(
                icon: Icon(Icons.timer, size: 15),
                onPressed: () async {
                  TimeOfDay tmp = await seleccionarTiempo(context);
                  setState(() {
                    hint_hora=tmp.toString();
                  });
                },
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Notas...",
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Color(0xff4FD053).withOpacity(0.09),
      height: MediaQuery.of(context).size.height,
      child: ListView(children: [
        Column(
          children: [
                comidaPresentacion(),
                divisorPantalla(),
                comidaInfo(),
                crearBoton(),
                crearBotonCalendario(),
              ] + listadoComidas,
        ),
      ]),
    ));
  }
}
