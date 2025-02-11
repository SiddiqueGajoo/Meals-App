import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice/models/meal.dart';

class FavoritesMealsNotifier extends StateNotifier<List<Meal>> {
  //State notifier class is used when your data is changed
  FavoritesMealsNotifier() : super([]);// initially state is empty list []

  bool toggleMealFavoriteStatus(Meal meal) {
    final mealIsFavorite = state.contains(meal);
    if (mealIsFavorite) {
      //everytime we have to assign new value in state
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      //... is a spread operator means ...state copy the the list old list and also add the new meal
      state = [...state, meal];
      return true;
    }
  }
}
//we get this favoritesMealsProvider variable using ref keyword, anywhere in the code
final favoritesMealsProvider =
    StateNotifierProvider<FavoritesMealsNotifier, List<Meal>>((ref) {
  return FavoritesMealsNotifier();
});
