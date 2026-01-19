import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kiru/login/registerScreen.dart';
import 'package:kiru/navBar.dart';
import 'package:kiru/login/loginScreen.dart';

void main() {
  runApp(KiruApp());
}

class KiruApp extends StatelessWidget {
  const KiruApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
      routes: {
        '/loginpage': (context) => const LoginScreen(),
        '/registerpage': (context) => const registerScreen(),
        '/homepage': (context) => const Navbar(),
      },
    );
  }
}
