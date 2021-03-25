import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lajamasana/pantallas/pantallaInformacionComida.dart';

class ListadoComidas extends StatefulWidget {
  @override
  _ListadoComidasState createState() => _ListadoComidasState();
}

class _ListadoComidasState extends State<ListadoComidas> {
  List<String> _horarios = ["Desayuno", "Almuerzo", "Merienda"];
  Color colorFondo = Color(0xff77D353).withOpacity(.06);
  String _hint = "Almuerzo"; //Cambiar de acuerdo a la hora del dia actual

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: crearContenido(context),
    );
  }

  Widget crearContenido(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    return ListView(
      children: [
        Container(
          child: contenedorCabecera(),
          height: _height * .1,
        ),
        Container(
          child: contenedorDropdown(),
          height: _height * .1,
        ),
        Container(
          child: Column(
            children: [menu(), listadoComidas(_height * .765)],
          ),
          height: _height * .765,
          color: Color(0xff77D353).withOpacity(.06),
        ),
      ],
    );
  }

  Widget contenedorCabecera() {
    return Row(
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 10, top: 10),
          width: MediaQuery.of(context).size.width * 0.5,
          height: 80,
          child: RichText(
            text: TextSpan(
                text: "Perfil\n",
                style: TextStyle(
                  fontFamily: "Roboto",
                  color: Color(0xff969FAA),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                    text: "Perder Peso",
                    style: TextStyle(
                      fontFamily: "Roboto",
                      color: Colors.black,
                      fontSize: 21,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ]),
          ),
        ),
        Container(
          alignment: Alignment.centerRight,
          padding: EdgeInsets.only(right: 20),
          width: MediaQuery.of(context).size.width * 0.5,
          height: 80,
          child: Image.asset(
            "assets/imagenes/logo.png",
            height: 70,
            width: 70,
          ),
        ),
      ],
    );
  }

  Widget contenedorDropdown() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      width: MediaQuery.of(context).size.width,
      height: 70,
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: Text(
              "Categoria",
              style: TextStyle(
                fontFamily: "Roboto",
                color: Color(0xff969FAA),
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          DropdownButton(
            isExpanded: true,
            items: crearItems(),
            onChanged: (_valor) => {
              setState(() {
                _hint = _valor;
              })
            },
            hint: RichText(
                //Este widget aun no esta completo, duda de su existencia
                text: TextSpan(
              text: "",
              children: [
                WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: Image.asset(
                      "assets/imagenes/sopa.png",
                      width: 30,
                      height: 30,
                    )),
                TextSpan(
                  text: _hint,
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ],
            )),
          ),
        ],
      ),
    );
  }

  List<DropdownMenuItem> crearItems() {
    List<DropdownMenuItem> items = [];
    for (int i = 0; i < _horarios.length; i++) {
      items.add(DropdownMenuItem(
        value: _horarios[i],
        child: Text(
          _horarios[i],
          style: TextStyle(
            fontFamily: "Roboto",
            fontSize: 18,
            color: Colors.black,
          ),
        ),
      ));
    }
    return items;
  }

  Widget menu() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: 20, bottom: 15, top: 15),
      color: Color(0xff77D353).withOpacity(.06),
      alignment: Alignment.centerLeft,
      child: Text(
        "Menú",
        style: TextStyle(
          fontFamily: "Roboto",
          fontSize: 20,
          fontStyle: FontStyle.italic,
          color: Color(0xff3F9C90),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget listadoComidas(double size) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: size * .898, //Arreglar la vainita de los tamaños
      child: GridView.count(
        scrollDirection: Axis.vertical,
        childAspectRatio: (150 / 210), //Para mover el tamaño (w/h)
        crossAxisCount: 2,
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
        children: [
          cardComida("assets/imagenes/calysupremo.png", "CalySupremo"),
          cardComida("assets/imagenes/rollycaly.png", "RollyCaly"),
          cardComida("assets/imagenes/calysupremo.png", "CalySupremo"),
          cardComida("assets/imagenes/rollycaly.png", "RollyCaly"),
        ],
      ),
    );
  }

  //Funcion para crear las cards para las comidas obtenidas
  Widget cardComida(String imagen, String nombre) {
    return Card(
      shadowColor: colorFondo,
      color: colorFondo,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side: BorderSide(color: Color(0xff77D353), width: 3),
      ),
      child: Column(
        children: [
          Center(
            child: Image.asset(
              imagen,
              scale: 3.5,
            ),
          ),
          Center(
            child: Text(
              "Nombre del platillo",
              textScaleFactor: 1.1,
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => PantallaInformacionComida()));
              },
              child: Text(
                "Ver más",
                style: TextStyle(color: Colors.black),
              ),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Color(0xff4FD053)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)))),
            ),
          ),
        ],
      ),
    );
  }
}
