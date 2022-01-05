import './assets.dart';
import 'screens/screens.dart';
import '../screens/nav_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Netflix',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.black,
      ),
      home: AnimatedSplashScreen(
        nextScreen: const NavScreen(),
        splash: Assets.netflixIcon,
        duration: 200,
        curve: Curves.easeInCirc,
        centered: true,
        splashTransition: SplashTransition.decoratedBoxTransition,
        animationDuration: const Duration(seconds: 2),
        pageTransitionType: PageTransitionType.rightToLeft,
      ),
    );
  }
}
