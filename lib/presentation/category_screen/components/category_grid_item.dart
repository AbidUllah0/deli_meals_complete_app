import 'package:deli_meals/utils/app_styles.dart';
import 'package:flutter/material.dart';

import '../../../widgets/custom_text.dart';

class CategoryGridItem extends StatelessWidget {
  final String title;
  final Color color;

  const CategoryGridItem({super.key, required this.title, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          color.withOpacity(0.7),
          color,
        ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        borderRadius: BorderRadius.circular(15),
      ),
      child: CustomText(
        text: title,
        style: AppTextStyles.body2,
      ),
    );
  }
}
