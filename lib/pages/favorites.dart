import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniturestore/core/resources/assets_manager.dart';
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
  int selectedIndex = 1;

  List<ProductModel> favoriteProducts = [
    ProductModel(
      name: "Minimal Stand",
      image: "assets/images/lamp.jpg",
      price: 25.00,
      boolshopping: true,
    ),
    ProductModel(
      name: "Black Chair",
      image: "assets/images/lamp.jpg",
      price: 25.00,
      boolshopping: true,
    ),
    ProductModel(
      name: "Simple Desk",
      image: "assets/images/lamp.jpg",
      price: 25.00,
      boolshopping: true,
    ),
  ];

  void removeFromFavorites(ProductModel product) {
    setState(() {
      favoriteProducts.remove(product);
    });
  }

  void navigateToPage(int index) {
    setState(() {
      selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/homepage');
        break;
      case 1:
        // أنت بالفعل بصفحة المفضلة
        break;
      case 2:
        Navigator.pushNamed(context, '/cart');
        break;
      case 3:
        Navigator.pushNamed(context, '/profile');
        break;
    }
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
            CustomButton(
              title: 'Add all to my cart',
              backgroundColor: ColorsManager.primarycolor,
              borderRadius: 12,
              onPressed: () {
                Navigator.pushNamed(context, '/cart');
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: navigateToPage,
        selectedItemColor: ColorsManager.primarycolor,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: CustomBottomNavIcon(
              assetPath: IconAssets.clarity_home,
              isSelected: selectedIndex == 0,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: CustomBottomNavIcon(
              assetPath: IconAssets.marker,
              isSelected: selectedIndex == 1,
            ),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: CustomBottomNavIcon(
              assetPath: IconAssets.bell,
              isSelected: selectedIndex == 2,
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: CustomBottomNavIcon(
              assetPath: IconAssets.group,
              isSelected: selectedIndex == 3,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class CustomBottomNavIcon extends StatelessWidget {
  final String assetPath;
  final bool isSelected;

  const CustomBottomNavIcon({
    super.key,
    required this.assetPath,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetPath,
      color: isSelected ? ColorsManager.primarycolor : Colors.grey,
      width: 24,
      height: 24,
    );
  }
}
