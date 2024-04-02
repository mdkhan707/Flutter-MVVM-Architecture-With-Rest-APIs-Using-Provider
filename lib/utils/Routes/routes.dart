import 'package:flutter/material.dart';
import 'package:mvvm_architecture/utils/Routes/routesname.dart';
import 'package:mvvm_architecture/view/home_screen.dart';
import 'package:mvvm_architecture/view/login_screen.dart';
import 'package:mvvm_architecture/view/sign_up.dart';
import 'package:mvvm_architecture/view/spash_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeScreen());
      case RoutesName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => const LogInScreen());
      case RoutesName.Signup:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SignUp());
      case RoutesName.Splash:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SpashScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                  body: Center(
                    child: Text("No Route defined"),
                  ),
                ));
    }
  }
}
