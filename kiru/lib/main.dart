import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kiru/favorite/favoriteScreen.dart';
import 'package:kiru/navBar.dart';
import 'package:kiru/profile/profileScreen.dart';
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
        '/homepage': (context) => const Navbar(),
      },
    );
  }
}
