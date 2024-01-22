import 'package:flutter/material.dart';

import '../../../utils/app_styles.dart';
import '../../../widgets/custom_text.dart';

class MealItemTrait extends StatelessWidget {
  IconData icon;
  String text;

  MealItemTrait({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 17, color: Colors.white),
        CustomText(
          text: text,
          style: AppTextStyles.body1.copyWith(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
