// // import 'package:flutter/material.dart';

// // class ReviewItem extends StatelessWidget {
// //   final String username;
// //   final double rating;
// //   final String comment;
// //   final String date;
// //   final String avatarUrl; // 🟠 جديد

// //   const ReviewItem({
// //     super.key,
// //     required this.username,
// //     required this.rating,
// //     required this.comment,
// //     required this.date,
// //     required this.avatarUrl, // 🟠 جديد
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       margin: const EdgeInsets.symmetric(vertical: 12),
// //       child: Row(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           // 🟣 Avatar
// //           CircleAvatar(
// //             radius: 24,
// //             backgroundImage: AssetImage(avatarUrl),
// //           ),
// //           const SizedBox(width: 12),

// //           // 🟣 Text content
// //           Expanded(
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 // 🔹 Username + Rating
// //                 Row(
// //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                   children: [
// //                     Text(
// //                       username,
// //                       style: const TextStyle(
// //                           fontWeight: FontWeight.bold, fontSize: 16),
// //                     ),
// //                     Row(
// //                       children: [
// //                         const Icon(Icons.star, color: Colors.orange, size: 16),
// //                         const SizedBox(width: 4),
// //                         Text(
// //                           rating.toString(),
// //                           style: const TextStyle(fontWeight: FontWeight.w500),
// //                         ),
// //                       ],
// //                     ),
// //                   ],
// //                 ),
// //                 const SizedBox(height: 6),
// //                 Text(comment),
// //                 const SizedBox(height: 6),
// //                 Text(date, style: const TextStyle(fontSize: 12, color: Colors.grey)),
// //               ],
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';

// class ReviewItem extends StatelessWidget {
//   final String username;
//   final String avatarUrl;
//   final double rating;
//   final String comment;
//   final String date;

//   const ReviewItem({
//     super.key,
//     required this.username,
//     required this.avatarUrl,
//     required this.rating,
//     required this.comment,
//     required this.date,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 10),
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.grey.shade100,
//         borderRadius: BorderRadius.circular(16),
//       ),
//       child: Column(
//         children: [
//           CircleAvatar(
//             radius: 28,
//             backgroundImage: AssetImage(avatarUrl),
//           ),
//           const SizedBox(height: 12),
//           Text(
//             username,
//             style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//           ),
//           const SizedBox(height: 4),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Icon(Icons.star, color: Colors.orange, size: 16),
//               const SizedBox(width: 4),
//               Text(rating.toString(),
//                   style: const TextStyle(fontWeight: FontWeight.w500)),
//             ],
//           ),
//           const SizedBox(height: 8),
//           Text(
//             comment,
//             textAlign: TextAlign.center,
//             style: const TextStyle(color: Colors.black87),
//           ),
//           const SizedBox(height: 6),
//           Text(
//             date,
//             style: const TextStyle(color: Colors.grey, fontSize: 12),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:furniturestore/model/eview_model.dart';


class ReviewItem extends StatelessWidget {
  final ReviewModel review;

  const ReviewItem({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundImage: AssetImage(review.avatarUrl),
          ),
          const SizedBox(height: 12),
          Text(
            review.username,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.star, color: Colors.orange, size: 16),
              const SizedBox(width: 4),
              Text(
                review.rating.toString(),
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            review.comment,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.black87),
          ),
          const SizedBox(height: 6),
          Text(
            review.date,
            style: const TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
