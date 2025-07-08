import 'package:flutter/material.dart';
import 'package:furniturestore/core/resources/assets_manager.dart';
import 'package:furniturestore/widgets/ProductGrid.dart';
import 'package:furniturestore/widgets/category_list.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Center(child: Image.asset(AssetsManager.Content)),
        actions: [
          
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () {},
          ),
        ],
        leading: IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          CategoryList(),
          Expanded(child: ProductGrid()),
        ],
      ),
    );
  }
}
