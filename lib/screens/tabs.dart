// // import 'package:flutter/material.dart';
// // import 'package:meals/data/dummy_data.dart';
// // import 'package:meals/models/meal.dart';
// // import 'package:meals/screens/categories.dart';
// // import 'package:meals/screens/filters.dart';
// // import 'package:meals/screens/meals.dart';
// // import 'package:meals/widgets/main_drawer.dart';

// // const kInitialFilters = {
// //   Filter.glutenFree: false,
// //   Filter.lactoseFree: false,
// //   Filter.vegetarian: false,
// //   Filter.vegan: false,
// // };

// // // kne pakai stateful widget sbb die berubah2
// // class TabScreen extends StatefulWidget {
// //   const TabScreen({super.key});
// //   @override
// //   State<TabScreen> createState() {
// //     return _TabScreenState();
// //   }
// // }

// // class _TabScreenState extends State<TabScreen> {
// //   int _selectedPageIndex = 0;

// //   // mula2 declare favouritemeal ni kosong
// //   final List<Meal> _favoriteMeals = [];

// //   Map<Filter, bool> _selectedFilters = {
// //     Filter.glutenFree: false,
// //     Filter.lactoseFree: false,
// //     Filter.vegetarian: false,
// //     Filter.vegan: false,
// //   };

// //   // nak bagi feedbak kalau dah add or remove favourite
// //   void _showInfoMessage(String message) {
// //     ScaffoldMessenger.of(context).clearSnackBars();
// //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
// //       content: Text(message),
// //     ));
// //   }

// //   // ni button toggle yg mana kalau die tekan sekali die akan jadi favorite
// //   // tapi kalau tekan lagi sekali dia akan jadi unfavorite
// //   void _toggleMealFavouriteStatus(Meal meal) {
// //     // check kaau yg nak jd favorite tu ada ke tak
// //     final isExisting = _favoriteMeals.contains(meal);

// //     // kalau dah ada remove
// //     if (isExisting == true) {
// //       //kne setstate balik supaya nnti die update balik dlm favourite nnti
// //       setState(() {
// //         _favoriteMeals.remove(meal);
// //       });
// //       _showInfoMessage('Meal is no longer a favourite');
// //     }
// //     //kalau belum ada add
// //     else {
// //       setState(() {
// //         _favoriteMeals.add(meal);
// //       });
// //       _showInfoMessage('Marked as a favourite');
// //     }
// //   }

// //   void _setScreen(String identifier) async {
// //     if (identifier == 'filters') {
// //       Navigator.of(context).pop();
// //       // maksudnya dekat sini die akan tunggu pop dlu baru dapat value utk result tu.
// //       final result =
// //           await Navigator.of(context).push<Map<Filter, bool>>(MaterialPageRoute(
// //         builder: (context) => FiltersScreen(),
// //       ));

// //       //value die dah berjaya read dah
// //       print(result);

// //       // sekarang mcm mne nak apply filter
// //       setState(() {
// //         _selectedFilters = result ?? kInitialFilters;
// //       });
// //     } else {
// //       // utk show meals
// //       Navigator.of(context).pop();
// //     }
// //   }

