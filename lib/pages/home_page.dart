import 'package:flutter/material.dart';
import 'package:lector_qr/widgets/custom_navigator_bar.dart';
import 'package:lector_qr/widgets/scan_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Center(child: Text('Historial')),
          elevation: 0,
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.delete_forever))
          ]),
      body: const Center(
        child: Text('Home page'),
      ),
      bottomNavigationBar: const CustomNaviagtorBar(),
      floatingActionButton: const ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
