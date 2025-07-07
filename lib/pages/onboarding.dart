import 'package:flutter/material.dart';
import 'package:furniturestore/core/resources/assets_manager.dart';
import 'package:furniturestore/core/resources/colors_manger.dart';
import 'package:furniturestore/core/resources/string_manger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniturestore/widgets/custom_button.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
    body:  Stack(
      children: [
        // Background image
        SizedBox.expand(
          child: Image.asset(
            AssetsManager.onboardingPage1ImagePath,
            fit: BoxFit.cover,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                Image.asset(AssetsManager.crown),
                SizedBox(height: 20),
                Text(
                  StringManager.onboarding,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 340.h),
                
                SizedBox(
                  width: 311.w,
                  height: 54.h,
                  
                  child: CustomButton(
  title: 'Get Started',
  backgroundColor: ColorsManager.primarycolor,
  onPressed: () {
     Navigator.pushNamed(context, '/login');
    // logic
  },
),
                  // child: ElevatedButton(
                  //   style: ElevatedButton.styleFrom(
                  //     backgroundColor: ColorsManager.primarycolor,
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadiusGeometry.circular(4),
                  //     ),
                  //   ),
                  //   onPressed: () {
                  //     Navigator.pushNamed(context, '/login');
                  //   },
                  //   child: const Text("Get Started"),
                  // ),
                ),
              ],
            ),
          ),
        ),
      ],)
    );
  }
}
