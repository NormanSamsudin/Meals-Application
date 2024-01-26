import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

//Provider() : static/ basic provider
//StateNotifierProvider() : dynamic/data can change

//tapi statenotifier ni xboleh pakai directly kne ada class lain yang extend die
class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  //generic type List<Meal>
  FavoriteMealsNotifier()
      : super([]); //pass empty list dekat upper class (statenotifier)

  // dalam statenotifier tak boleh add new value dalam list
  // hanya dibenarkan untuk create new list supaya old list jadi garbage
  bool toggleMealFavoriteStatus(Meal meal) {
    final mealIsFavorite = state.contains(meal);
    print(mealIsFavorite);
    // kalau die dah jadi favorite so nak remove balik
    if (mealIsFavorite) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      // kalau belum jadi favorite so nak tambah dalam list
      state = [
        ...state,
        meal
      ]; //... tu spread operator untuk buat shallow copy of existing list(state)
      return true;
    }
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
  // kne return new class yg dah create
  return FavoriteMealsNotifier();
});
