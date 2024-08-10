
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/screens/filters.dart';




final pageSelectorProvider = StateNotifierProvider<PageSelectorNotifier,int>((ref){
  return PageSelectorNotifier();
});

class PageSelectorNotifier extends StateNotifier<int> {
  PageSelectorNotifier() : super(0);
  

  void changePage(int index) {
    state = index;
  }

  Future<void> navigateTo(String identifier, BuildContext context) async {
    Navigator.of(context).pop(); // Close drawer

    if (identifier == 'filters') {
      await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => const FiltersScreen(),
        ),
      );
    }
  }
}

 


