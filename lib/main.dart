// ignore_for_file: camel_case_types

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shark/animations/animations.dart';
import 'package:shark/firebase_options.dart';
import 'package:shark/screens/chat_page.dart';
import 'package:shark/screens/login_page.dart';
import 'package:shark/screens/register_page.dart';
// Import the generated file

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const shark());
}

class shark extends StatelessWidget {
  const shark({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'LoginPage': (context) => LoginPage(),
        'animation': (context) => const animation(),
        'RegisterPage': (context) => RegisterPage(),
        ChatPage.id: (context) => const ChatPage(),
      },
      initialRoute: 'animation',
      debugShowCheckedModeBanner: false,
    );
  }
}
