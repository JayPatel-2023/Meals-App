import 'package:flutter/material.dart';
import 'package:meals/services/models/meal.dart';

class MealDetailsScareen extends StatelessWidget {
  const MealDetailsScareen({super.key,required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          meal.title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Image.network(
              meal.imageUrl,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
    );
  }
}
