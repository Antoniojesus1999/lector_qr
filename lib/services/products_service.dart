import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:lector_qr/models/bici_model.dart';
import 'package:http/http.dart' as http;

class ProductsService extends ChangeNotifier {
  final String _baseUrl = 'miapp-fa929-default-rtdb.firebaseio.com';
  final List<Bici> bicis = [];
  Bici? selectedBici;
  bool isLoading = true;

  final storage = const FlutterSecureStorage();

  bool isSaving = false;
  File? newPictureFile;

  ProductsService() {
    loadProduct();
  }

  Future<List<Bici>> loadProduct() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.https(_baseUrl, '/bicis.json',
        {'auth': await storage.read(key: 'token') ?? ''});
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
      await createProduct(bici);
    } else {
      await updateProduct(bici);
    }
    isSaving = false;
    notifyListeners();
  }

  Future<String> updateProduct(Bici bici) async {
    final url = Uri.https(_baseUrl, '/bicis/${bici.id}.json',
        {'auth': await storage.read(key: 'token') ?? ''});
    final resp = await http.put(url, body: bici.toJson());
    final decodedData = resp.body;

    /*for (var i = 0; i < bicis.length; i++) {
      if (bicis[i].id == bici.id) {
        bicis[i] = bici;
      }
    }*/
    //Nueva forma mas rápida y eficiente
    final index = bicis.indexWhere((element) => element.id == bici.id);
    bicis[index] = bici;
    return bici.id!;
  }

  Future<String> createProduct(Bici bici) async {
    final url = Uri.https(_baseUrl, '/bicis.json',
        {'auth': await storage.read(key: 'token') ?? ''});
    final resp = await http.post(url, body: bici.toJson());
    final decodedData = json.decode(resp.body);
    bici.id = decodedData['name'];
    bicis.add(bici);

    return '';
  }

  void updateSelectedProductImage(String path) {
    selectedBici?.imagen = path;
    newPictureFile = File.fromUri(Uri(path: path));
    notifyListeners();
  }

  Future<String?> uploadImage() async {
    if (newPictureFile == null) return null;

    isSaving = true;
    notifyListeners();
    final url = Uri.parse(
        'https://api.cloudinary.com/v1_1/dinpeg0kw/image/upload?upload_preset=flutter');
    final imageUploadRequest = http.MultipartRequest('POST', url);
    final file =
        await http.MultipartFile.fromPath('file', newPictureFile!.path);

    imageUploadRequest.files.add(file);

    final streamResponse = await imageUploadRequest.send();

    final resp = await http.Response.fromStream(streamResponse);
    if (resp.statusCode != 200 && resp.statusCode != 201) {
      print('algo salio mal');
      print(resp.body);
      return null;
    }
    newPictureFile = null;
    final decodedData = json.decode(resp.body);
    return decodedData['secure_url'];
  }
}
