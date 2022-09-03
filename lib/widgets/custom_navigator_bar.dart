import 'package:flutter/material.dart';

class CustomNaviagtorBar extends StatelessWidget {
  const CustomNaviagtorBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(currentIndex: 1, elevation: 0, items: const [
      BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Mapa'),
      BottomNavigationBarItem(
          icon: Icon(Icons.compass_calibration), label: 'Direcciones')
    ]);
  }
}
