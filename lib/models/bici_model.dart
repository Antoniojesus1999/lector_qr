import 'dart:convert';

class Bici {
  String? id;
  bool disponible;
  String? imagen;
  String nombre;
  double precio;

  Bici({
    this.id,
    required this.disponible,
    this.imagen,
    required this.nombre,
    required this.precio,
  });

  factory Bici.fromJson(String str) => Bici.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Bici.fromMap(Map<String, dynamic> json) => Bici(
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

  Bici copy() => Bici(
      disponible: disponible,
      nombre: nombre,
      precio: precio,
      imagen: imagen,
      id: id);
}
