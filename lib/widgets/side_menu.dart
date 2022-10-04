import 'package:flutter/material.dart';
import 'package:lector_qr/screens/peopleScreens.dart';
import 'package:lector_qr/screens/settingsScreens.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          _DrawerHeader(),
          ListTile(
            leading: const Icon(Icons.pages_outlined),
            title: const Text('Settings Teme'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, 'theme');
            },
          ),
          ListTile(
            leading: const Icon(Icons.people),
            title: const Text('People'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, PeopleScreens.routerName);
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, SettingsScreen.routerName);
            },
          ),
        ],
      ),
    );
  }
}

class _DrawerHeader extends StatelessWidget {
  const _DrawerHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      child: Container(),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/menu.jpg'), fit: BoxFit.cover)),
    );
  }
}
