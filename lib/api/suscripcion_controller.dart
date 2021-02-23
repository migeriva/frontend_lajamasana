import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lajamasana/modelos/suscripcion_model.dart';

//Cambiar nombre si se necesita
class SuscripcionController {

  static String _url = "http://10.0.2.2:3000/suscripciones";

  //Obtener las susscripciones
  static Future<List<Suscripcion>> getSuscripciones() async{

    final response = await http.get(_url);
    if(response.statusCode != 200){
      return [];
    }
    var datos = json.decode(response.body) as List;
    return datos.map<Suscripcion>((json) => Suscripcion.fromJson(json)).toList();

  }

}