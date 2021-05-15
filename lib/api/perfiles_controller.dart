import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lajamasana/modelos/perfiles_model.dart';
import 'package:lajamasana/constantes/constantes.dart';

class PerfilesRetrieve {
  //Obtener la lista de los perfiles
  static Future<List<Perfiles>> getPerfiles() async {
    final response = await http.get(Constantes.urlGeneral + "/perfilesE");
    if (response.statusCode != 200) {
      return [];
    }
    String body = utf8.decode(response.bodyBytes);
    var datos = json.decode(body) as List;
    return datos.map<Perfiles>((json) => Perfiles.fromJson(json)).toList();
  }
}
