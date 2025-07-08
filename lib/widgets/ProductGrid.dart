import 'package:flutter/material.dart';
import 'package:furniturestore/model/product_model.dart';

import 'product_item.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ProductModel> products = [
      ProductModel(
        name: 'Black Simple lamp',
        price: 12.00,
        image: 'assets/images/lamp.jpg',
      ),
      ProductModel(
        name: 'Minimal Stand',
        price: 25.00,
        image: 'assets/images/lamp.jpg',
      ),
      ProductModel(
        name: 'Coffee Chair',
        price: 12.00,
       image: 'assets/images/lamp.jpg',
      ),
      ProductModel(
        name: 'Simple Desk',
        price: 25.00,
       image: 'assets/images/lamp.jpg',
      ),
    ];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 0.75,
        ),
        itemBuilder: (context, index) {
          return ProductItem(product: products[index]);
        },
      ),
    );
  }
}
