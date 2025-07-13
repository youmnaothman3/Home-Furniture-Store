import 'package:flutter/material.dart';
import 'package:furniturestore/core/resources/colors_manger.dart';
import 'package:furniturestore/model/product_model.dart';


class FavoriteItem extends StatelessWidget {
  final ProductModel product;
  final VoidCallback onDelete;

  const FavoriteItem({
    super.key,
    required this.product,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            product.image,
            height: 70,
            width: 70,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          product.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          '\$${product.price.toStringAsFixed(2)}',
          style: const TextStyle(
            color: ColorsManager.primarycolor,
            fontWeight: FontWeight.w600,
          ),
        ),
        trailing: Column(
          children: [
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: onDelete,
            ),
            
          ],
        ),
        
      ),
    );
  }
}