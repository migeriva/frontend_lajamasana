import 'package:flutter/material.dart';
import 'package:lajamasana/modelos/usuarios_model.dart';
import 'package:lajamasana/modelos/comidas_model.dart';
import 'package:lajamasana/pantallas/pantallaHome.dart';
import 'package:lajamasana/widgets/notas.dart';
import 'package:lajamasana/constantes/constantes.dart';

class PantallaInformacionComida extends StatefulWidget {

	final Comida comida;
	PantallaInformacionComida(this.comida);
	
  @override
  _PantallaInformacionComidaState createState() =>
      _PantallaInformacionComidaState();
}

class _PantallaInformacionComidaState extends State<PantallaInformacionComida> {
  int _contadorComidas = 0;
  List<Widget> _widgetsNotas = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Container(
          color: Color(0xff4FD053).withOpacity(0.09),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: crearPantalla(),
        ),
      ),
    );
  }

  Widget crearPantalla() {
    return ListView(
      children: [
            presentacionComida(),
            divisorPantalla(),
            informacionComida(),
            botones(),
          ] +
          _widgetsNotas,
    );
  }

  //Revisar las alturas y los anchos para posibles pantallas
  Widget presentacionComida() {
    return Container(
      height: 250,
      child: Column(
        children: [
          Container(
            height: 50,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 20),
            child: Text(
								widget.comida.nombre,
              //"Calysupremo",
              style: TextStyle(
                fontFamily: "Roboto",
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          Container(
            height: 200,
            alignment: Alignment.center,
            child: Image.network(
              Constantes.urlImages+widget.comida.imagen,
              width: 180,
              height: 180,
            ),
          ),
        ],
      ),
    );
  }

  Widget divisorPantalla() {
    return Divider(color: Color(0xff4FD053), height: 20, thickness: 3);
  }

  Widget informacionComida() {
    return Container(
      height: 160,
      child: Column(
        children: [
          //Precio
          Container(
            height: 30,
            padding: EdgeInsets.symmetric(horizontal: 25),
            alignment: Alignment.centerLeft,
            child: RichText(
              text: TextSpan(
                  text: "\$"+widget.comida.precio.toStringAsFixed(2),
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 16,
                    color: Color(0xff4FD053),
                  ),
                  children: [
                    TextSpan(
                      text: "/ unidad",
                      style: TextStyle(
                        fontFamily: "Roboto",
                        fontSize: 16,
                        color: Color(0xff969FAA),
                      ),
                    )
                  ]),
            ),
          ),
          //Descripcion
          Container(
            height: 70,
            // color: Colors.black54,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              widget.comida.descripcion,//"Contiene una porción de jamón asado al vino, una porción de tomates cherry y lechuga.",
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontFamily: "Roboto",
                fontSize: 17,
                color: Colors.black,
              ),
            ),
          ),
          //Cabecera del valor energetico e ingesta
          Container(
            height: 30,
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 25),
                  alignment: Alignment.centerLeft,
                  width: MediaQuery.of(context).size.width * .6,
                  child: RichText(
                    text: TextSpan(
                        text: "Valor energetico",
                        style: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 16,
                          fontStyle: FontStyle.italic, //Cambiar si se ve feo xd
                          color: Color(0xff4FD053),
                        ),
                        children: [
                          TextSpan(
                            text: "/nutriente",
                            style: TextStyle(
                              fontFamily: "Roboto",
                              fontSize: 16,
                              fontStyle:
                                  FontStyle.italic, //Cambiar si se ve feo xd
                              color: Color(0xff969FAA),
                            ),
                          )
                        ]),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 25),
                  alignment: Alignment.centerRight,
                  width: MediaQuery.of(context).size.width * .4,
                  child: Text(
                    "Ingesta",
                    style: TextStyle(
                      fontFamily: "Roboto",
                      fontSize: 16,
                      fontStyle: FontStyle.italic, //Cambiar si se ve feo xd
                      color: Color(0xff4FD053),
                    ),
                  ),
                ),
              ],
            ),
          ),
          //Valores para el valor energetico e ingesta
          Container(
            height: 30,
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 25),
                  alignment: Alignment.centerLeft,
                  width: MediaQuery.of(context).size.width *
                      .45, // Ajustar dependiento de los valores
                  child: Text(
                    widget.comida.macronutrientes.toString(),//"Valor energetico",
                    style: TextStyle(
                      fontFamily: "Roboto",
                      fontSize: 16,
                      fontStyle: FontStyle.italic, //Cambiar si se ve feo xd
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 25),
                  alignment: Alignment.centerRight,
                  width: MediaQuery.of(context).size.width *
                      .55, // Ajustar dependiento de los valores
                  child: Text(
                    widget.comida.caloriasTotales.toStringAsFixed(2), //Falta verificar
                    style: TextStyle(
                      fontFamily: "Roboto",
                      fontSize: 16,
                      fontStyle: FontStyle.italic, //Cambiar si se ve feo xd
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget botones() {
    return Container(
      height: 210,
      child: Column(
        children: [
          botonContador(),
          botonCalendario(),
        ],
      ),
    );
  }

  Widget botonContador() {
    return Container(
      height: 100,
      alignment: Alignment.center,
      child: Container(
        height: 50,
        width: 210,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Color(0xff4FD053).withOpacity(0.3),
        ),
        child: Row(
          children: [
            botonRemove(),
            Container(
              alignment: Alignment.center,
              width: 110,
              height: 30,
              child: Text(
                "$_contadorComidas unidad(es)",
                style: TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            botonAdd(),
          ],
        ),
      ),
    );
  }

  Widget botonRemove() {
    return Container(
      alignment: Alignment.center,
      width: 50,
      height: 30,
      child: FloatingActionButton(
        heroTag: "tag1",
        onPressed: () {
          if (_contadorComidas == 0) {
            return;
          }
          setState(() {
            _contadorComidas--;
            _widgetsNotas
                .removeLast(); //Primero se remueve el container de altura 50, temporal
            _widgetsNotas.removeLast();
          });
        },
        child: Icon(Icons.remove),
        backgroundColor: Color(0xff4FD053),
      ),
    );
  }

  Widget botonAdd() {
    return Container(
      alignment: Alignment.center,
      width: 50,
      height: 30,
      child: FloatingActionButton(
        heroTag: "tag2",
        onPressed: () {
          if (_contadorComidas == 18) {
            return;
          } //Solo para tener un limite => 18 porque son 3 comidas por dia y 6 dias de la semana
          setState(() {
            _contadorComidas++;
            _widgetsNotas.add(NotasComida());
            _widgetsNotas.add(Container(
              height: 50,
            )); //Temporal
          });
        },
        child: Icon(Icons.add),
        backgroundColor: Color(0xff4FD053),
      ),
    );
  }

  Widget botonCalendario() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25),
      height: 60,
      alignment: Alignment.center,
      child: Container(
        width: 220,
        height: 50,
        child: ElevatedButton(
          onPressed: () {
	    Usuario user;
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => new PantallaHome(user)));
          },
          style: Constantes.styleButton(Color(0xff4FD053)),
          child: Row(
            children: [
              Container(
                alignment: Alignment.center,
                width: 60,
                height: 50,
                child: Image.asset(
                  "assets/imagenes/calendario.png",
                  height: 40,
                  width: 40,
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                width: 120,
                height: 50,
                child: Text(
                  "Ver calendario",
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
