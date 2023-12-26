import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals/services/riverpod/meals_provider.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FilterNotifier extends StateNotifier<Map<Filter, bool>> {
  FilterNotifier()
      : super({
          Filter.glutenFree: false,
          Filter.lactoseFree: false,
          Filter.vegetarian: false,
          Filter.vegan: false,
        });

  // use to set all filters when leave the filter screen
  void setFilters(Map<Filter, bool> chosenFilters) {
    state = chosenFilters;
  }

  // use to set filter when go to filter screen and change any one filter
  void setFilter(Filter filter, bool isActive) {
    // state[filter] = isActive; // not allowed! => mutating state
    state = {
      ...state, // get the previous state of all filters
      filter: isActive, // override the previous state for selected filter
    };
  }
}

final filtersProvider =
    StateNotifierProvider<FilterNotifier, Map<Filter, bool>>(
        (ref) => FilterNotifier());

final filteredMealsProvider = Provider((ref) {
  final meals = ref.watch(mealsProvider);
  final activeFilters = ref.watch(filtersProvider);

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
