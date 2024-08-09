import 'package:flutter_riverpod/flutter_riverpod.dart';

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
