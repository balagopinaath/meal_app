import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:meal_shop/model/meal.dart';
import 'package:meal_shop/screens/meal_details.dart';
import 'package:meal_shop/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({this.title, required this.meal, super.key});
  final String? title;
  final List<Meal> meal;
  void _selectMeal(context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MealDetailScreen(
          meal: meal,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Uh oh ..., Nothing Here',
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          const Gap(
            16,
          ),
          Text(
            'Try selecting a different category',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          )
        ],
      ),
    );

    if (meal.isNotEmpty) {
      content = ListView.builder(
        itemCount: meal.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return MealItem(
            meal: meal[index],
            onSelectMeal: (context, meal) {
              _selectMeal(context, meal);
            },
          );
        },
      );
    }

    if (title == null) {
      return content;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
    );
  }
}
