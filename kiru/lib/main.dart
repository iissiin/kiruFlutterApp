import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kiru/loginScreen.dart';

void main() {
  runApp(KiruApp());
}

class KiruApp extends StatelessWidget {
  const KiruApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(home: Loginscreen());
  }
}
