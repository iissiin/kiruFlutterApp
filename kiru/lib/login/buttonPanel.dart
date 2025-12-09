import 'package:flutter/material.dart';
import 'package:kiru/kiruAssets/colors.dart';

class ButtonsPanel extends StatelessWidget {
  const ButtonsPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      children: [
        SizedBox(
          width: double.infinity,
          height: 58,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/homepage');
            },
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(AppColors.black),
            ),
            child: Text(
              'Регистрация',
              style: TextStyle(
                color: AppColors.buttonPrimaryText,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/homepage');
          },
          child: Text(
            'Войти',
            style: TextStyle(
              color: AppColors.buttonSecondaryText,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
