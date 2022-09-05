import 'package:flutter/material.dart';
import '../widgets/scan_titles.dart';

class DireccionesPages extends StatelessWidget {
  const DireccionesPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ScanTitles(tipo: 'http');
  }
}
