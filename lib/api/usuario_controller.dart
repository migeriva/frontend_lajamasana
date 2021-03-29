import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lajamasana/modelos/usuarios_model.dart';

class UsuarioController{
  //Este url es para lo que tenga que ver con usuarios, en este caso es solo para validacion para la presetnacion
  // static final String _url2 = "http://10.0.2.2:3000/validacion"; //Android Studio
  static final String _url = "http://10.0.3.2:8000/usuarios/login"; //Genymotion

  //Esto devuelve un objeto usuario, para la presentacion esta asigando un bool
  static Future<Usuario> validarUsuario (String user, String password) async {
 
    final response = await http.post(_url, body: {"username":user, "password":password});
    if(response.statusCode != 200){
      return null;
    }
    var datos = json.decode(response.body);
    return Usuario.fromJson(datos);
  }

}
