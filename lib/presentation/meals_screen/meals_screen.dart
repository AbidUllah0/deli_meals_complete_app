import 'package:deli_meals/utils/app_styles.dart';
import 'package:deli_meals/widgets/custom_text.dart';
import 'package:flutter/material.dart';

import '../../models/meals_model.dart';
import 'components/meals_item.dart';

class MealsScreen extends StatelessWidget {
  String categoryTitle;
  List<MealsModel> meals;
  VoidCallback onToggleFavorite;

  MealsScreen({
    super.key,
    required this.categoryTitle,
    required this.meals,
    required this.onToggleFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: meals.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '*****************************',
                    style: AppTextStyles.body2,
                  ),
                  CustomText(
                    text: 'Uh oh ...... Nothing Here',
                    style: AppTextStyles.body2,
                  ),
                  SizedBox(height: 20),
                  CustomText(
                    text: 'Try selecting a different catgory',
                    style: AppTextStyles.body2,
                  ),
                  SizedBox(height: 20),
                  Text(
                    '*****************************',
                    style: AppTextStyles.body2,
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: meals.length,
              itemBuilder: (context, index) {
                final complexityText =
                    meals[index].complexity.name[0].toUpperCase() +
                        meals[index].complexity.name.substring(1);
                final affordabilityText =
                    meals[index].affordability.name[0].toUpperCase() +
                        meals[index].affordability.name.substring(1);

                return MealsItem(
                  image: meals[index].imageUrl,
                  title: meals[index].title,
                  duration: meals[index].duration.toString(),
                  complexityText: complexityText,
                  affordabilityText: affordabilityText,
                  onToggleFavorite: onToggleFavorite,
                );
                //
              },
            ),
    );
  }
}
