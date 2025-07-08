import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniturestore/core/routes/class%20rout.dart';
import 'package:furniturestore/pages/onboarding.dart';

void main() {
  runApp(
    ScreenUtilInit(
      designSize: Size(375, 812), // أبعاد التصميم من Figma
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: AppRoutes.routes,

      // home:  Onboarding(),
    );
  }
}
