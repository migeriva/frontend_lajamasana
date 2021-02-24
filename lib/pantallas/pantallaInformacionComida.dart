import 'package:flutter/material.dart';
import 'package:lajamasana/pantallas/pantallaHome.dart';

class PantallaInformacionComida extends StatefulWidget {
  @override
  _PantallaInformacionComidaState createState() =>
      _PantallaInformacionComidaState();
}

class _PantallaInformacionComidaState extends State<PantallaInformacionComida> {
  int _contadorComidas = 0;

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
      ],
    );
  }

  //Revisar las alturas y los anchos para posibles pantallas
  Widget presentacionComida() {
    return Container(
      // width: MediaQuery.of(context).size.width,
      height: 250,
      // color: Colors.amber,
      child: Column(
        children: [
          Container(
            height: 50,
            // color: Colors.blue,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "Calysupremo",
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
            // color: Colors.green,
            alignment: Alignment.center,
            child: Image.asset(
              "assets/imagenes/calysupremo.png",
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
      // color: Colors.orange,
      // padding: EdgeInsets.symmetric(horizontal: 20), // Mver a gusto
      height: 160,
      child: Column(
        children: [
          //Precio
          Container(
            height: 30,
            padding: EdgeInsets.symmetric(horizontal: 25),
            // color: Colors.yellow,
            alignment: Alignment.centerLeft,
            child: RichText(
              text: TextSpan(
                  text: "\$10.00 ",
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
              "Contiene una porción de jamón asado al vino, una porción de tomates cherry y lechuga.",
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
            // color: Colors.yellowAccent,
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 25),
                  alignment: Alignment.centerLeft,
                  // color: Colors.cyan,
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
                  // color: Colors.grey,
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
            // color: Colors.blue,
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 25),
                  alignment: Alignment.centerLeft,
                  // color: Colors.blue,
                  width: MediaQuery.of(context).size.width *
                      .45, // Ajustar dependiento de los valores
                  child: Text(
                    "Valor energetico",
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
                  // color: Colors.lightGreen,
                  width: MediaQuery.of(context).size.width *
                      .55, // Ajustar dependiento de los valores
                  child: Text(
                    "8400kJ/2000kCal",
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
      // color: Colors.cyan,
      height: 160,
      // padding: EdgeInsets.symmetric(horizontal: 25),
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
      padding: EdgeInsets.symmetric(horizontal: 25),
      // color: Colors.white,
      height: 80,
      alignment: Alignment.center,
      child: Container(
        height: 45,
        width: 210,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Color(0xff4FD053).withOpacity(0.3),
        ),
        child: Row(
          children: [
            //Boton para disminuir unidades
            Container(
              // color: Colors.amber,
              alignment: Alignment.center,
              width: 50,
              height: 30,
              child: FloatingActionButton(
                heroTag: "tag1",
                onPressed: () {
                  if(_contadorComidas==0){ return;}
                  setState(() {
                    _contadorComidas--;
                  });
                },
                child: Icon(Icons.remove),
                backgroundColor: Color(0xff4FD053),
              ),
            ),
            //Contador de unidades
            Container(
              // color: Colors.green,
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
            //Boton para aumentar unidades
            Container(
              // color: Colors.blue,
              alignment: Alignment.center,
              width: 50,
              height: 30,
              child: FloatingActionButton(
                heroTag: "tag2",
                onPressed: () {
                  if(_contadorComidas==18){return;} //Solo para tener un limite => 18 porque son 3 comidas por dia y 6 dias de la semana
                  setState(() {
                    _contadorComidas++;
                  });
                },
                child: Icon(Icons.add),
                backgroundColor: Color(0xff4FD053),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget botonCalendario() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25),
      height: 80,
      alignment: Alignment.center,
      child: Container(
        width: 220,
        height: 60,
        child: RaisedButton(
          onPressed: () {
            print("Calendario");
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => PantallaHome()));
          },
          color: Color(0xff4FD053),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Row(
            children: [
              Container(
                alignment: Alignment.center,
                width: 60,
                height: 50,
                child: Image.asset("assets/imagenes/calendario.png", height: 40, width: 40,),
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
