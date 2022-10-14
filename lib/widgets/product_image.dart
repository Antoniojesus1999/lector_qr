import 'dart:io';

import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Container(
                decoration: _buildBoxDecoration(),
                width: double.infinity,
                height: 350,
                child: const ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(45),
                      topRight: Radius.circular(45)),
                  child: FadeInImage(
                    placeholder: AssetImage('assets/loading.gif'),
                    image: AssetImage('assets/loading.gif'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
            child: Container(
              decoration: _buildBoxDecoration(),
              width: double.infinity,
              height: 400,
              child: const ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(45),
                    topRight: Radius.circular(45)),
                child: FadeInImage(
                  placeholder: AssetImage('assets/loading.gif'),
                  image: AssetImage('assets/loading.gif'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
          color: Colors.red,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(45), topRight: Radius.circular(45)),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 5))
          ]);
}
