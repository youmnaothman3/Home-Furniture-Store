import 'package:flutter/material.dart';
import 'package:furniturestore/pages/homepage.dart';

import 'package:furniturestore/pages/login.dart';
import 'package:furniturestore/pages/onboarding.dart';
import 'package:furniturestore/pages/sinup.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    '/': (context) => const Onboarding(),
    '/login': (context) => const Login(),
    '/signup': (context) => const Signup(),
    '/homepage':(context)=>const HomePage(),
  };
}
