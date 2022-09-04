import 'package:flutter/material.dart';
import 'package:lector_qr/providers/db_provider.dart';

class ScanListProvider extends ChangeNotifier {
  List<ScanModel> scans = [];
  String tipoSeleccionado = 'http';

  nuevoScan(String valor) async {
    final nuevoScan = new ScanModel(valor: valor);

    final id = await DBProvider.db.nuevoScan(nuevoScan);
    nuevoScan.id = id;

    if (tipoSeleccionado == nuevoScan.tipo) {
      scans.add(nuevoScan);
      notifyListeners();
    }
  }

  cargarScans() async {
    scans = (await DBProvider.db.getTodosLosScans())!;
    scans = [...scans];
    notifyListeners();
  }

  cargarScanPortTipo(String tipo) async {
    scans = (await DBProvider.db.getScansPorTipo(tipo))!;
    tipoSeleccionado = tipo;
    scans = [...scans];
    notifyListeners();
  }

  borrarTodos() async {
    await DBProvider.db.deleteAllScans();
    scans = [];
    notifyListeners();
  }

  borrarScanPorId(int id) async {
    await DBProvider.db.deleteScan(id);
    cargarScanPortTipo(tipoSeleccionado);
  }
}
