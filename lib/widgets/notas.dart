import 'package:flutter/material.dart';

class NotasComida extends StatefulWidget {
  @override
  _NotasComidaState createState() => _NotasComidaState();
}

class _NotasComidaState extends State<NotasComida> {
  List<String> _dias = [
    "Lunes",
    "Martes",
    "Miércoles",
    "Jueves",
    "Viernes",
    "Sábado",
  ];
  String _hint = "Seleccionar día";
  String _hintHora = "Seleccionar hora";
  TimeOfDay _time = TimeOfDay.now();
  TimeOfDay _picked;

  Future<TimeOfDay> seleccionarTiempo() async {
    _picked = await showTimePicker(context: context, initialTime: _time);
    return _picked;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [ 
          Divider(color: Color(0xff4FD053), height: 30, thickness: 3),
          //Container completo 
          Container(
            width: MediaQuery.of(context).size.width,
            height: 170,
            child: Column(
              children: [
                //Fecha y hora
                Container(
                  height: 70,
                  child: Row(
                    children: [
                      //Seleccionar dia
                      Container(
                        width: MediaQuery.of(context).size.width * .5,
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(horizontal: 35),
                        child: DropdownButton(
                          items: crearItems(),
                          isExpanded: true,
                          onChanged: (valor) {
                            setState(() {
                              _hint = valor;
                            });
                          },
                          hint: Text(
                            _hint,
                            style: TextStyle(
                              fontFamily: "Roboto",
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                          icon: Icon(Icons.calendar_today),
                        ),
                      ),
                      //Seleccionar Hora
                      Container(
                        width: MediaQuery.of(context).size.width * .5,
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Row(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: Text(
                                _hintHora,
                                style: TextStyle(
                                fontFamily: "Roboto",
                                fontSize: 15,
                                color: Colors.black,
                              ),
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.access_time, color: Colors.black,), 
                              onPressed: () async {
                                _picked = await seleccionarTiempo();
                                setState(() {
                                  _hintHora = _picked.format(context);
                                });
                              }
                            ),
                          ],
                        ),

                      ),
                    ],
                  ),
                ),
                //Notas
                Container(
                  height: 100,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Notas...",
                      hintStyle: TextStyle(
                        fontFamily: "Roboto",
                        fontStyle: FontStyle.italic,
                      ),
                      prefixIcon: Icon(
                        Icons.event_note,
                        color: Colors.black,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 2),
                      ),
                    ),
                    keyboardType: TextInputType.multiline,
                    minLines: 1,
                    maxLines: 2,
                  ),
                ),
              ],
            ),
          ),
          Divider(color: Color(0xff4FD053), height: 20, thickness: 3),
        ],
      );
  }

  List<DropdownMenuItem> crearItems() {
    List<DropdownMenuItem> items = [];

    for (int i = 0; i < _dias.length; i++) {
      items.add(DropdownMenuItem(
        value: _dias[i],
        child: Text(
          _dias[i],
          style: TextStyle(
            fontFamily: "Roboto",
            fontSize: 15,
            color: Colors.black,
            fontStyle: FontStyle.italic
          ),
        ),
      ));
    }

    return items;
  }
}
