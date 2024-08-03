// ignore_for_file: camel_case_types

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:shark/screens/login_page.dart';

class animation extends StatelessWidget {
  const animation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: const Image(
        image: AssetImage(
          'assets/1.jpg',
        ),
      ),
      nextScreen: LoginPage(),
      splashTransition: SplashTransition.scaleTransition,
      animationDuration: const Duration(microseconds: 1),
    );
  }
}
