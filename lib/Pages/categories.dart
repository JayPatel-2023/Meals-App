import 'package:flutter/material.dart';

import 'package:meals/services/data/dummy_data.dart';
import 'package:meals/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick your category'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,      // finalise the no. of columns in each row
          childAspectRatio: 3/2,
          crossAxisSpacing: 20,   // spacing between the columns
          mainAxisSpacing: 20     // spacing between two row 
        ),
       children: [
          // availableCategories.map((category) => CategoryGridItem(category : category)).toList()
          for (final category in availableCategories)
            CategoryGridItem(category: category)
       ],
      ),
    );
  }
}