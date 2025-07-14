// import 'package:flutter/material.dart';
// import 'package:furniturestore/core/resources/assets_manager.dart';
// import 'package:furniturestore/widgets/ProductGrid.dart';
// import 'package:furniturestore/widgets/category_list.dart';


// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.transparent,
//         title: Center(child: Image.asset(AssetsManager.Content)),
//         actions: [
          
//           IconButton(
//             icon: const Icon(Icons.shopping_cart_outlined),
//             onPressed: () {},
//           ),
//         ],
//         leading: IconButton(
//             icon: const Icon(Icons.search),
//             onPressed: () {},
//           ),
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: const [
//           CategoryList(),
//           Expanded(child: ProductGrid()),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

import 'package:furniturestore/core/resources/assets_manager.dart';
import 'package:furniturestore/widgets/ProductGrid.dart';
import 'package:furniturestore/widgets/category_list.dart';
import 'package:furniturestore/widgets/custom_bottom_nav_item.dart';


class HomePage extends StatefulWidget {
const HomePage({super.key});

@override
State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
int selectedIndex = 0;

@override
Widget build(BuildContext context) {
return Scaffold(



  appBar: AppBar(
    elevation: 0,
    backgroundColor: Colors.transparent,
    title: Center(
      child: Image.asset(
        AssetsManager.Content,
        height: 40,
      ),
    ),
    leading: IconButton(
      icon: const Icon(Icons.search),
      onPressed: () {},
    ),
    actions: [
      IconButton(
        icon: const Icon(Icons.shopping_cart_outlined),
        onPressed: () {},
      ),
    ],
  ),

  body: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: const [
      CategoryList(),
      Expanded(child: ProductGrid()),
    ],
  ),

  bottomNavigationBar: BottomNavigationBar(
    currentIndex: selectedIndex,
    onTap: (index) {
      setState(() {
        selectedIndex = index;
      });
    },
    type: BottomNavigationBarType.fixed,
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
        label: 'Favorite',
      ),
      BottomNavigationBarItem(
        icon: CustomBottomNavIcon(
          assetPath: IconAssets.bell,
          isSelected: selectedIndex == 2,
        ),
        label: 'Notification',
      ),
      BottomNavigationBarItem(
        icon: CustomBottomNavIcon(
          assetPath: IconAssets.group,
          isSelected: selectedIndex == 3,
        ),
        label: 'Cart',
      ),
    ],
  ),
);
}
}