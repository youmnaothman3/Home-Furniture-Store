import 'package:flutter/material.dart';

import 'package:furniturestore/pages/login.dart';
import 'package:furniturestore/pages/onboarding.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    '/': (context) => const Onboarding(),
    '/login': (context) => const Login(),
  };
}
