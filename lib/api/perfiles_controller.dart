import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lajamasana/modelos/perfiles_model.dart';

class PerfilesRetrieve {

  static String _url = "http://10.0.2.2:3000/perfiles";

  //Obtener la lista de los perfiles
  static Future<List<Perfiles>> getPerfiles() async {

    final response = await http.get(_url);
    if(response.statusCode != 200){
      return [];
    }
    var datos = json.decode(response.body) as List;
    return datos.map<Perfiles>((json) => Perfiles.fromJson(json)).toList();

  }

}