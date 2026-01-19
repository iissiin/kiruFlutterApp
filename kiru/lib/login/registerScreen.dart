import 'package:flutter/material.dart';

enum gender { male, female }

class registerScreen extends StatelessWidget {
  const registerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            TextField(
              maxLength: 10,
              decoration: InputDecoration(
                labelText: "Email",
                hintText: "Enter your email here",
              ),
            ),
            TextField(
              maxLength: 10,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
                hintText: "Enter your password here",
              ),
            ),
            TextField(
              maxLength: 10,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
                hintText: "Enter your password here again",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
