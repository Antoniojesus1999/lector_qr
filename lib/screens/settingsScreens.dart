import 'package:flutter/material.dart';

import '../widgets/side_menu.dart';

class SettingsScreen extends StatefulWidget {
  static const routerName = 'settings';

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isDarkmode = false;
  int gender = 1;
  String nombre = 'Antonio';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
        ),
        drawer: const SideMenu(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Ajustes',
                    style:
                        TextStyle(fontSize: 45, fontWeight: FontWeight.w300)),
                const Divider(),
                SwitchListTile.adaptive(
                    value: isDarkmode,
                    title: const Text('Darkmode'),
                    onChanged: (value) {
                      isDarkmode = value;
                      setState(() {});
                    }),
                const Divider(),
                RadioListTile<int>(
                    value: 1,
                    groupValue: gender,
                    title: const Text('Masculino'),
                    onChanged: (value) {
                      gender = value ?? 2;
                      setState(() {});
                    }),
                const Divider(),
                RadioListTile<int>(
                    value: 2,
                    groupValue: gender,
                    title: const Text('Femenino'),
                    onChanged: (value) {
                      gender = value ?? 2;
                      setState(() {});
                    }),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    initialValue: 'Antonio Jesús',
                    onChanged: (value) {
                      nombre = value;
                      setState(() {});
                    },
                    decoration: const InputDecoration(
                        labelText: 'Nombre', helperText: 'Nombre del usuario'),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
