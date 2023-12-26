import 'package:flutter/material.dart';

import 'package:meals/Pages/meals.dart';
import 'package:meals/services/data/dummy_data.dart';
import 'package:meals/services/models/category.dart';
import 'package:meals/services/models/meal.dart';
import 'package:meals/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.availableMeals});

  final List<Meal> availableMeals;

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title,
          meals: filteredMeals,
        ),
      ),
    ); // Navigator.push(context,route)
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // finalise the no. of columns in each row
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20, // spacing between the columns
          mainAxisSpacing: 20 // spacing between two row
          ),
      children: [
        // availableCategories.map((category) => CategoryGridItem(category : category)).toList()
        for (final category in availableCategories)
          CategoryGridItem(
              category: category,
              onSelectCategory: () => _selectCategory(context, category))
      ],
    );
  }
}