// //   void _selectPage(int index) {
// //     setState(() {
// //       _selectedPageIndex = index;
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {

// //     final availableMeals = dummyMeals.where((meal) {
// //       if (_selectedFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
// //         return false;
// //       }
// //       if (_selectedFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
// //         return false;
// //       }
// //       if (_selectedFilters[Filter.vegetarian]! && !meal.isVegetarian) {
// //         return false;
// //       }
// //       if (_selectedFilters[Filter.vegan]! && !meal.isVegan) {
// //         return false;
// //       }
// //       return true;
// //     }).toList();

// //     //mula2 buat jer as categories sbb nak anggap die index 0
// //     Widget activePage = CategoriesScreen(
// //       onToggleFavorite: _toggleMealFavouriteStatus,
// //       availableMeals: availableMeals,
// //     );
// //     var activePageTitle = 'Categories';

// //     // kalau nak masuk dalam favourite
// //     if (_selectedPageIndex == 1) {
// //       activePage = MealsScreen(
// //         meals: _favoriteMeals,
// //         onToggleFavorite: _toggleMealFavouriteStatus,
// //       );
// //       activePageTitle = 'Your Favourite';
// //     }

// //     return Scaffold(
// //       //bahagian atas app
// //       appBar: AppBar(
// //         title: Text(activePageTitle), // akan berubah2 ikut tab yg kita tekan
// //       ),
// //       drawer: MainDrawer(onSelectScreen: _setScreen),

// //       //tak perlu tulis banyak2 dalam body passkan widget jer sng nak buat changes page nnti
// //       body: activePage,

// //       //bottom navigation bar
// //       bottomNavigationBar: BottomNavigationBar(
// //         onTap: _selectPage,
// //         currentIndex: _selectedPageIndex, //untuk setkan nak highlight yg mana.

// //         //nak bagi ada brape byk button
// //         items: const [
// //           //index 0
// //           BottomNavigationBarItem(
// //             icon: Icon(Icons.set_meal),
// //             label: 'Categories',
// //           ),
// //           //index 1
// //           BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favourites'),
// //         ],
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:meals/data/dummy_data.dart';

// import 'package:meals/models/meal.dart';
// import 'package:meals/screens/categories.dart';
// import 'package:meals/screens/filters.dart';
// import 'package:meals/screens/meals.dart';
// import 'package:meals/widgets/main_drawer.dart';

// const kInitialFilters = {
//   Filter.glutenFree: false,
//   Filter.lactoseFree: false,
//   Filter.vegetarian: false,
//   Filter.vegan: false,
// };

// class TabsScreen extends StatefulWidget {
//   const TabsScreen({super.key});

//   @override
//   State<TabsScreen> createState() {
//     return _TabsScreenState();
//   }
// }

// class _TabsScreenState extends State<TabsScreen> {
//   int _selectedPageIndex = 0;
//   final List<Meal> _favoriteMeals = [];
//   Map<Filter, bool> _selectedFilters = {
//     Filter.glutenFree: false,
//     Filter.lactoseFree: false,
//     Filter.vegetarian: false,
//     Filter.vegan: false
//   };

//   void _showInfoMessage(String message) {
//     ScaffoldMessenger.of(context).clearSnackBars();
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(message),
//       ),
//     );
//   }

//   void _toggleMealFavoriteStatus(Meal meal) {
//     final isExisting = _favoriteMeals.contains(meal);

//     if (isExisting) {
//       setState(() {
//         _favoriteMeals.remove(meal);
//       });
//       _showInfoMessage('Meal is no longer a favorite.');
//     } else {
//       setState(() {
//         _favoriteMeals.add(meal);
//         _showInfoMessage('Marked as a favorite!');
//       });
//     }
//   }

//   void _selectPage(int index) {
//     setState(() {
//       _selectedPageIndex = index;
//     });
//   }

//   void _setScreen(String identifier) async {
//     Navigator.of(context).pop();
//     if (identifier == 'filters') {
//       // final result = await Navigator.of(context).push(
//       //   MaterialPageRoute(
//       //     builder: (ctx) => const FiltersScreen(),
//       //   ),
//       // );

//       final result = await Navigator.of(context).push<Map<Filter, bool>>(
//         MaterialPageRoute(
//           builder: (ctx) => const FiltersScreen(),
//         ),
//       );

//       // log message debug
//       print(result);

//       _selectedFilters = result ?? kInitialFilters;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {

//     // filter availablemeals based on drawer filter
//     final availableMeals = dummyMeals.where((meal) {
//       if (_selectedFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
//         return false;
//       }
//       if (_selectedFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
//         return false;
//       }
//       if (_selectedFilters[Filter.vegetarian]! && !meal.isVegetarian) {
//         return false;
//       }
//       if (_selectedFilters[Filter.vegan]! && !meal.isVegan) {
//         return false;
//       }
//       return true;
//     }).toList();

//     Widget activePage = CategoriesScreen(
//       onToggleFavorite: _toggleMealFavoriteStatus,
//       availableMeals: availableMeals,
//     );
//     var activePageTitle = 'Categories';

//     if (_selectedPageIndex == 1) {
//       activePage = MealsScreen(
//         meals: _favoriteMeals,
//         onToggleFavorite: _toggleMealFavoriteStatus,
//       );
//       activePageTitle = 'Your Favorites';
//     }

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(activePageTitle),
//       ),

//       drawer: MainDrawer(
//         onSelectScreen: _setScreen,
//       ),
//       //tak perlu tulis banyak2 dalam body passkan widget jer sng nak buat changes page nnti
//       body: activePage,
//       //bottom navigationbar
//       bottomNavigationBar: BottomNavigationBar(
//         onTap: _selectPage,
//         currentIndex: _selectedPageIndex,
//         //nak bagi ada brape byk button @ item
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.set_meal),
//             label: 'Categories',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.star),
//             label: 'Favorites',
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals/screens/categories.dart';
import 'package:meals/screens/filters.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/main_drawer.dart';
import 'package:meals/providers/meals_provider.dart';
import 'package:meals/providers/favorites_provider.dart';
import 'package:meals/providers/filters_provider.dart';

const kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false
};

class TabsScreen extends ConsumerStatefulWidget {
  //kne tukar sebab nak pakai provider
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (ctx) => const FiltersScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    //setup listener to our provider
    //better pakai watch jer sbb kalau ada apa2 berubah die akan ubah sekali
    final meals = ref.watch(mealsProvider);
    final activeFilters = ref.watch(filtersProvider);
    final availableMeals = ref.watch(filteredMealsProvider);

    Widget activePage = CategoriesScreen(
      availableMeals: availableMeals,
    );
    var activePageTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      final favoriteMeals = ref.watch(
          favoriteMealsProvider); // better pakai watch kalau ada data yang berubah
      activePage = MealsScreen(
        meals: favoriteMeals,
      );
      activePageTitle = 'Your Favorites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(
        onSelectScreen: _setScreen,
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
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
