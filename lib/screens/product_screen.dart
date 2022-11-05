import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lector_qr/providers/product_form.dart';
import 'package:lector_qr/services/products_service.dart';
import 'package:lector_qr/ui/input_decorations.dart';
import 'package:lector_qr/widgets/product_image.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productsService = Provider.of<ProductsService>(context);
    return ChangeNotifierProvider(
      create: (_) => ProductFormProvider(productsService.selectedBici!),
      child: _ProducScreenBody(productsService: productsService),
    );
  }
}

class _ProducScreenBody extends StatelessWidget {
  const _ProducScreenBody({
    Key? key,
    required this.productsService,
  }) : super(key: key);

  final ProductsService productsService;

  @override
  Widget build(BuildContext context) {
    final productForm = Provider.of<ProductFormProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        //Hacer que se oculte el teclado cuando se haga scroll
        //keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          children: [
            Stack(
              children: [
                ProductImage(url: productsService.selectedBici?.imagen),
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
        onPressed: () async {
          if (!productForm.isValidForm()) return;
          await productsService.saveOrCreateProduct(productForm.bici);
        },
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
    final productForm = Provider.of<ProductFormProvider>(context);
    final product = productForm.bici;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: _buildBoxDecoration(),
        width: double.infinity,
        child: Form(
            key: productForm.formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  initialValue: product.nombre,
                  onChanged: (value) => product.nombre = value,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'El nombre es obligatorio';
                    }
                  },
                  decoration: InputDecorations.authInputDecoration(
                      hintText: 'Nombre del producto', labelText: 'Nombre: '),
                ),
                TextFormField(
                  initialValue: '${product.precio}',
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp(r'^(\d+)?\.?\d{0,2}'))
                  ],
                  onChanged: (value) {
                    if (double.tryParse(value) == null) {
                      product.precio = 0;
                    } else {
                      product.precio = double.parse(value);
                    }
                  },
                  decoration: InputDecorations.authInputDecoration(
                      hintText: '\$150', labelText: 'Precio: '),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 5,
                ),
                SwitchListTile.adaptive(
                    value: product.disponible,
                    title: const Text('Disponible'),
                    activeColor: const Color.fromARGB(255, 0, 255, 255),
                    //onChanged: (value) => productForm.updateAbilitar(value)),
                    onChanged: productForm.updateAbilitar),
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
