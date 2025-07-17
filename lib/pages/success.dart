// import 'package:flutter/material.dart';

// class SuccessPage extends StatelessWidget {
//   const SuccessPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       appBar: AppBar(),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:furniturestore/core/resources/colors_manger.dart';
import 'package:furniturestore/widgets/custom_button.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [const Text(
              'SUCCESS!',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            // ✅ Success Icon
            Image.asset('assets/images/success.png'),
            const Icon(Icons.check_circle, color: Colors.green, size: 60),

            const SizedBox(height: 24),

            // 🎉 Title
            // const Text(
            //   'SUCCESS!',
            //   style: TextStyle(
            //     fontSize: 24,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),

            const SizedBox(height: 20),

            // 📦 Subtitle
            const Text(
              'Your order will be delivered soon.\nThank you for choosing our app!',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 40),

            // 🔙 Back to Home Button
           Column(children: [
              CustomButton(
                title: 'Track your orders',
                backgroundColor: ColorsManager.primarycolor,
                onPressed: () {
                  Navigator.pushNamed(context, '/orders');
                },
              ),
              const SizedBox(
                height: 19,
              ),
              SizedBox(
                height: 50,
                child: CustomButton(
                  title: 'Back to Home',
                  backgroundColor: ColorsManager.primarycolor,
                  onPressed: () {
                    Navigator.pushNamed(context, '/homepage');
                  },
                ),
              )
            ])
                  // ElevatedButton(
                  //   onPressed: () {
                  //     Navigator.pushNamedAndRemoveUntil(
                  //       context,
                  //       '/homepage', // غير هذا إذا اسم صفحة الهوم مختلف
                  //       (route) => false,
                  //     );
                  //   },
                  //   style: ElevatedButton.styleFrom(
                  //     backgroundColor: ColorsManager.primarycolor,
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(12),
                  //     ),
                  //   ),
                  //   child: const Text(
                  //     'Back to Home',
                  //     style: TextStyle(
                  //       fontSize: 16,
                  //       fontWeight: FontWeight.bold,
                  //     ),
                  //   ),
                  // ),
                
              ,
            
          ],
        ),
      ),
    );
  }
}