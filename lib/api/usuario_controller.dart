import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lajamasana/constantes/constantes.dart';
import 'package:lajamasana/modelos/usuarios_model.dart';

class UsuarioController {
  //Esto devuelve un objeto usuario, para la presentacion esta asigando un bool
  static Future<Usuario> validarUsuario(String user, String password) async {
    final response = await http.post(Constantes.urlUsuarios + "/login",
        body: {"username": user, "password": password});
    if (response.statusCode != 200) {
      return null;
    }
    var datos = json.decode(response.body);
    return Usuario.fromJson(datos);
  }
}
