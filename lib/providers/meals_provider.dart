import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_shop/data/dummy.dart';

final mealsProvider = Provider((ref) {
  return dummyMeals;
});
