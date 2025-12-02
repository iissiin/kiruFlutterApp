import 'package:flutter/cupertino.dart';
import 'package:kiru/home/homeScreen.dart';
// import 'package:kiru/login/loginScreen.dart';

void main() {
  runApp(KiruApp());
}

class KiruApp extends StatelessWidget {
  const KiruApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(home: HomeScreen());
  }
}
