import 'package:deli_meals/models/meals_model.dart';
import 'package:deli_meals/presentation/category_screen/components/meal_item_trait.dart';
import 'package:deli_meals/presentation/meals_detail_screen/components/meals_detail_screen.dart';
import 'package:deli_meals/utils/app_styles.dart';
import 'package:deli_meals/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class MealsItem extends StatelessWidget {
  String image;
  String title;
  String duration;
  String affordabilityText;
  String complexityText;
  VoidCallback onToggleFavorite;

  MealsItem({
    required this.image,
    required this.title,
    required this.duration,
    required this.complexityText,
    required this.affordabilityText,
    required this.onToggleFavorite,
  });

  @override
  Widget build(BuildContext context) {
    // final meals = Meals.mealsList();
    return Card(
      margin: EdgeInsets.all(8),

      ///without this image cannot take rounded border
      clipBehavior: Clip.hardEdge,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MealsDetailScreen(
                title: title,
                image: image,
                onToggleFavorite: onToggleFavorite,
              ),
            ),
          );
        },
        child: Stack(
          children: [
            ///fadeinImage is built in and  kTransparentimage is from transparent_image package
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(image),
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height * 0.26,
              width: double.infinity,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black54,
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                child: Column(
                  children: [
                    CustomText(
                      text: title,
                      style: AppTextStyles.body1.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MealItemTrait(
                          icon: Icons.schedule,
                          text: '${duration} min',
                        ),
                        SizedBox(width: 10),
                        MealItemTrait(
                          icon: Icons.work,
                          // text: complexityText,
                          text: complexityText,
                        ),
                        SizedBox(width: 10),
                        MealItemTrait(
                          icon: Icons.attach_money,
                          // text: affordabilityText,
                          text: affordabilityText,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
