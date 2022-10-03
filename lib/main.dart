// import 'package:provider/provider.dart';
import './assets.dart';
import 'theme/theme.dart';
import 'screens/screens.dart';
import '../screens/nav_screen.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:page_transition/page_transition.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
// import 'theme/theme_state.dart';

// Future main() async {
void main() {
  // await dotenv.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Deluxa',
      debugShowCheckedModeBanner: false,
      theme: deluxaDark,
      home: AnimatedSplashScreen(
        nextScreen: const NavScreen(),
        splash: Assets.deluxalogo,
        duration: 200,
        curve: Curves.fastLinearToSlowEaseIn ,
        centered: true,
        splashTransition: SplashTransition.scaleTransition,
        animationDuration: const Duration(seconds: 2),
        pageTransitionType: PageTransitionType.rightToLeft,
        backgroundColor: const Color(0xff1f271b),
        splashIconSize: 150,
        // customTween: ,
      ),
    );
  }
}
