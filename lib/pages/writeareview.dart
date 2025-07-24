import 'package:flutter/material.dart';
import 'package:furniturestore/model/my_review_model.dart';
import 'package:furniturestore/widgets/my-rwview-item.dart';



class MyReview extends StatelessWidget {
  const MyReview({super.key});

  // ✅ بيانات وهمية
  List<MyReviewModel> get reviews => [
        MyReviewModel(
          productName: 'Modern Chair',
          productImage: 'assets/images/lamp.jpg',
          rating: 4.5,
          reviewText: 'Very comfortable and fits perfectly with my decor!',
          date: '21 July 2025',
        ),
        MyReviewModel(
          productName: 'Wooden Table',
          productImage: 'assets/images/lamp.jpg',
          rating: 5.0,
          reviewText: 'Sturdy and beautiful finish!',
          date: '18 July 2025',
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Reviews'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: reviews.length,
          itemBuilder: (context, index) {
            return MyReviewItem(review: reviews[index]);
          },
        ),
      ),
    );
  }
}