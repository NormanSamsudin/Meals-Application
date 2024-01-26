// import 'package:flutter/material.dart';
// import 'package:meals/models/meal.dart';
// import 'package:meals/screens/meal_details.dart';
// import 'package:meals/widgets/meal_item.dart';

// class MealsScreen extends StatelessWidget {
//   const MealsScreen({
//     super.key,
//     this.title,
//     required this.meals,
//     required this.onToggleFavorite,
//   });
//   // kita bagi die option untuk jadi null sebab nak kasi 
//   final String? title; // untuk string yang tak required kne ltk ? time declare
//   final List<Meal> meals;
//   final void Function(Meal meal) onToggleFavorite;

//   //function ni buat sbb nnti kita nak pass function ni bila nak
//   void selectMeal(BuildContext context, Meal meal) {
//     // navigator push ni kalau push maknanya dia akan stackkan screen page.
//     Navigator.of(context).push(
//       MaterialPageRoute(
//         builder: (ctx) => MealDetailsScreen(
//           meal: meal,
//           onToggleFavorite: onToggleFavorite,
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {

//     // initialize content incase kalau takde data so akan display mnde ni
//     Widget content = Center(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text(
//                 'Uh oh ... nothing here!',
//                 style: Theme.of(context).textTheme.headlineLarge!.copyWith(
//                       color: Theme.of(context).colorScheme.onBackground,
//                     ),
//               ),
//               const SizedBox(height: 16),
//               Text(
//                 'Try selecting a different category!',
//                 style: Theme.of(context).textTheme.bodyLarge!.copyWith(
//                       color: Theme.of(context).colorScheme.onBackground,
//                     ),
//               ),
//             ],
//           ),
//         );

//     //tapi kalau meals tu ada bende kita akan ubah widget content tu.
//     if (meals.isNotEmpty ) {
//       // listview.bilder ni pakai bila dah ada objectarray lepastu kita nak masukkan dalam dalam widget byk2
//       content = ListView.builder(
//         //item count ni penting supaya tak keluar error ngn specify length die brapa
//         itemCount: meals.length,
//         itemBuilder: (ctx, index) => MealItem(
//             meal: meals[index],
//             onSelectMeal: (meals) {
//               selectMeal(context, meals);
//             }),
//       );
//     }
    

//     if (title == null) {
//       return content;
//     }

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(title!),
//       ),
//       body: content,
//     );
//   }
// }

// import 'package:flutter/material.dart';

// import 'package:meals/models/meal.dart';
// import 'package:meals/screens/meal_details.dart';
// import 'package:meals/widgets/meal_item.dart';

// class MealsScreen extends StatelessWidget {
//   const MealsScreen({
//     super.key,
//     this.title,
//     required this.meals,
//     required this.onToggleFavorite,
//   });

//   final String? title;
//   final List<Meal> meals;
//   final void Function(Meal meal) onToggleFavorite;

//   void selectMeal(BuildContext context, Meal meal) {
//     // navigator push ni kalau push maknanya dia akan stackkan screen page.
//     Navigator.of(context).push(
//       MaterialPageRoute(
//         builder: (ctx) => MealDetailsScreen(
//           meal: meal,
//           onToggleFavorite: onToggleFavorite,
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {

//     // initialize content incase kalau takde data so akan display mnde ni
//     Widget content = Center(
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Text(
//             'Uh oh ... nothing here!',
//             style: Theme.of(context).textTheme.headlineLarge!.copyWith(
//                   color: Theme.of(context).colorScheme.onBackground,
//                 ),
//           ),
//           const SizedBox(height: 16),
//           Text(
//             'Try selecting a different category!',
//             style: Theme.of(context).textTheme.bodyLarge!.copyWith(
//                   color: Theme.of(context).colorScheme.onBackground,
//                 ),
//           ),
//         ],
//       ),
//     );

//     //tapi kalau meals tu ada bende kita akan ubah widget content tu.
//     if (meals.isNotEmpty) {
//       // listview.bilder ni pakai bila dah ada objectarray lepastu kita nak masukkan dalam dalam widget byk2
//       content = ListView.builder(
//         //item count ni penting supaya tak keluar error ngn specify length die brapa
//         itemCount: meals.length,
//         itemBuilder: (ctx, index) => MealItem(
//           meal: meals[index],
//           onSelectMeal: (meal) {
//             selectMeal(context, meal);
//           },
//         ),
//       );
//     }

//     if (title == null) {
//       return content;
//     }

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(title!),
//       ),
//       body: content,
//     );
//   }
// }
import 'package:flutter/material.dart';

import 'package:meals/models/meal.dart';
import 'package:meals/screens/meal_details.dart';
import 'package:meals/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    this.title,
    required this.meals,

  });

  final String? title;
  final List<Meal> meals;


  void selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealDetailsScreen(
          meal: meal,

        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Uh oh ... nothing here!',
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          const SizedBox(height: 16),
          Text(
            'Try selecting a different category!',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
        ],
      ),
    );

    if (meals.isNotEmpty) {
      content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) => MealItem(
          meal: meals[index],
          onSelectMeal: (meal) {
            selectMeal(context, meal);
          },
        ),
      );
    }

    if (title == null) {
      return content;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
    );
  }
}