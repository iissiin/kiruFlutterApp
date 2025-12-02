import 'package:flutter/cupertino.dart';
import 'package:kiru/kiruAssets/colors.dart';

class IconWithBackground extends StatelessWidget {
  final String icon;
  const IconWithBackground({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: AppColors.black,
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        Positioned.fill(
          child: Center(child: Image.asset(icon, width: 24, height: 24)),
        ),
      ],
    );
  }
}
