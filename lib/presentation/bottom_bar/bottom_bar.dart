import 'package:deli_meals/models/meals_model.dart';
import 'package:deli_meals/presentation/bottom_bar/drawer_widget.dart';
import 'package:deli_meals/presentation/category_screen/category_screen.dart';
import 'package:deli_meals/presentation/filters_screen/filters_screen.dart';
import 'package:deli_meals/presentation/meals_screen/meals_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;
  String selectedTitle = 'Category';
  List<MealsModel> _favoriteMeals = [];

  void _toggleMealFavoriteStatus(MealsModel mealsModel) {
    final isExisting = _favoriteMeals.contains(mealsModel);
    if (isExisting) {
      setState(() {
        _favoriteMeals.remove(mealsModel);
      });
    } else {
      setState(() {
        _favoriteMeals.remove(mealsModel);
      });
    }
  }

  // final List _screens = [
  //   CategoryScreen(
  //     onToggleFavorite: () {
  //       // _toggleMealFavoriteStatus;
  //     },
  //     avaiblableMeals: [],
  //   ),
  //   MealsScreen(
  //     categoryTitle: 'Favorites',
  //
  //     /// it cannot take list , and i dont know the reason
  //     // meals: _favoriteMeals,
  //     meals: [],
  //     onToggleFavorite: () {},
  //     // _toggleMealFavoriteStatus;
  //   ),
  // ];

  void _setScreen(String identifier) async {
    Navigator.pop(context);

    if (identifier == 'filters') {
      final result = await Navigator.push<Map<Filters, bool>>(
          context, MaterialPageRoute(builder: (context) => FiltersScreen()));
      setState(() {
        _selectedFilter = result ?? _selectedFilter;
      });
    }
  }

  Map<Filters, bool> _selectedFilter = {
    Filters.glutenFree: false,
    Filters.lantoseFree: false,
    Filters.vegetarian: false,
    Filters.vegan: false,
  };

  @override
  Widget build(BuildContext context) {
    final avaibalbeMeals = MealsModel.getMealsList().where((meals) {
      if (_selectedFilter[Filters.glutenFree]! && !meals.isGlutenFree) {
        return false;
      }
      if (_selectedFilter[Filters.lantoseFree]! && !meals.isLactoseFree) {
        return false;
      }
      if (_selectedFilter[Filters.vegetarian]! && !meals.isVegetarian) {
        return false;
      }
      if (_selectedFilter[Filters.vegan]! && !meals.isVegan) {
        return false;
      }
      return true;
    }).toList();

    final List _screens = [
      CategoryScreen(
        onToggleFavorite: () {
          // _toggleMealFavoriteStatus;
        },
        avaiblableMeals: avaibalbeMeals,
      ),
      MealsScreen(
        categoryTitle: 'Favorites',

        /// it cannot take list , and i dont know the reason
        // meals: _favoriteMeals,
        meals: [],
        onToggleFavorite: () {},
        // _toggleMealFavoriteStatus;
      ),
    ];
    return Scaffold(
      body: _screens[_selectedIndex],
      drawerEnableOpenDragGesture: true,
      drawer: DrawerWidget(
        onPressed: _setScreen,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          _selectedIndex = index;
          setState(() {});
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
