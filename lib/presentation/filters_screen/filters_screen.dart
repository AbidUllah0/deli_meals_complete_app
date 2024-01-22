import 'package:deli_meals/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

enum Filters {
  glutenFree,
  lantoseFree,
  vegetarian,
  vegan,
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFreeFilters = false;
  var _lactoseFreeFilters = false;
  var _vegeterianFreeFilters = false;
  var _veganFreeFilters = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: 'Your Filters',
        ),
      ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.pop(context, {
            Filters.glutenFree: _glutenFreeFilters,
            Filters.lantoseFree: _lactoseFreeFilters,
            Filters.vegetarian: _vegeterianFreeFilters,
            Filters.vegan: _veganFreeFilters,
          });
          return false;
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _glutenFreeFilters,
              onChanged: (index) {
                setState(() {
                  _glutenFreeFilters = index;
                });
              },
              title: CustomText(
                text: 'Gluten-Free',
              ),
              subtitle: CustomText(
                text: 'only include Gluten-Free meals',
              ),
              contentPadding: EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _lactoseFreeFilters,
              onChanged: (index) {
                setState(() {
                  _lactoseFreeFilters = index;
                });
              },
              title: CustomText(
                text: 'Lactose-Free',
              ),
              subtitle: CustomText(
                text: 'only include Lactose-Free meals',
              ),
              contentPadding: EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _vegeterianFreeFilters,
              onChanged: (index) {
                setState(() {
                  _vegeterianFreeFilters = index;
                });
              },
              title: CustomText(
                text: 'Vegetarian-Free',
              ),
              subtitle: CustomText(
                text: 'only include vegetarian-Free meals',
              ),
              contentPadding: EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _veganFreeFilters,
              onChanged: (index) {
                setState(() {
                  _veganFreeFilters = index;
                });
              },
              title: CustomText(
                text: 'Vegan-Free',
              ),
              subtitle: CustomText(
                text: 'only include Vegan-Free meals',
              ),
              contentPadding: EdgeInsets.only(left: 34, right: 22),
            )
          ],
        ),
      ),
    );
  }
}
