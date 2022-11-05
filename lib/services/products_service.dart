import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lector_qr/models/bici_model.dart';
import 'package:http/http.dart' as http;

class ProductsService extends ChangeNotifier {
  final String _baseUrl = 'miapp-fa929-default-rtdb.firebaseio.com';
  final List<Bici> bicis = [];
  Bici? selectedBici;
  bool isLoading = true;
  bool isSaving = false;

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

  Future saveOrCreateProduct(Bici bici) async {
    isSaving = true;
    notifyListeners();
    if (bici.id == null) {
    } else {
      await updateProduct(bici);
    }
    isSaving = false;
    notifyListeners();
  }

  Future<String> updateProduct(Bici bici) async {
    final url = Uri.https(_baseUrl, '/bicis/${bici.id}.json');
    final resp = await http.put(url, body: bici.toJson());
    final decodedData = resp.body;
    print(decodedData);

    //TODO: Actualizar el listado de productos
    /*for (var i = 0; i < bicis.length; i++) {
      if (bicis[i].id == bici.id) {
        bicis[i] = bici;
      }
    }*/
    //Nueva forma
    final index = bicis.indexWhere((element) => element.id == bici.id);
    bicis[index] = bici;
    return bici.id!;
  }
}
