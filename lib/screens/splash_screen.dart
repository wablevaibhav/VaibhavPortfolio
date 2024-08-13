import 'package:flutter/material.dart';
import 'package:vaibhav_wable/screens/website.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const Website(),
          ));
    });
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Lottie.asset(
          "assets/jsons/Android_logo.json",
          height: 500,
        ),
      ),
    );
  }
}
