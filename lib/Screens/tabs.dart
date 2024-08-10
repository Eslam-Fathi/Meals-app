import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/Providers/fav_provider.dart';
import 'package:meals_app/Providers/filter_provider.dart';
import 'package:meals_app/Providers/page_selector.dart';



import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class TabsScreen extends ConsumerWidget {
  const TabsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final availableMeals = ref.watch(filteredMealsProvider);
    final selectedIndexFromProvider = ref.watch(pageSelectorProvider);

    Widget activePage = CategoriesScreen(
      availableMeals: availableMeals,
    );
    var activePageTitle = 'Categories';

    if (selectedIndexFromProvider == 1) {
      final favMeals = ref.watch(favMealsProvider);
      activePage = MealsScreen(
        meals: favMeals,
      );
      activePageTitle = 'Your Favorites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(
        onSelectScreen: (identifier) {
          ref
              .read(pageSelectorProvider.notifier)
              .navigateTo(identifier, context);
        },
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          ref.read(pageSelectorProvider.notifier).changePage(value);
        },
        currentIndex: selectedIndexFromProvider,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
