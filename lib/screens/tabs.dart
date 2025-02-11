import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice/providers/favorites_provider.dart';
import 'package:practice/providers/filter_providers.dart';
import 'package:practice/screens/categories.dart';
import 'package:practice/screens/filters.dart';
import 'package:practice/screens/meals.dart';
import 'package:practice/widgets/main_drawer.dart';

//Global Enum used for filters, add "k" means constant and global
const kInitialFilter = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};
// replace stateful widget as ConsumerStatefulWidget
class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  //initially we used categories screen in tab, 0 means categories screen, 1 means favorites screen
  int selectPageIndex = 0;

  //select page method is used we user want to change the screen in tab
  void selectPage(int index) {
    setState(() {
      selectPageIndex = index;
    });
  }

// gets the value from drawer, and select which page is user select, meals or filters
  void setScreen(String identifier) async {
    //use future async await as filters are selected, which are a future value
    Navigator.of(context).pop();
    if (identifier == 'Filters') {
      await Navigator.of(context).push<Map<Filter, bool>>(
          MaterialPageRoute(builder: (ctx) => const FiltersScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    //availableMeals gets the meals from filteredMealsProvider if any filter is select then filters meals is get, if not then all meals list will returns
    final availableMeals = ref.watch(filteredMealsProvider);
    // activepage variable is used as select the screen in bottom navigation initially it's categories screen selected
    Widget activePage = CategoriesScreen(
      //categories screen needs a meal list sco availableMeals  is provide
      availableMeals: availableMeals,
    );

    var activePageTitle = 'Categories';
    if (selectPageIndex == 1) {
      final favoritesMeals = ref.watch(favoritesMealsProvider);
      activePage = MealsScreen(meals: favoritesMeals);
      activePageTitle = 'Your Favorites';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(
        onSelectScreen: setScreen,
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
          onTap: selectPage,
          currentIndex: selectPageIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.set_meal), label: 'Categories'),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
          ]),
    );
  }
}
