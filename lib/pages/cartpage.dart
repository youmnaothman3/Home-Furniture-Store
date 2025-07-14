import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furniturestore/core/resources/colors_manger.dart';
import 'package:furniturestore/model/product_model.dart';
import 'package:furniturestore/widgets/cart_item.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<ProductModel> cartItems = [
    ProductModel(name: "Minimal Stand", image: "assets/images/lamp.jpg", price: 25.0),
    ProductModel(name: "Minimal Stand", image: "assets/images/lamp.jpg", price: 25.0),
    ProductModel(name: "Minimal Stand", image: "assets/images/lamp.jpg", price: 25.0),
  ];

  Map<ProductModel, int> itemQuantities = {};

  @override
  void initState() {
    super.initState();
    // كمية ابتدائية = 1
    for (var item in cartItems) {
      itemQuantities[item] = 1;
    }
  }

  void increment(ProductModel item) {
    setState(() {
      itemQuantities[item] = (itemQuantities[item] ?? 1) + 1;
    });
  }

  void decrement(ProductModel item) {
    setState(() {
      if ((itemQuantities[item] ?? 1) > 1) {
        itemQuantities[item] = (itemQuantities[item] ?? 1) - 1;
      }
    });
  }

  void removeItem(ProductModel item) {
    setState(() {
      cartItems.remove(item);
      itemQuantities.remove(item);
    });
  }

  double get total {
    double sum = 0;
    for (var item in cartItems) {
      sum += item.price * (itemQuantities[item] ?? 1);
    }
    return sum;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartItems[index];
                  return CartItem(
                    product: item,
                    quantity: itemQuantities[item] ?? 1,
                    onIncrease: () => increment(item),
                    onDecrease: () => decrement(item),
                    onDelete: () => removeItem(item),
                  );
                },
              ),
            ),
            const SizedBox(height: 12),

            // Promo Code
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: const [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Enter your promo code",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios, size: 16),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // Total + Checkout
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total: \$${total.toStringAsFixed(2)}",
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: ColorsManager.primarycolor)),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorsManager.primarycolor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text("Check out"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
