import 'package:flutter/material.dart';
import 'package:meal_shop/data/dummy.dart';
import 'package:meal_shop/model/category.dart';
import 'package:meal_shop/model/meal.dart';
import 'package:meal_shop/screens/meals.dart';
import 'package:meal_shop/widgets/category_grid.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({required this.availableMeals, super.key});
  final List<Meal> availableMeals;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  void _selectCategory(context, Category category) {
    final filteredMeals = widget.availableMeals
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

  // Explicit Animation
  AnimationController? _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      lowerBound: 0,
      upperBound: 1,
    );
    _animationController!.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController!,
      child: GridView(
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
      ),
      builder: (BuildContext context, Widget? child) {
        return SlideTransition(
          position: Tween(
            begin: const Offset(0, 0.4),
            end: const Offset(0, 0),
          ).animate(CurvedAnimation(
            parent: _animationController!,
            curve: Curves.easeInOut,
          )),
          child: child,
        );
      },
    );
  }
}
