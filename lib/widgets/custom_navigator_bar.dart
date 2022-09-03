import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/ui_provider.dart';

class CustomNaviagtorBar extends StatelessWidget {
  const CustomNaviagtorBar({super.key});

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);

    final currenIndex = uiProvider.selectedMenuOpt;
    return BottomNavigationBar(
        //onTap: (int i) => print('opt: $i'),
        onTap: (int i) => uiProvider.selectedMenuOpt = i,
        currentIndex: currenIndex,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Mapa'),
          BottomNavigationBarItem(
              icon: Icon(Icons.compass_calibration), label: 'Direcciones')
        ]);
  }
}
