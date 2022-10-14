import 'package:flutter/material.dart';
import 'package:lector_qr/ui/input_decorations.dart';
import 'package:lector_qr/widgets/product_image.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                const ProductImage(),
                Positioned(
                    top: 60,
                    left: 20,
                    child: IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: const Icon(
                          Icons.arrow_back_ios_new,
                          size: 40,
                          color: Color.fromARGB(255, 3, 255, 196),
                        ))),
                Positioned(
                    top: 60,
                    right: 20,
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.camera_enhance_outlined,
                          size: 40,
                          color: Color.fromARGB(255, 3, 255, 196),
                        )))
              ],
            ),
            const _ProductForm()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.save_outlined),
      ),
    );
  }
}

class _ProductForm extends StatelessWidget {
  const _ProductForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: _buildBoxDecoration(),
        width: double.infinity,
        child: Form(
            child: Column(
          children: [
            const SizedBox(
              height: 5,
            ),
            TextFormField(
              decoration: InputDecorations.authInputDecoration(
                  hintText: 'Nombre del producto', labelText: 'Nombre: '),
            ),
            TextFormField(
              decoration: InputDecorations.authInputDecoration(
                  hintText: '\$150', labelText: 'Precio: '),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 5,
            ),
            SwitchListTile.adaptive(
                value: true,
                title: const Text('Disponible'),
                activeColor: const Color.fromARGB(255, 0, 255, 255),
                onChanged: (value) {}),
            const SizedBox(
              height: 20,
            ),
          ],
        )),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
          color: const Color.fromARGB(255, 184, 255, 243),
          borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.3),
                offset: const Offset(0, 5),
                blurRadius: 5)
          ]);
}
