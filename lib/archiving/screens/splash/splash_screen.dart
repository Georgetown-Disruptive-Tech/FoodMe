import 'package:flutter/material.dart';
import '../../screens/splash/components/body.dart';
import '../../../sizeconfig.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/splash";
  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    return Scaffold(
      body: Body(),
    );
  }
}
