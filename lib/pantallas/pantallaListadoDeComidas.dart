import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lajamasana/pantallas/pantallaInformacionComida.dart';

class ListadoComidas extends StatefulWidget {
  @override
  _ListadoComidasState createState() => _ListadoComidasState();
}

class _ListadoComidasState extends State<ListadoComidas> {
  List<String> _horarios = ["Desayuno", "Almuerzo", "Merienda"];

  String _hint = "Almuerzo"; //Cambiar para que sea de acuerdo a la hora del dia

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: crearContenido(),
    );
  }

  Widget crearContenido() {
    return ListView(
      children: [
        contenedorCabecera(),
        contenedorDropdown(),
        menu(),
        listadoComidas(),
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
      // alignment: Alignment.topLeft,
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
          // Padding(padding: EdgeInsets.only(top: 20) ),
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
      padding: EdgeInsets.only(left: 20, bottom: 20, top: 10),
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

  Widget listadoComidas() {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        // padding: EdgeInsets.only(bottom: 60),
        color: Color(0xff77D353).withOpacity(.06),
        child: GridView.count(
          controller: new ScrollController(keepScrollOffset: true), //Scroll
          scrollDirection: Axis.vertical,
          childAspectRatio: (160 / 250), // Tamanio de la presentaqcion del gridview (width/height)
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 30,
          padding: EdgeInsets.only(top: 30, left: 20, right: 20),
          children: [ //Esta lista es reemplazada por lo que se obtenga mediante la api
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 3, color: Color(0xff77D353)),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                children: [
                  Image.asset("assets/imagenes/calysupremo.png"),
                  Text("CalySupremo",
                      style: TextStyle(fontFamily: "Roboto", fontSize: 17)),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                  ),
                  RaisedButton(
                    color: Color(0xff4FD053),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => PantallaInformacionComida()));
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    child: Text("Ver mas"),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 3, color: Color(0xff77D353)),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                children: [
                  Image.asset("assets/imagenes/rollycaly.png"),
                  Text("Rollycaly",
                      style: TextStyle(fontFamily: "Roboto", fontSize: 17)),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                  ),
                  RaisedButton(
                    color: Color(0xff4FD053),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => PantallaInformacionComida()));
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    child: Text("Ver mas"),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
