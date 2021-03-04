import 'package:flutter/material.dart';
import 'package:lajamasana/api/suscripcion_controller.dart';
import 'package:lajamasana/modelos/suscripcion_model.dart';
import 'package:lajamasana/pantallas/pantallaHome.dart';

class PantallaSuscripciones extends StatefulWidget {
  @override
  _PantallaSuscripcionesState createState() => _PantallaSuscripcionesState();
}

class _PantallaSuscripcionesState extends State<PantallaSuscripciones> {
  
  int _selectedRadio = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        crearTexto(),
        Container(height: MediaQuery.of(context).size.height*0.755, child: crearSuscripciones()),
        crearBoton()
      ],
    ));
  }

  Widget crearTexto() {
    
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return Container(
      width: _width,
      height: _height * .08,
      alignment: Alignment.center,
      child: Text(
        "Planes de suscripción",
        style: TextStyle(
          fontFamily: "Roboto",
          fontWeight: FontWeight.bold,
          fontSize: 23,
        ),
      ),
    );
  }

  Widget crearBoton() {

    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return Container(

      width: _width,
      height: _height*.13,
      padding: EdgeInsets.symmetric(horizontal: 100, vertical:20),
      child: RaisedButton(
        onPressed: _selectedRadio==0?null:(){
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => PantallaHome()),(route) => false);
        },
        disabledColor: Color(0xff77D353).withOpacity(0.5),
        color: Color(0xff77D353),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30)
        ),
        child: Text( 
          "Suscribirse",
           style: TextStyle(
             fontSize: 20,
             fontFamily: "Roboto",
          ),
        ),
      )
    );

  }

  Widget crearSuscripciones() {

    return FutureBuilder(

      future: SuscripcionController.getSuscripciones(),
      initialData: null,
      builder: (BuildContext context, AsyncSnapshot<List<Suscripcion>> snapshot){
        if( snapshot.connectionState==ConnectionState.waiting ){
          return Center(child: CircularProgressIndicator());
        }else {
          return pantallaSuscripciones( snapshot.data );
        }
      },

    );


  }

  Widget pantallaSuscripciones(List<Suscripcion> suscripciones) {

    List<Widget> _widgets = [];
    Color inhabilitado = Color(0xff969FAA);

    for (int i = 0; i < suscripciones.length; i++) {

      Color habilitado = Color(int.parse(suscripciones[i].color)).withOpacity(.5);
      _widgets.add(Padding(
        padding: EdgeInsets.only(top: 10),
        child: Container(
          color: _selectedRadio==0?habilitado:_selectedRadio==i+1?habilitado:inhabilitado,
          height: 115,
          child: RadioListTile(
            value: suscripciones[i].id,
            groupValue: _selectedRadio,
            onChanged: (val) {
              setState(() {
                _selectedRadio = val;
              });
            },
            activeColor: Colors.black,
            selected: false,
            title: Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                suscripciones[i].nombre,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: "Roboto",
                    fontSize: 20),
              ),
            ),
            subtitle: Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                suscripciones[i].duracion +
                    "\nIncluye " +
                    suscripciones[i].cantidad,
                style: TextStyle(fontFamily: "Roboto", fontSize: 15),
              ),
            ),
            secondary: Container(
              padding: EdgeInsets.only(right: 15),
              alignment: Alignment.center,
              height: 100,
              width: 150,
              child: Column(
                children: [
                  Text(
                    "\$" + suscripciones[i].precio.toStringAsFixed(2),
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  Text(
                    "+ impuestos aplicables",
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: "Roboto",
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ));
    }

    return ListView(
      children: _widgets,
    );
  }

}
