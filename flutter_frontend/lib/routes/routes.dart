import 'package:flutter/material.dart';

// Screens
import 'package:flutter_frontend/screens/login/login_screen.dart';
import 'package:flutter_frontend/screens/signup/signup_screen.dart';
import 'package:flutter_frontend/screens/home/home_screen.dart';

// Route Names
import 'package:flutter_frontend/routes/route_names.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case RouteNames.signup:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case RouteNames.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        throw ('This route name does not exit');
    }
  }
}
