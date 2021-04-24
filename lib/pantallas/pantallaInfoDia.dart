import 'package:flutter/material.dart';
import 'package:lajamasana/api/comidas_controller.dart';
import 'package:lajamasana/constantes/constantes.dart';
import 'package:lajamasana/modelos/comidas_model.dart';

class PantallaInformacionDia extends StatefulWidget {
  @override
  _PantallaInformacionDiaState createState() => _PantallaInformacionDiaState();
}

class _PantallaInformacionDiaState extends State<PantallaInformacionDia> {
  String _hint = "Dia";
  List<Comida> datos = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    comidas();
  }

  void comidas() async {
    datos = await ComidasController.getComidas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: crearPantalla(),
      ),
    );
  }

  Widget crearPantalla() {
    return Column(
      children: [daysDropDownButton(), menu(), contenedorLista()],
    );
  }

  Widget daysDropDownButton() {
    return DropdownButton(
      isExpanded: true,
      hint: Constantes.dropdownMenuItemStyle(_hint),
      items: Constantes.dias
          .sublist(0, 6)
          .map<DropdownMenuItem>((dia) => DropdownMenuItem(
                value: dia,
                child: Constantes.dropdownMenuItemStyle(dia),
              ))
          .toList(),
      onChanged: (_valor) => setState(() => _hint = _valor),
    );
  }

  Widget menu() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 20, bottom: 5, top: 5),
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          Text(
            "Menú",
            style: TextStyle(
              fontFamily: "Roboto",
              fontSize: 17,
              fontStyle: FontStyle.italic,
              color: Color(0xff3F9C90),
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 280),
            alignment: Alignment.centerRight,
            child: Image.asset(
              "assets/imagenes/logo.png",
              scale: 15,
            ),
          ),
        ],
      ),
    );
  }

  Widget contenedorLista() {
    return Expanded(
        child: Container(
      padding: EdgeInsets.only(top: 20),
      color: Color(0xff4FD053).withOpacity(.09),
      child: ListView.builder(
        itemCount: datos.length,
        itemBuilder: (contex, index) => cardComida(datos[index]),
      ),
    ));
  }

  Widget cardComida(Comida c) {
    return Container(
      height: 160,
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Color(0xff77D353), width: 2),
          borderRadius: BorderRadius.circular(30)),
      child: contenido(c),
    );
  }

  Widget contenido(Comida c) {
    return Row(
      children: [presentacionComida(c), presentacionDatos(c)],
    );
  }

  Widget presentacionComida(Comida c) {
    return Expanded(
        child: Container(
      child: Column(
        children: [
          Image.network(
            Constantes.urlImages + c.imagen,
            width: 100,
            height: 100,
          ),
          Text(c.nombre,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 15,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.bold))
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    ));
  }

  Widget presentacionDatos(Comida c) {
    return Expanded(
        child: Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Valor energetico",
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                fontFamily: "Roboto"),
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 5)),
          Text(
            c.caloriasTotales.toStringAsFixed(2),
            style: TextStyle(fontSize: 14, fontFamily: "Roboto"),
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 10)),
          Text(
            "Hora de entrega",
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                fontFamily: "Roboto"),
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 5)),
          Text(
            "hora de entrega",
            style: TextStyle(fontSize: 14, fontFamily: "Roboto"),
          ),
        ],
      ),
    ));
  }
}
