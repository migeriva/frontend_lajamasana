import 'dart:convert';

List<Suscripcion> suscripcionFromJson(String str) => 
List<Suscripcion>.from(json.decode(str).map((x) => 
				Suscripcion.fromJson(x)));

String suscripcionToJson(List<Suscripcion> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Suscripcion {
  Suscripcion({
    this.id,
    this.nombre,
    this.precio,
    this.duracion,
    this.cantidad,
    this.color,
 });

  int id;
  String nombre;
  int precio;
  String duracion;
  String cantidad;
  String color;

  factory Suscripcion.fromJson(Map<String, dynamic> json) => Suscripcion(
        id: json["id"],
        nombre: json["nombre"],
        precio: json["precio"],
        duracion: json["duracion"],
        cantidad: json["cantidad"],
        color: json["color"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "precio": precio,
        "duracion": duracion,
        "cantidad": cantidad,
        "color": color,
      };
}
