import 'package:flutter/material.dart';
import 'package:lector_qr/widgets/scan_titles.dart';

class MapaPage extends StatelessWidget {
  const MapaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ScanTitles(tipo: 'geo');
  }
}
