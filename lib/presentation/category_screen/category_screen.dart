import 'package:deli_meals/models/meals_model.dart';
import 'package:deli_meals/presentation/bottom_bar/drawer_widget.dart';
import 'package:deli_meals/widgets/custom_text.dart';
import 'package:flutter/material.dart';

import '../../models/category_model.dart';
import '../meals_screen/meals_screen.dart';
import 'components/category_grid_item.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen(
      {super.key,
      required this.onToggleFavorite,
      required this.avaiblableMeals});
  VoidCallback onToggleFavorite;
  List<MealsModel> avaiblableMeals;
  @override
  Widget build(BuildContext context) {
    final mealsData = MealsModel.getMealsList();
    final category = CategoryData.getCategory();
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: 'Category',
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
      ),

      ///this is already called in another class
      // drawer: DrawerWidget(),
      body: GridView.builder(
        padding: const EdgeInsets.all(25),
        itemCount: category.length,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          maxCrossAxisExtent: 200,
          mainAxisSpacing: 20,
        ),
        itemBuilder: (BuildContext context, int index) {
          final filteredData = mealsData
              .where((meals) => meals.categories.contains(category[index].id))
              .toList();
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MealsScreen(
                    categoryTitle: category[index].title,
                    meals: filteredData,
                    onToggleFavorite: onToggleFavorite,
                  ),
                ),
              );
            },
            splashColor: Colors.red,
            borderRadius: BorderRadius.circular(15),
            child: CategoryGridItem(
              title: category[index].title,
              color: category[index].color,
            ),
          );
        },
      ),
    );
  }
}
