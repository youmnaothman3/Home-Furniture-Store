import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniturestore/core/resources/assets_manager.dart';
import 'package:furniturestore/core/resources/colors_manger.dart';
import 'package:furniturestore/core/resources/string_manger.dart';
import 'package:furniturestore/model/product_model.dart';
import 'package:furniturestore/pages/favorites.dart';

import 'package:furniturestore/pages/review.dart.dart';
import 'package:furniturestore/widgets/custom_button.dart';

class ProductDetailsPage extends StatefulWidget {
  final ProductModel product; //!هيك كل التفاصيل بترتبط بهالمنتج فقط.

  const ProductDetailsPage({super.key, required this.product});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int quantity = 1;
  int selectedColorIndex = 0;

  final List<Color> colors = [Colors.brown, Colors.black, Colors.grey];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // ✅ صورة المنتج (طولية) + زر رجعة + ألوان
          Stack(
            children: [
              Row(
                children: [
                  // ✅ Container أبيض فيه الألوان
                  Container(
                    width: 60,
                    height: 300,
                    margin: const EdgeInsets.only(left: 8, top: 40),
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        colors.length,
                        (index) => GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedColorIndex = index;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 6),
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: selectedColorIndex == index
                                  ? Border.all(
                                      color: ColorsManager.primarycolor,
                                      width: 2,
                                    )
                                  : null,
                            ),
                            child: CircleAvatar(
                              radius: 10,
                              backgroundColor: colors[index],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),

                  // ✅ صورة المنتج
                  ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: Image.asset(
                      widget.product.image,
                      height: 300,
                      width: MediaQuery.of(context).size.width - 90,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),

              // ✅ زر الرجعة بالخارج
              Positioned(
                top: 40,
                left: 10,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () => Navigator.pop(context),
                ),
              ), // ✅ مستطيلات صغيرة (تحت الصورة - مكان الرجل)
              Positioned(
                bottom: 10,
                right: 30,
                child: Row(
                  children: List.generate(
                    3,
                    (index) => Container(
                      width: 14,
                      height: 4,
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      decoration: BoxDecoration(
                        color: index == selectedColorIndex
                            ? ColorsManager.primarycolor
                            : Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          // ✅ باقي التفاصيل
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // اسم المنتج
                  Text(
                    widget.product.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  // ✅ السعر و زر تعديل الكمية
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${widget.product.price.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: ColorsManager.primarycolor,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (quantity > 1) quantity--;
                                });
                              },
                              child: const Icon(Icons.remove, size: 18),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              '$quantity',
                              style: const TextStyle(fontSize: 16),
                            ),
                            const SizedBox(width: 8),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  quantity++;
                                });
                              },
                              child: const Icon(Icons.add, size: 18),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // ✅ نجمة + تقييم
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          print('product name: ${widget.product.name}');

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                 builder: (context) => ReviewPage(product: widget.product)
                              //!لما نكبس عالنجمةرحنا لصفحة ReviewPageوأرسلنا معها معلومات المنتج يلي كنا فاتحين عليه
                            ),
                          ); // تأكد من تعريف هذا الراوت
                        },
                        child: const Icon(
                          Icons.star,
                          color: Colors.orange,
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        '4.5 (50 reviews)',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  const Text(
                    'Minimal Stand is made of by natural wood. The design that is very simple and minimal. This is truly one of the best furnitures in any family for now.',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),

                  const Spacer(), // ✅ زر + أيقونة marker (SVG)
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const FavoritesPage(),
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: ColorsManager.primarycolor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: SvgPicture.asset(
                            IconAssets.marker,
                            width: 24,
                            height: 24,
                            color: ColorsManager.conte,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: CustomButton(
                          title: StringManager.Addtocart,
                          backgroundColor: ColorsManager.primarycolor,
                          onPressed: () {
                            Navigator.pushNamed(context, '/cart');
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
