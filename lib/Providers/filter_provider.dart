import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/Providers/meals_provider.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

final filterProvider =
    StateNotifierProvider<FilterProviderNotifier, Map<Filter, bool>>(
  (ref) => FilterProviderNotifier(),
);

class FilterProviderNotifier extends StateNotifier<Map<Filter, bool>> {
  FilterProviderNotifier()
      : super({
          Filter.glutenFree: false,
          Filter.lactoseFree: false,
          Filter.vegetarian: false,
          Filter.vegan: false,
        }); // default all filters are false

  void setFilters(Map<Filter, bool> filters) {
    state = filters;
  }

  void changeFilter(Filter filter, bool isActive) {
    state = {
      ...state,
      filter: isActive,
    };
  }
}

final filteredMealsProvider = Provider((ref) {
  final meals = ref.watch(mealsProvider);
  final activeFilters = ref.watch(filterProvider);
  return meals.where((meal) {
    if (activeFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
      return false;
    }
    if (activeFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
      return false;
    }
    if (activeFilters[Filter.vegetarian]! && !meal.isVegetarian) {
      return false;
    }
    if (activeFilters[Filter.vegan]! && !meal.isVegan) {
      return false;
    }
    return true;
  }).toList();
});
