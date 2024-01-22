import 'package:deli_meals/models/category_model.dart';
import 'package:deli_meals/models/meals_model.dart';
import 'package:deli_meals/utils/app_styles.dart';
import 'package:deli_meals/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class MealsDetailScreen extends StatelessWidget {
  String title;
  String image;
  VoidCallback onToggleFavorite;

  MealsDetailScreen({
    super.key,
    required this.title,
    required this.image,
    required this.onToggleFavorite,
  });

  @override
  Widget build(BuildContext context) {
    final mealsData = MealsModel.getMealsList();
    final categoryData = CategoryData.getCategory();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title.trim(),
        ),
        actions: [
          IconButton(
            onPressed: onToggleFavorite,
            icon: Icon(Icons.star),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              image,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 14),
            CustomText(
              text: "Ingredient",
              textAlign: TextAlign.center,
              style: AppTextStyles.body2.copyWith(
                color: Colors.deepOrangeAccent,
                fontSize: 24,
              ),
            ),
            ListView.builder(
              itemCount: mealsData[0].ingredients.length,
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              itemBuilder: (context, index) {
                return CustomText(
                  text: mealsData[index].ingredients[index].toString(),
                  style: AppTextStyles.body1,
                  textAlign: TextAlign.center,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
