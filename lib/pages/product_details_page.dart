// import 'package:flutter/material.dart';
// import 'package:furniturestore/model/product_model.dart';

// class ProductDetailsPage extends StatelessWidget {
// final ProductModel product;

// const ProductDetailsPage({super.key, required this.product});

// @override
// Widget build(BuildContext context) {
// return Scaffold(
// backgroundColor: Colors.white,
// appBar: AppBar(
// backgroundColor: Colors.transparent,
// elevation: 0,
// leading: BackButton(color: Colors.black),
// actions: [
// IconButton(
// icon: const Icon(Icons.favorite_border, color: Colors.black),
// onPressed: () {},
// ),
// ],
// ),
// body: Padding(
// padding: const EdgeInsets.all(16.0),
// child: Column(
// children: [
// // صورة المنتج
// ClipRRect(
// borderRadius: BorderRadius.circular(16),
// child: Image.asset(
// product.image,
// height: 250,
// width: double.infinity,
// fit: BoxFit.cover,
// ),
// ),
// const SizedBox(height: 24),

//         // اسم المنتج + السعر
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               product.name,
//               style:
//                   const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             Text(
//               '\$${product.price.toStringAsFixed(2)}',
//               style: const TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.orange),
//             ),
//           ],
//         ),
//         const SizedBox(height: 16),

//         // وصف مؤقت للمنتج
//         const Text(
//           'This is a beautiful product that fits your home perfectly. Made with love and great material.',
//           style: TextStyle(fontSize: 14, color: Colors.grey),
//         ),

//         const Spacer(),

//         // زر الإضافة إلى السلة
//         SizedBox(
//           width: double.infinity,
//           child: ElevatedButton(
//             onPressed: () {},
//             style: ElevatedButton.styleFrom(
//               padding: const EdgeInsets.symmetric(vertical: 16),
//               backgroundColor: Colors.orange,
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12)),
//             ),
//             child: const Text(
//               'Add to Cart',
//               style: TextStyle(fontSize: 16),
//             ),
//           ),
//         )
//       ],
//     ),
//   ),
// );
// }
// }
import 'package:flutter/material.dart';
import 'package:furniturestore/model/product_model.dart';

class ProductDetailsPage extends StatelessWidget {
  final ProductModel product;

  const ProductDetailsPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔼 صورة المنتج تغطي الجزء العلوي
          Stack(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(product.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SafeArea(
                child: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context),
                  color: Colors.white,
                ),
              ),
            ],
          ),

          // 🔽 تفاصيل المنتج
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '\$${product.price.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.orange,
                    ),
                  ),
                  const SizedBox(height: 24),

                  const Text(
                    'This is a beautiful furniture item that fits perfectly into your home. Crafted with high-quality material, it offers both style and comfort.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      height: 1.5,
                    ),
                  ),
                  const Spacer(),

                  // زر الإضافة إلى السلة
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Add to Cart',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
