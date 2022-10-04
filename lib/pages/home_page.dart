import 'package:flutter/material.dart';
import 'package:lector_qr/pages/direcciones_page.dart';
import 'package:lector_qr/pages/mapas_page.dart';
import 'package:lector_qr/providers/scan_list_provider.dart';
import 'package:lector_qr/providers/ui_provider.dart';
import 'package:lector_qr/widgets/custom_navigator_bar.dart';
import 'package:lector_qr/widgets/scan_button.dart';
import 'package:lector_qr/widgets/side_menu.dart';
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
            IconButton(
                onPressed: () {
                  final scanListprovider =
                      Provider.of<ScanListProvider>(context, listen: false);
                  scanListprovider.borrarTodos();
                },
                icon: const Icon(Icons.delete_forever))
          ]),
      drawer: const SideMenu(),
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
    final scanListProvider =
        Provider.of<ScanListProvider>(context, listen: false);
    switch (currentIndex) {
      case 0:
        scanListProvider.cargarScanPortTipo('geo');
        return MapasPage();
      default:
        scanListProvider.cargarScanPortTipo('http');

        return DireccionesPages();
    }
  }
}
