import 'package:flutter/material.dart';
import 'package:meal_shop/data/dummy.dart';
import 'package:meal_shop/model/category.dart';
import 'package:meal_shop/model/meal.dart';
import 'package:meal_shop/screens/meals.dart';
import 'package:meal_shop/widgets/category_grid.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({required this.availableMeals, super.key});

  final List<Meal> availableMeals;
  void _selectCategory(context, Category category) {
    final filteredMeals = availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MealsScreen(
          title: category.title,
          meal: filteredMeals,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
      ),
      children: [
        for (final category in availableCategories)
          CategoryGrid(
            category: category,
            onSelectedCategory: () => _selectCategory(context, category),
          ),
      ],
    );
  }
}
