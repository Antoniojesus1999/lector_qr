import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lector_qr/models/product.dart';
import 'package:http/http.dart' as http;

class ProductsService extends ChangeNotifier {
  final String _baseUrl = 'miapp-fa929-default-rtdb.firebaseio.com';
  final List<Bicis> products = [];
  bool isLoading = true;

  ProductsService() {
    loadProduct();
  }

  Future loadProduct() async {
    final url = Uri.https(_baseUrl, '/productos.json');
    final resp = await http.get(url);

    final Map<String, dynamic> productsMap = json.decode(resp.body);

    productsMap.forEach((key, value) {
      final bicis = Bicis.fromMap(value);
      products.add(bicis);
      print(products[0].cannyon.nombre);
    });
  }
}
