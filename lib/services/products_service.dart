import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lector_qr/models/bici_model.dart';
import 'package:http/http.dart' as http;

class ProductsService extends ChangeNotifier {
  final String _baseUrl = 'miapp-fa929-default-rtdb.firebaseio.com';
  final List<Bici> bicis = [];
  Bici? selectedBici;
  bool isLoading = true;

  ProductsService() {
    loadProduct();
  }

  Future<List<Bici>> loadProduct() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.https(_baseUrl, '/bicis.json');
    final resp = await http.get(url);

    final Map<String, dynamic> bicisMap = json.decode(resp.body);
    bicisMap.forEach((key, value) {
      final tempBici = Bici.fromMap(value);
      tempBici.id = key;
      bicis.add(tempBici);
    });

    isLoading = false;
    notifyListeners();
    return bicis;
  }
}
