import 'dart:convert';

class Bicis {
  Bicis({
    required this.disponible,
    this.imagen,
    required this.nombre,
    required this.precio,
  });

  String? id;
  bool disponible;
  String? imagen;
  String nombre;
  double precio;

  factory Bicis.fromJson(String str) => Bicis.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Bicis.fromMap(Map<String, dynamic> json) => Bicis(
        disponible: json["disponible"],
        imagen: json["imagen"],
        nombre: json["nombre"],
        precio: json["precio"],
      );

  Map<String, dynamic> toMap() => {
        "disponible": disponible,
        "imagen": imagen,
        "nombre": nombre,
        "precio": precio,
      };
}
