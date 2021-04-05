
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lajamasana/modelos/comidas_model.dart';

class ComidasController {

	static String _url = "http://10.0.3.2:8000/productos/allcomidas";

	static Future<List<Comida>> getComidas() async{
		final response = await http.get(_url);
		if(response.statusCode != 200){
			return [];
		}
		var datos = json.decode(response.body) as List;
		return [Comida.fromJson(datos[0])];//datos.map<Comida>((json) => Comida.fromJson(json)).toList();
	}

}
