import 'package:deli_meals/utils/app_styles.dart';
import 'package:deli_meals/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  final void Function(String identifier) onPressed;
  DrawerWidget({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Colors.blue,
              Colors.pink,
            ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood,
                  size: 48,
                ),
                SizedBox(width: 18),
                CustomText(
                  text: 'Cooking Up!',
                ),
              ],
            ),
          ),
          ListTile(
            onTap: () {
              onPressed('meals');
            },
            leading: Icon(
              Icons.restaurant,
              size: 26,
            ),
            title: CustomText(
              text: 'Meals',
              style: AppTextStyles.body2.copyWith(fontSize: 24),
            ),
          ),
          ListTile(
            onTap: () {
              onPressed('filters');
            },
            leading: Icon(
              Icons.settings,
              size: 26,
            ),
            title: CustomText(
              text: 'Filters',
              style: AppTextStyles.body2.copyWith(fontSize: 24),
            ),
          ),
        ],
      ),
    );
  }
}
