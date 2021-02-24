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
        body: FutureBuilder(
          future: SuscripcionController.getSuscripciones(),
          builder: (BuildContext context, AsyncSnapshot<List<Suscripcion>> snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator());
            }else{
              return pantallaSuscripciones( snapshot.data );
            }
          },
        )
    );
  }

  Widget pantallaSuscripciones( List<Suscripcion> suscripciones ){

    List<Widget> widgets = [crearTexto()];

    for(int i=0 ; i<suscripciones.length; i++){

      widgets.add(
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: Container(
            color: Color(int.parse(suscripciones[i].color)).withOpacity(.5),
            height: 115,
            child: RadioListTile(
              value: suscripciones[i].id,
              groupValue: _selectedRadio,
              onChanged: (val){
                print(val);
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
                  suscripciones[i].duracion+
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
        )
      );
    }

    widgets.add(crearBoton());
    return ListView(
      children: [
        Column(
          children: widgets,
        )
      ],
    );
  }

  Widget crearTexto() {
    return Center(
        child: Padding(
      padding: EdgeInsets.only(top: 35, bottom: 20),
      child: Text(
        "Planes de suscripción",
        style: TextStyle(
          fontFamily: "Roboto",
          fontWeight: FontWeight.bold,
          fontSize: 23,
        ),
      ),
    ));
  }

  Widget crearBoton() {
    return Padding(
        padding: EdgeInsets.only(top: 15),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Container(
            height: 50,
            width: 200,
            child: RaisedButton(
              child: Text(
                "Suscribirse",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: "Roboto",
                ),
              ),
              disabledColor: Color(0xff77D353).withOpacity(0.5),
              color: Color(0xff77D353),
              onPressed: _selectedRadio != 0
                  ? () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => PantallaHome()),
                          (route) => false);
                    }
                  : null,
            ),
          ),
        ));
  }

}
