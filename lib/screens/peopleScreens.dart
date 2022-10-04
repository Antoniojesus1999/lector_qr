import 'package:flutter/material.dart';

import '../widgets/side_menu.dart';

class PeopleScreens extends StatelessWidget {
  static const routerName = 'people';

  const PeopleScreens({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('People'),
      ),
      drawer: const SideMenu(),
      body: const Center(
        child: Text('PEOPLE!'),
      ),
    );
  }
}
