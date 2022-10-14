// To parse this JSON data, do
//
//     final product = productFromMap(jsonString);

import 'dart:convert';

class Product {
  Product({
    required this.bicis,
  });

  Bicis bicis;

  factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        bicis: Bicis.fromMap(json["bicis"]),
      );

  Map<String, dynamic> toMap() => {
        "bicis": bicis.toMap(),
      };
}

class Bicis {
  Bicis({
    required this.cannyon,
    required this.scott,
    required this.trek,
  });
  Marcas cannyon;
  Marcas scott;
  Marcas trek;

  factory Bicis.fromJson(String str) => Bicis.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Bicis.fromMap(Map<String, dynamic> json) => Bicis(
        cannyon: Marcas.fromMap(json["Cannyon"]),
        scott: Marcas.fromMap(json["Scott"]),
        trek: Marcas.fromMap(json["Trek"]),
      );

  Map<String, dynamic> toMap() => {
        "Cannyon": cannyon.toMap(),
        "Scott": scott.toMap(),
        "Trek": trek.toMap(),
      };
}

class Marcas {
  Marcas({
    required this.descripcion,
    required this.disponible,
    required this.imagen,
    required this.nombre,
    required this.precio,
  });

  String descripcion;
  bool disponible;
  String imagen;
  String nombre;
  double precio;

  factory Marcas.fromJson(String str) => Marcas.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Marcas.fromMap(Map<String, dynamic> json) => Marcas(
        descripcion: json["descripcion"],
        disponible: json["disponible"],
        imagen: json["imagen"],
        nombre: json["nombre"],
        precio: json["precio"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "descripcion": descripcion,
        "disponible": disponible,
        "imagen": imagen,
        "nombre": nombre,
        "precio": precio,
      };
}
