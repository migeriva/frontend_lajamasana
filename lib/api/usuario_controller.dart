import 'dart:convert';
import 'package:http/http.dart' as http;

class UsuarioRetriever {

  //Este url es para lo que tenga que ver con usuarios, en este caso es solo para validacion para la presetnacion
  static final String _url = "http://10.0.2.2:3000/validacion"; 

  //Esto devuelve un objeto usuario, para la presentacion esta asigando un bool
  static Future<bool> validarUsuario(String usuario, String pass) async {

    if(usuario.isEmpty || pass.isEmpty)return false;
    var response = await http.post(_url, body: {"nombre":usuario, "contra":pass});
    if(response.statusCode==200){
      return true;
    }
    return false;

  }


}