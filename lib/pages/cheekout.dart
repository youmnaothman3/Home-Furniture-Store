// import 'package:flutter/material.dart';
// import 'package:furniturestore/core/resources/colors_manger.dart';
// import 'package:furniturestore/widgets/custom_button.dart';
// import 'package:furniturestore/widgets/info_card.dart';
// import 'package:furniturestore/widgets/info_section.dart';
// import 'package:furniturestore/widgets/price_row.dart';

// class CheckOut extends StatelessWidget {
//   const CheckOut({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: const Text('Check out', style: TextStyle(color: Colors.black)),
//         backgroundColor: Colors.white,
//         elevation: 0,
//         centerTitle: true,
//         iconTheme: const IconThemeData(color: Colors.black),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // 🔸 عنوان الشحن خارج الكارد
//             const Text(
//               'Shipping address',
//               style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 8),

//             // 🔸 كارد فيه الاسم بلون أورنج و عنوان تحته
//             InfoCard(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   RichText(
//                     text: const TextSpan(
//                       style: TextStyle(fontSize: 14),
//                       children: [
//                         TextSpan(
//                           text: 'Bruno Fernandes\n',

//                           style: TextStyle(
//                             color: Colors.orange,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
                       

//                         TextSpan(
//                           text:
//                               '25 rue Robert Latouche, Nice, 06200, Côte D’azur, France',
//                           style: TextStyle(color: Colors.black87),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   Divider(color: Colors.grey, thickness: 0.5),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 16),

//             // 💳 Payment Card
//             InfoCard(
//               child: InfoSection(
//                 title: 'Payment',
//                 value: '•••• •••• •••• 3947',
//                 onEdit: () {},
//                 titleColor: ColorsManager.primarycolor, // TODO
//               ),
//             ),

//             const SizedBox(height: 16),

//             // 🚚 Delivery Method Card
//             InfoCard(
//               child: InfoSection(
//                 title: 'Delivery method',
//                 value: 'DHL — Fast (2-3days)',
//                 onEdit: () {}, // TODO
//                 leading: Image.asset(
//                   'assets/images/dhl.png',
//                   width: 48,
//                   height: 24,
//                 ),
//                 titleColor: ColorsManager.primarycolor,
//               ),
//             ),

//             const SizedBox(height: 24),

//             // 💰 Summary Card
//             InfoCard(
//               child: Column(
//                 children: [
//                   PriceRow(label: 'Order', amount: '\$95.00'),
//                   PriceRow(label: 'Delivery', amount: '\$5.00'),
//                   const Divider(height: 20, thickness: 1),
//                   PriceRow(label: 'Total', amount: '\$100.00', isBold: true),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 24),

//             // ✅ Submit Button
//             SizedBox(
//               width: double.infinity,
//               height: 56,
//               child: CustomButton(
//                 title: 'Submit Button',
//                 backgroundColor: ColorsManager.primarycolor,
//                 onPressed: () {
//                   Navigator.pushNamed(context, '/success');
//                 },
//               ),
//             ),

