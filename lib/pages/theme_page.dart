import 'package:flutter/material.dart';
import 'package:lector_qr/widgets/side_menu.dart';

class ThemePage extends StatelessWidget {
  const ThemePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings Theme'),
      ),
      drawer: const SideMenu(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text('isDarkmode'),
          Divider(),
          Text('Género: '),
          Divider(),
          Text('Nombre de usuario:'),
          Divider()
        ],
      ),
    );
  }
}
