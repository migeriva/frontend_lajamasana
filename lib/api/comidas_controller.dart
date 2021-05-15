import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:lajamasana/constantes/constantes.dart';
import 'package:lajamasana/modelos/comidas_model.dart';

class ComidasController {
  static Future<List<Comida>> getComidas() async {
    final response = await http.get(Constantes.urlProductos + "/allcomidas");
    if (response.statusCode != HttpStatus.ok) {
      return [];
    }
    var datos = json.decode(response.body) as List;
    return datos.map<Comida>((json) => Comida.fromJson(json)).toList();
  }
}
