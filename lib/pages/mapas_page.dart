import 'package:flutter/material.dart';
import 'package:lector_qr/widgets/scan_titles.dart';
import 'package:provider/provider.dart';

import '../providers/scan_list_provider.dart';

class MapasPage extends StatelessWidget {
  const MapasPage({super.key});

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;

    return const ScanTitles(tipo: 'geo');
  }
}
