import 'package:flutter/material.dart';
import 'package:kiru/colors.dart';

class Loginscreen extends StatelessWidget {
  const Loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.only(
          top: 177,
          bottom: 255,
          right: 40,
          left: 40,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 13,
              children: [
                Image.asset('assets/kiruLogo.png'),
                Text(
                  'Kiru',
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}





// ImageAssets.appLogo