import 'dart:io';

import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  final String? url;

  const ProductImage({Key? key, this.url}) : super(key: key);

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
                child: Opacity(
                  opacity: 0.9,
                  child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(45),
                          topRight: Radius.circular(45)),
                      child: getImage(url)),
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
          color: Colors.white,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(45), topRight: Radius.circular(45)),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 5))
          ]);

  Widget getImage(String? imagen) {
    if (imagen == null) {
      return const Image(
        image: AssetImage('assets/noimage.png'),
        fit: BoxFit.cover,
      );
    }
    if (imagen.startsWith('http')) {
      return FadeInImage(
        placeholder: const AssetImage('assets/loading.gif'),
        image: NetworkImage(url!),
        fit: BoxFit.cover,
      );
    }
    return Image.file(
      File(imagen),
      fit: BoxFit.cover,
    );
  }
}
