import 'package:flutter/material.dart';
import 'package:lector_qr/screens/loading_screen.dart';
import 'package:lector_qr/services/products_service.dart';
import 'package:lector_qr/widgets/product_card.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    final productsService = Provider.of<ProductsService>(context);
    if (productsService.isLoading) return const LoadingScreen();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Productos'),
      ),
      body: ListView.builder(
          itemCount: productsService.bicis.length,
          itemBuilder: (BuildContext context, index) => GestureDetector(
                onTap: () {
                  productsService.selectedBici =
                      productsService.bicis[index].copy();
                  Navigator.pushNamed(context, 'product');
                },
                child: ProductCard(bici: productsService.bicis[index]),
              )),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