//             const SizedBox(height: 32),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:furniturestore/core/resources/colors_manger.dart';
import 'package:furniturestore/widgets/custom_button.dart';
import 'package:furniturestore/widgets/info_card.dart';
import 'package:furniturestore/widgets/info_section.dart';
import 'package:furniturestore/widgets/price_row.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Check out', style: TextStyle(color: ColorsManager.primarycolor)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔸 Shipping address title with edit icon
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Shipping address',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: Colors.black),
                ),
                IconButton(
                  icon: const Icon(Icons.edit, color: ColorsManager.primarycolor),
                  onPressed: () {}, // TODO
                ),
              ],
            ),
            const SizedBox(height: 8),

            InfoCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Bruno Fernandes',
                    style: TextStyle(
                      color: ColorsManager.primarycolor,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Divider(color: Colors.grey, thickness: 0.5),
                  SizedBox(height: 8),
                  Text(
                    '25 rue Robert Latouche, Nice, 06200, Côte D’azur, France',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // 🔸 Payment title with edit icon
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Payment',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: Colors.grey),
                ),
                IconButton(
                  icon: const Icon(Icons.edit, color: ColorsManager.primarycolor),
                  onPressed: () {}, // TODO
                ),
              ],
            ),
            const SizedBox(height: 8),

            InfoCard(
              child: InfoSection(
                title: '',
                value: '•••• •••• •••• 3947',
                onEdit: null,
                titleColor: ColorsManager.primarycolor,
                 leading: Image.asset(
                  'assets/images/mastercard.png',
                  width: 48,
                  height: 24,
                ),
              ),
            ),

            const SizedBox(height: 16),

            // 🔸 Delivery Method title with edit icon
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Delivery method',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: Colors.grey),
                ),
                IconButton(
                  icon: const Icon(Icons.edit, color: ColorsManager.primarycolor),
                  onPressed: () {}, // TODO
                ),
              ],
            ),
            const SizedBox(height: 8),

            InfoCard(
              child: InfoSection(
                title: '',
                value: 'Fast (2-3days)',
                onEdit: null,
                leading: Image.asset(
                  'assets/images/dhl.png',
                  width: 48,
                  height: 24,
                ),
                titleColor: ColorsManager.primarycolor,
              ),
            ),

            const SizedBox(height: 24),

            // 💰 Summary Card
            InfoCard(
              child: Column(
                children: [
                  PriceRow(label: 'Order', amount: '\$95.00'),
                  PriceRow(label: 'Delivery', amount: '\$5.00'),
                  const Divider(height: 20, thickness: 1),
                  PriceRow(label: 'Total', amount: '\$100.00', isBold: true),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // ✅ Submit Button
            SizedBox(
              width: double.infinity,
              height: 56,
              child: CustomButton(
                title: 'Submit order',
                backgroundColor: ColorsManager.primarycolor,
                onPressed: () {
                  Navigator.pushNamed(context, '/success');
                },
              ),
            ),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}









  // 🔲 Card Wrapper
  // Widget _buildInfoCard({required Widget child}) {
  //   return Card(
  //     margin: const EdgeInsets.only(bottom: 16),
  //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  //     elevation: 2,
  //     child: Padding(
  //       padding: const EdgeInsets.all(16),
  //       child: child,
  //     ),
  //   );
  // }

  // 🧱 Info Section (Address, Payment, Delivery)
//   Widget _buildInfoSection({
//     required String title,
//     required String value,
//     VoidCallback? onEdit,
//     Widget? leading,
//   }) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         if (leading != null) ...[
//           leading,
//           const SizedBox(width: 12),
//         ],
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(title,
//                   style: const TextStyle(
//                       fontSize: 14, fontWeight: FontWeight.bold)),
//               const SizedBox(height: 4),
//               Text(value,
//                   style:
//                       const TextStyle(fontSize: 13, color: Colors.grey)),
//             ],
//           ),
//         ),
//         IconButton(
//           icon: const Icon(Icons.edit, color: Colors.orange),
//           onPressed: onEdit,
//         ),
//       ],
//     );
//   }

//   // 💰 Summary Row
//   Widget _buildPriceRow(String label, String amount, {bool isBold = false}) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(label,
//               style: TextStyle(
//                 fontSize: 14,
//                 fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
//               )),
//           Text(amount,
//               style: TextStyle(
//                 fontSize: 14,
//                 fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
//               )),
//         ],
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:furniturestore/core/resources/assets_manager.dart';
// import 'package:furniturestore/core/resources/colors_manger.dart';
// import 'package:furniturestore/widgets/info_card.dart';
// import 'package:furniturestore/widgets/info_section.dart';
// import 'package:furniturestore/widgets/price_row.dart';

// class CheckOut extends StatelessWidget {
//   const CheckOut({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: const Text('Check out', style: TextStyle(color: Colors.black)),
//         backgroundColor: Colors.white,
//         elevation: 0,
//         centerTitle: true,
//         iconTheme: const IconThemeData(color: Colors.black),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [
//             // 📦 Shipping Address Card
//             const InfoCard(
//               child: InfoSection(
//                 title: 'Shipping address',
//                 value: 'Bruno Fernandes\n25 rue Robert Latouche, Nice, 06200, Côte D’azur, France',
//                 onEdit: null, // أو حط onEdit: () {}
//               ),
//             ),

//             // 💳 Payment Card
//             const InfoCard(
//               child: InfoSection(
//                 title: 'Payment',
//                 value: '•••• •••• •••• 3947',
//                 onEdit: null,
//               ),
//             ),

//             // 🚚 Delivery Method Card
//             InfoCard(
//               child: InfoSection(
//                 title: 'Delivery method',
//                 value: 'DHL — Fast (2-3days)',
//                 onEdit: () {},
//                 leading: Image.asset(
//                   AssetsManager.logedhl,
//                   width: 48,
//                   height: 24,
//                 ),
//               ),
//             ),

//             const SizedBox(height: 24),

//             // 💰 Summary Card
//             const InfoCard(
//               child: Column(
//                 children: [
//                   PriceRow(label: 'Order', amount: '\$95.00'),
//                   PriceRow(label: 'Delivery', amount: '\$5.00'),
//                   Divider(height: 20, thickness: 1),
//                   PriceRow(label: 'Total', amount: '\$100.00', isBold: true),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 24),

//             // ✅ Submit Button
//             SizedBox(
//               width: double.infinity,
//               height: 56,
//               child: ElevatedButton(
//                 onPressed: () {
//                   Navigator.pushNamed(context, '/success');
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: ColorsManager.primarycolor,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                 ),
//                 child: const Text(
//                   'Submit order',
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ),

//             const SizedBox(height: 32),
//           ],
//         ),
//       ),
//     );
//   }
// }