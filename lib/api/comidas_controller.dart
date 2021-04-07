import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:lajamasana/modelos/comidas_model.dart';

class ComidasController {

	static String _url = "http://10.0.3.2:8000/productos/allcomidas";
//	static String _url = "http://10.0.3.2:8000/productos/allcomidas?format=json";
 // static String _url = "http://10.0.3.2:3000/comidas";

	static Future<List<Comida>> getComidas() async{

		final response = await http.get(_url);
		if(response.statusCode != HttpStatus.ok){
			return [];
		}
		var datos = json.decode(response.body) as List;
		return datos.map<Comida>((json) => Comida.fromJson(json)).toList();	
	}
}
