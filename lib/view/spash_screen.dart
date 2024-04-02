import 'package:flutter/material.dart';
import 'package:mvvm_architecture/utils/Routes/routesname.dart';
import 'package:mvvm_architecture/view/sevices/splash_service.dart';

class SpashScreen extends StatefulWidget {
  const SpashScreen({super.key});

  @override
  State<SpashScreen> createState() => _SpashScreenState();
}

class _SpashScreenState extends State<SpashScreen> {
  SplashServices splashservices = SplashServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashservices.CheckAuthentication(context);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Text('Splash Screen',
          style: TextStyle(fontSize: 30, color: Colors.grey)),
    ));
  }
}
