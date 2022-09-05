import 'dart:js';

import 'package:flutter/material.dart';
import 'package:lector_qr/widgets/scan_titles.dart';

import '../models/scan_model.dart';

class MapaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ScanModel scan =
        ModalRoute.of(context)?.settings.arguments as ScanModel;

    return Scaffold(
      body: Center(child: Text('Mapa page')),
    );
  }
}
