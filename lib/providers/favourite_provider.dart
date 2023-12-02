import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_shop/model/meal.dart';

class FavouriteMeals extends StateNotifier<List<Meal>> {
  FavouriteMeals() : super([]);

  bool toggleMealFavouriteStatus(Meal meal) {
    final isMealFavourite = state.contains(meal);
    if (isMealFavourite) {
      state = state.where((element) {
        return element.id != meal.id;
      }).toList();
    } else {
      state = [...state, meal];
      return true;
    }
    return false;
  }
}

final favouriteMealProvider =
    StateNotifierProvider<FavouriteMeals, List<Meal>>((ref) {
  return FavouriteMeals();
});
