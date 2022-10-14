import 'package:flutter/material.dart';
import 'package:lector_qr/services/products_service.dart';
import 'package:lector_qr/widgets/product_card.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    final productsService = Provider.of<ProductsService>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Productos'),
      ),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, index) => GestureDetector(
                onTap: () => Navigator.pushNamed(context, 'product'),
                child: const ProductCard(),
              )),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
