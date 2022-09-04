import 'package:flutter/material.dart';
import 'package:lector_qr/pages/direcciones_page.dart';
import 'package:lector_qr/pages/mapas_page.dart';
import 'package:lector_qr/providers/db_provider.dart';
import 'package:lector_qr/providers/ui_provider.dart';
import 'package:lector_qr/widgets/custom_navigator_bar.dart';
import 'package:lector_qr/widgets/scan_button.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Historial'),
          elevation: 0,
          centerTitle: true,
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.delete_forever))
          ]),
      body: _HomePageBody(),
      bottomNavigationBar: const CustomNaviagtorBar(),
      floatingActionButton: const ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectedMenuOpt;
    //TODO TEMPORAL
    //final temp = new ScanModel(valor: 'http://google.es');
    //supuesta mente muestra el id
    //final intTemp = DBProvider.db.nuevoScan(temp);
    //DBProvider.db.getScanById(1).then((scan) => print(scan?.valor));
    DBProvider.db.deleteAllScans().then(print);

    switch (currentIndex) {
      case 0:
        return MapasPage();
      default:
        return DireccionesPages();
    }
  }
}
