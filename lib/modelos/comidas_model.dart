import 'dart:convert';

List<Comida> comidaFromJson(String str) => List<Comida>.from(json.decode(str).map((x) => Comida.fromJson(x)));

String comidaToJson(List<Comida> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Comida {
    Comida({
        this.id,
        this.nombre,
        this.descripcion,
        this.precio,
        this.caloriasTotales,
        this.macronutrientes,
        this.idCategoria,
        this.idVendedor,
        this.imagen,
        this.estado,
    });

    int id;
    String nombre;
    String descripcion;
    double precio;
    double caloriasTotales;
    String macronutrientes;
    int idCategoria;
    int idVendedor;
    String imagen;
    bool estado;

    factory Comida.fromJson(Map<String, dynamic> json) => Comida(
        id: json["id"],
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        precio: json["precio"].toDouble(),
        caloriasTotales: json["calorias_totales"].toDouble(),
        macronutrientes: json["macronutrientes"],
        idCategoria: json["id_categoria"],
        idVendedor: json["id_vendedor"],
        imagen: json["imagen"],
        estado: json["estado"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "descripcion": descripcion,
        "precio": precio,
        "calorias_totales": caloriasTotales,
        "macronutrientes": macronutrientes,
        "id_categoria": idCategoria,
        "id_vendedor": idVendedor,
        "imagen": imagen,
        "estado": estado,
    };
}
