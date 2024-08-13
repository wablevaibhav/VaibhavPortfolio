import 'package:flutter/material.dart';
import 'package:vaibhav_wable/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vaibhav Wable | Portfolio',
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
