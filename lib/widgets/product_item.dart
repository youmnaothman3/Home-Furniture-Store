// // // 
// // import 'package:flutter/material.dart';
// // import 'package:furniturestore/model/product_model.dart';
// // import 'package:furniturestore/pages/product_details_page.dart';

// // class ProductItem extends StatelessWidget {
// // final ProductModel product;

// // const ProductItem({super.key, required this.product});

// // @override
// // Widget build(BuildContext context) {
// // return GestureDetector(
// // onTap: () {
// // Navigator.push(
// // context,
// // MaterialPageRoute(
// // builder: (_) => ProductDetailsPage(product: product),
// // ),
// // );
// // },
// // child: Container(
// // decoration: BoxDecoration(
// // color: const Color(0xfff5f5f5),
// // borderRadius: BorderRadius.circular(16),
// // ),
// // child: Column(
// // children: [
// // Expanded(
// // child: Image.asset(product.image, fit: BoxFit.cover),
// // ),
// // const SizedBox(height: 8),
// // Text(product.name,
// // style: const TextStyle(fontWeight: FontWeight.bold)),
// // Text('\$${product.price.toStringAsFixed(2)}',
// // style: const TextStyle(color: Colors.grey)),
// // ],
// // ),
// // ),
// // );
// // }
// // }
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:furniturestore/model/product_model.dart';
// import 'package:furniturestore/pages/product_details_page.dart';

// class ProductItem extends StatelessWidget {
//   final ProductModel product;

//   const ProductItem({super.key, required this.product});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (_) => ProductDetailsPage(product: product),
//           ),
//         );
//       },
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(16),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.05),
//               blurRadius: 10,
//               offset: const Offset(0, 4),
//             ),
//           ],
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Expanded(
//               child: ClipRRect(
//                 borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
//                 child: Image.asset(
//                   product.image,
//                   width: double.infinity,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         product.name,
//                         style: const TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                       const SizedBox(height: 4),
//                       Text(
//                         '\$${product.price}',
//                         style: const TextStyle(color: Colors.orange),
//                       ),
//                     ],
//                   ),
//                   Container(
//                     padding: const EdgeInsets.all(6),
//                     decoration: BoxDecoration(
//                       color: Colors.grey[300],
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: SvgPicture.asset(
//                       'assets/icons/shopping_bag icon.svg',
//                       width: 20,
//                       height: 20,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniturestore/model/product_model.dart';
import 'package:furniturestore/pages/product_details_page.dart';

class ProductItem extends StatelessWidget {
  final ProductModel product;

  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ProductDetailsPage(product: product),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                child: Image.asset(
                  product.image,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '\$${product.price}',
                        style: const TextStyle(color: Colors.orange),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: SvgPicture.asset(
                      'assets/icons/shopping_bag icon.svg',
                      width: 20,
                      height: 20,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
