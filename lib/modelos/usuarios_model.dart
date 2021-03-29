import 'dart:convert';

Usuario usuarioFromJson(String str) => Usuario.fromJson(json.decode(str));
String usuarioToJson(Usuario data) => json.encode(data.toJson());

class Usuario {
    Usuario({
        this.nombre,
        this.apellido,
        this.username,
        this.email,
        this.direccion,
        this.fechaNacimiento,
        this.authToken,
    });

    String nombre;
    String apellido;
    String username;
    String email;
    String direccion;
    DateTime fechaNacimiento;
    String authToken;

    factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        nombre: json["nombre"],
        apellido: json["apellido"],
        username: json["username"],
        email: json["email"],
        direccion: json["direccion"],
        fechaNacimiento: DateTime.parse(json["fecha_nacimiento"]),
        authToken: json["Auth-token"],
    );

    Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "apellido": apellido,
        "username": username,
        "email": email,
        "direccion": direccion,
        "fecha_nacimiento": "${fechaNacimiento.year.toString().padLeft(4, '0')}-${fechaNacimiento.month.toString().padLeft(2, '0')}-${fechaNacimiento.day.toString().padLeft(2, '0')}",
        "Auth-token": authToken,
    };
}
