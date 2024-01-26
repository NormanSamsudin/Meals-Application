// //import 'package:flutter/foundation.dart';
// //import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:meals/data/dummy_data.dart';
// import 'package:meals/screens/meals.dart';
// import 'package:meals/models/category.dart';
// import 'package:meals/models/meal.dart';
// import 'package:meals/widgets/category_grid_item.dart';

// class CategoriesScreen extends StatelessWidget {
//   const CategoriesScreen({super.key, required this.onToggleFavorite, required this.availableMeals});

//   final void Function(Meal meal) onToggleFavorite;
//   final List<Meal> availableMeals;

//   void _selectCategory(BuildContext context, Category category) {
//     // nak filterlist of meals
//     final filteredMeals = availableMeals
//         .where((meal) => meal.categories.contains(category.id))
//         .toList();

//     //sama jer macam Navigator.of(context).push(route)
//     Navigator.push(
//         context,
//         MaterialPageRoute(
//             builder: (ctx) => MealsScreen(
//                   title: category.title,
//                   meals: filteredMeals,
//                   onToggleFavorite: onToggleFavorite,
//                 )));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GridView(
//       padding: const EdgeInsets.all(24),
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         childAspectRatio: 3 / 2,
//         mainAxisSpacing: 20,
//         crossAxisSpacing: 20,
//       ),
//       children: [
//         // kalau mcm ni tak perlu nk kne tulis byk kali sbb pakai for loop jer lagy senang
//         for (final category in availableCategories)
//           CategoryGridItem(
//             category: category,
//             onSelectCategory: () {
//               _selectCategory(context, category); // spesific category
//             },
//           )
//       ],
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:meals/data/dummy_data.dart';
// import 'package:meals/models/meal.dart';
// import 'package:meals/widgets/category_grid_item.dart';
// import 'package:meals/screens/meals.dart';
// import 'package:meals/models/category.dart';

// class CategoriesScreen extends StatelessWidget {
//   const CategoriesScreen({super.key, required this.onToggleFavorite, required this.availableMeals});

//   final void Function(Meal meal) onToggleFavorite;
//   final List<Meal> availableMeals;

//   void _selectCategory(BuildContext context, Category category) {
//     // nak filter list of meals by category
//     final filteredMeals = availableMeals
//         .where((meal) => meal.categories.contains(category.id))
//         .toList();

//     Navigator.of(context).push(
//       MaterialPageRoute(
//         builder: (ctx) => MealsScreen(
//           title: category.title,
//           meals: filteredMeals,
//           onToggleFavorite: onToggleFavorite,
//         ),
//       ),
//     ); // Navigator.push(context, route)
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GridView(
//       padding: const EdgeInsets.all(24),
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         childAspectRatio: 3 / 2,
//         crossAxisSpacing: 20,
//         mainAxisSpacing: 20,
//       ),
//       children: [
//         // availableCategories.map((category) => CategoryGridItem(category: category)).toList()
//         // kalau mcm ni tak perlu nk kne tulis byk kali sbb pakai for loop jer lagy senang
//         for (final category in availableCategories)
//           CategoryGridItem(
//             category: category,
//             onSelectCategory: () {
//               _selectCategory(context, category);
//             },
//           )
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';

import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/category_grid_item.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/models/category.dart';

class CategoriesScreen extends StatefulWidget {
  // jadikan stateful widget sebab nak kasi ada animation
  const CategoriesScreen({
    super.key,
    required this.availableMeals,
  });

  final List<Meal> availableMeals;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  // merge class using with for animation
  late AnimationController _animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
      lowerBound: 0, // default
      upperBound: 1, //default
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController.dispose();
  }

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = widget.availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title,
          meals: filteredMeals,
        ),
      ),
    ); // Navigator.push(context, route)
  }

  @override
  Widget build(BuildContext context) {
    // animation builder
    return AnimatedBuilder(
        animation: _animationController,
        child: GridView(
          padding: const EdgeInsets.all(24),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          children: [
            // availableCategories.map((category) => CategoryGridItem(category: category)).toList()
            for (final category in availableCategories)
              CategoryGridItem(
                category: category,
                onSelectCategory: () {
                  _selectCategory(context, category);
                },
              )
          ],
        ),
        // builder: (context, child) => Padding(
        //       padding: EdgeInsets.only(top: 100 -_animationController.value * 100),
        //       child: child,
        //     ));
                builder: (context, child) => SlideTransition(position:
                  Tween(
                    begin: const Offset(0, 0.3),
                    end: const Offset(0, 0),
                  ).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOut))
                  , 
                child: child,));
  }
}
