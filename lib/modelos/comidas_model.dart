import 'dart:convert';

Comida comidaFromJson(String str) => Comida.fromJson(json.decode(str));

String comidaToJson(Comida data) => json.encode(data.toJson());

class Comida {
    Comida({
        this.id,
        this.nombre,
        this.descripcion,
        this.caloriasTotales,
        this.macronutrientes,
        this.idCategoria,
        this.idVendedor,
        this.imagen,
        this.direccionEnvio,
    });

    int id;
    String nombre;
    String descripcion;
    int caloriasTotales;
    String macronutrientes;
    int idCategoria;
    int idVendedor;
    String imagen;
    String direccionEnvio;

    factory Comida.fromJson(Map<String, dynamic> json) => Comida(
        id: json["id"],
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        caloriasTotales: json["calorias_totales"],
        macronutrientes: json["macronutrientes"],
        idCategoria: json["id_categoria"],
        idVendedor: json["id_vendedor"],
        imagen: json["imagen"],
        direccionEnvio: json["direccion_envio"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "descripcion": descripcion,
        "calorias_totales": caloriasTotales,
        "macronutrientes": macronutrientes,
        "id_categoria": idCategoria,
        "id_vendedor": idVendedor,
        "imagen": imagen,
        "direccion_envio": direccionEnvio,
    };
}
