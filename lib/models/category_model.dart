import 'package:flutter/material.dart';

class CategoryData {
  final String id;
  final String title;
  final Color color;

  CategoryData({
    required this.id,
    required this.title,
    this.color = Colors.orange,
  });

  static getCategory() {
    return [
      CategoryData(
        id: 'c1',
        title: 'Italian',
        color: Colors.purple,
      ),
      CategoryData(
        id: 'c2',
        title: 'Quick & Easy',
        color: Colors.red,
      ),
      CategoryData(
        id: 'c3',
        title: 'Hamburger',
        color: Colors.orange,
      ),
      CategoryData(
        id: 'c4',
        title: 'German',
        color: Colors.yellow,
      ),
      CategoryData(
        id: 'c5',
        title: 'Light and Lovely',
        color: Colors.blue,
      ),
      CategoryData(
        id: 'c6',
        title: 'Exotic',
        color: Colors.green,
      ),
      CategoryData(
        id: 'c7',
        title: 'Breakfast',
        color: Colors.lightGreenAccent,
      ),
      CategoryData(
        id: 'c8',
        title: 'Asian',
        color: Colors.blueAccent,
      ),
      CategoryData(
        id: 'c9',
        title: 'French',
        color: Colors.pinkAccent,
      ),
      CategoryData(
        id: 'c10',
        title: 'Summer',
        color: Colors.greenAccent,
      ),
    ];
  }
}
