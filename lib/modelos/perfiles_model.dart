import 'dart:convert';

List<Perfiles> perfilesFromJson(String str) =>
    List<Perfiles>.from(json.decode(str).map((x) => Perfiles.fromJson(x)));

String perfilesToJson(List<Perfiles> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Perfiles {
  Perfiles({
    this.id,
    this.nombre,
    this.imagen,
  });

  int id;
  String nombre;
  String imagen;

  factory Perfiles.fromJson(Map<String, dynamic> json) => Perfiles(
        id: json["id"],
        nombre: json["nombre"],
        imagen: json["imagen"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "imagen": imagen,
      };
}
