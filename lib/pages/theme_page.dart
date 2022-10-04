import 'package:flutter/material.dart';
import 'package:lector_qr/share_preferences/preferences.dart';
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
        children: [
          Text('isDarkmode: ${Preferences.isDarkmode}'),
          const Divider(),
          Text('Género: ${Preferences.gender}'),
          const Divider(),
          Text('Nombre de usuario:${Preferences.name}'),
          const Divider()
        ],
      ),
    );
  }
}
