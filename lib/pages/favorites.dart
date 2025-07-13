import 'package:flutter/material.dart';
import 'package:furniturestore/core/resources/colors_manger.dart';
import 'package:furniturestore/model/product_model.dart';
import 'package:furniturestore/widgets/custom_button.dart';
import 'package:furniturestore/widgets/custom_fouverait_item.dart';


class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritepageState();
}

class _FavoritepageState extends State<FavoritesPage> {
  List<ProductModel> favoriteProducts = [
    ProductModel(
      name: "Minimal Stand",
      image: "assets/images/chair.png",
      price: 25.00,
      boolshopping: true,
    ),
    ProductModel(
      name: "Black Chair",
      image: "assets/images/chair.png",
      price: 25.00,
      boolshopping: true,
    ),
    ProductModel(
      name: "Simple Desk",
      image: "assets/images/chair.png",
      price: 25.00,
      boolshopping: true,
    ),
  ];

  void removeFromFavorites(ProductModel product) {
    setState(() {
      favoriteProducts.remove(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // ✅ قائمة المفضلة
            Expanded(
              child: ListView.builder(
                itemCount: favoriteProducts.length,
                itemBuilder: (context, index) {
                  final product = favoriteProducts[index];
                  return FavoriteItem(
                    product: product,
                    onDelete: () => removeFromFavorites(product),
                  );
                  
                },
              ),
            ),

            const SizedBox(height: 12),

            // ✅ زر الإضافة إلى السلة
            CustomButton(
  title: 'Add all to my cart',
  backgroundColor: ColorsManager.primarycolor,
  borderRadius: 12,
  onPressed: () {
    // منضيف كل العناصر لعربة التسوق
  },
),

          ],
        ),
      ),
    );
  }
}