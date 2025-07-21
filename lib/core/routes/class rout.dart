import 'package:flutter/material.dart';
import 'package:furniturestore/pages/cartpage.dart';
import 'package:furniturestore/pages/cheekout.dart';
import 'package:furniturestore/pages/favorites.dart';
import 'package:furniturestore/pages/homepage.dart';

import 'package:furniturestore/pages/login.dart';
import 'package:furniturestore/pages/myorders.dart';
import 'package:furniturestore/pages/notificaton.dart';
import 'package:furniturestore/pages/onboarding.dart';
import 'package:furniturestore/pages/profilepage.dart';
import 'package:furniturestore/pages/writeareview.dart';

import 'package:furniturestore/pages/sinup.dart';
import 'package:furniturestore/pages/success.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    '/': (context) => const Onboarding(),
    '/login': (context) => const Login(),
    '/signup': (context) => const Signup(),
    '/homepage': (context) => const HomePage(),
    '/cart': (context) => const CartPage(),
    '/profile': (context) => const ProfilePage(), // ✅ تأكد من وجوده هنا
    '/favorites': (context) => const FavoritesPage(),
    '/notificaton':(context)=>const NotificatonPage(),
    '/checkout':(context)=>const CheckOut(),
    '/success':(context)=>const SuccessPage(),
    '/orders':(context)=>const MyOrders(),
// '/rating': (context) =>  ReviewPage(),
'/review':(context)=>const MyReview(),

  };
}
