// import 'package:flutter/material.dart';
// import 'package:meals/screens/tabs.dart';
// import 'package:meals/widgets/main_drawer.dart';

// class FiltersScreen extends StatefulWidget {
//   @override
//   State<FiltersScreen> createState() => _FiltersScreenState();
// }

// class _FiltersScreenState extends State<FiltersScreen> {
//   var _glutenFreeFilterSet = false;
//   var _lactoseFreeFilterSet = false;
//   var _vegetarianFilterSet = false;
//   var _veganFilterSet = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Yor Filters'),
//       ),
//       // drawer: MainDrawer(onSelectScreen: ((identifier) {
//       //   Navigator.of(context).pop();
//       //   if (identifier == 'meals') {
//       //     Navigator.of(context).pushReplacement(MaterialPageRoute(
//       //       builder: (context) => TabScreen(),
//       //     ));
//       //   }
//       // })),

//       body: WillPopScope(
//         // future function yg invoked once leaved the screen
//         onWillPop: () async{
//           // pop manually
//           Navigator.of(context).pop({
//             Filter.glutenFree: _glutenFreeFilterSet,
//             Filter.lactoseFree: _lactoseFreeFilterSet,
//             Filter.vegetarian: _vegetarianFilterSet,
//             Filter.vegan: _veganFilterSet,
//           });
//           // nak elakkan pop dua kali
//           return false;
//         },
//         child: Column(
//           children: [
//             SwitchListTile(
//               value: _glutenFreeFilterSet,
//               onChanged: (isChecked) {
//                 print(isChecked);
//                 setState(() {
//                   _glutenFreeFilterSet = isChecked;
//                 });
//               },
//               title: Text(
//                 'Gluten-free',
//                 style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                       color: Theme.of(context).colorScheme.onBackground,
//                     ),
//               ),
//               subtitle: Text(
//                 'Only include gluten-free meals',
//                 style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                       color: Theme.of(context).colorScheme.onBackground,
//                     ),
//               ),
//               //color kalau die tgh true
//               activeColor: Theme.of(context).colorScheme.tertiary,
//               contentPadding: const EdgeInsets.only(left: 34, right: 22),
//             ),
//             SwitchListTile(
//               value: _lactoseFreeFilterSet,
//               onChanged: (isChecked) {
//                 print(isChecked);
//                 setState(() {
//                   _lactoseFreeFilterSet = isChecked;
//                 });
//               },
//               title: Text(
//                 'lactose-free',
//                 style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                       color: Theme.of(context).colorScheme.onBackground,
//                     ),
//               ),
//               subtitle: Text(
//                 'Only include lactose-free meals',
//                 style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                       color: Theme.of(context).colorScheme.onBackground,
//                     ),
//               ),
//               //color kalau die tgh true
//               activeColor: Theme.of(context).colorScheme.tertiary,
//               contentPadding: const EdgeInsets.only(left: 34, right: 22),
//             ),
//             SwitchListTile(
//               value: _vegetarianFilterSet,
//               onChanged: (isChecked) {
//                 print(isChecked);
//                 setState(() {
//                   _vegetarianFilterSet = isChecked;
//                 });
//               },
//               title: Text(
//                 'Vegetarian',
//                 style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                       color: Theme.of(context).colorScheme.onBackground,
//                     ),
//               ),
//               subtitle: Text(
//                 'Only include Vegetarian meals',
//                 style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                       color: Theme.of(context).colorScheme.onBackground,
//                     ),
//               ),
//               //color kalau die tgh true
//               activeColor: Theme.of(context).colorScheme.tertiary,
//               contentPadding: const EdgeInsets.only(left: 34, right: 22),
//             ),
//             SwitchListTile(
//               value: _veganFilterSet,
//               onChanged: (isChecked) {
//                 print(isChecked);
//                 setState(() {
//                   _veganFilterSet = isChecked;
//                 });
//               },
//               title: Text(
//                 'Vegan',
//                 style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                       color: Theme.of(context).colorScheme.onBackground,
//                     ),
//               ),
//               subtitle: Text(
//                 'Only include Vegan meals',
//                 style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                       color: Theme.of(context).colorScheme.onBackground,
//                     ),
//               ),
//               //color kalau die tgh true
//               activeColor: Theme.of(context).colorScheme.tertiary,
//               contentPadding: const EdgeInsets.only(left: 34, right: 22),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// // import 'package:meals/screens/tabs.dart';
// // import 'package:meals/widgets/main_drawer.dart';

// enum Filter {
//   glutenFree,
//   lactoseFree,
//   vegetarian,
//   vegan,
// }

// class FiltersScreen extends StatefulWidget {
//   const FiltersScreen({super.key});

//   @override
//   State<FiltersScreen> createState() {
//     return _FiltersScreenState();
//   }
// }

// class _FiltersScreenState extends State<FiltersScreen> {
//   var _glutenFreeFilterSet = false;
//   var _lactoseFreeFilterSet = false;
//   var _vegetarianFilterSet = false;
//   var _veganFilterSet = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Your Filters'),
//       ),
//       // drawer: MainDrawer(
//       //   onSelectScreen: (identifier) {
//       //     Navigator.of(context).pop();
//       //     if (identifier == 'meals') {
//       //       Navigator.of(context).pushReplacement(
//       //         MaterialPageRoute(
//       //           builder: (ctx) => const TabsScreen(),
//       //         ),
//       //       );
//       //     }
//       //   },
//       // ),
//       body: WillPopScope(
//         //future function yang invoked when user try to leave the screen
//         onWillPop: () async{
//           // nak buat pop manually
//           Navigator.of(context).pop(
//             {
//               // hantar data ni sambil pop
//               Filter.glutenFree: _glutenFreeFilterSet,
//               Filter.lactoseFree: _lactoseFreeFilterSet,
//               Filter.vegetarian: _vegetarianFilterSet,
//               Filter.vegan: _veganFilterSet,
//             }
//           );
//           // bila nak buat pop manually nnti nak elak auto pop
//           // supaya tak pop dua kali
//            return false;
//         },
//         child: Column(
//           children: [
//             SwitchListTile(
//               value: _glutenFreeFilterSet,
//               onChanged: (isChecked) {
//                 setState(() {
//                   _glutenFreeFilterSet = isChecked;
//                 });
//               },
//               title: Text(
//                 'Gluten-free',
//                 style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                       color: Theme.of(context).colorScheme.onBackground,
//                     ),
//               ),
//               subtitle: Text(
//                 'Only include gluten-free meals.',
//                 style: Theme.of(context).textTheme.labelMedium!.copyWith(
//                       color: Theme.of(context).colorScheme.onBackground,
//                     ),
//               ),
//               activeColor: Theme.of(context).colorScheme.tertiary,
//               contentPadding: const EdgeInsets.only(left: 34, right: 22),
//             ),
//             SwitchListTile(
//               value: _lactoseFreeFilterSet,
//               onChanged: (isChecked) {
//                 setState(() {
//                   _lactoseFreeFilterSet = isChecked;
//                 });
//               },
//               title: Text(
//                 'Lactose-free',
//                 style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                       color: Theme.of(context).colorScheme.onBackground,
//                     ),
//               ),
//               subtitle: Text(
//                 'Only include lactose-free meals.',
//                 style: Theme.of(context).textTheme.labelMedium!.copyWith(
//                       color: Theme.of(context).colorScheme.onBackground,
//                     ),
//               ),
//               activeColor: Theme.of(context).colorScheme.tertiary,
//               contentPadding: const EdgeInsets.only(left: 34, right: 22),
//             ),
//             SwitchListTile(
//               value: _vegetarianFilterSet,
//               onChanged: (isChecked) {
//                 setState(() {
//                   _vegetarianFilterSet = isChecked;
//                 });
//               },
//               title: Text(
//                 'Vegetarian',
//                 style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                       color: Theme.of(context).colorScheme.onBackground,
//                     ),
//               ),
//               subtitle: Text(
//                 'Only include vegetarian meals.',
//                 style: Theme.of(context).textTheme.labelMedium!.copyWith(
//                       color: Theme.of(context).colorScheme.onBackground,
//                     ),
//               ),
//               activeColor: Theme.of(context).colorScheme.tertiary,
//               contentPadding: const EdgeInsets.only(left: 34, right: 22),
//             ),
//             SwitchListTile(
//               value: _veganFilterSet,
//               onChanged: (isChecked) {
//                 setState(() {
//                   _veganFilterSet = isChecked;
//                 });
//               },
//               title: Text(
//                 'Vegan',
//                 style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                       color: Theme.of(context).colorScheme.onBackground,
//                     ),
//               ),
//               subtitle: Text(
//                 'Only include vegan meals.',
//                 style: Theme.of(context).textTheme.labelMedium!.copyWith(
//                       color: Theme.of(context).colorScheme.onBackground,
//                     ),
//               ),
//               activeColor: Theme.of(context).colorScheme.tertiary,
//               contentPadding: const EdgeInsets.only(left: 34, right: 22),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/filters_provider.dart';

// import 'package:meals/screens/tabs.dart';
// import 'package:meals/widgets/main_drawer.dart';

// enum Filter {
//   glutenFree,
//   lactoseFree,
//   vegetarian,
//   vegan,
// }

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      // drawer: MainDrawer(
      //   onSelectScreen: (identifier) {
      //     Navigator.of(context).pop();
      //     if (identifier == 'meals') {
      //       Navigator.of(context).pushReplacement(
      //         MaterialPageRoute(
      //           builder: (ctx) => const TabsScreen(),
      //         ),
      //       );
      //     }
      //   },
      // ),
      body: Column(
        children: [
          SwitchListTile(
            value: activeFilters[Filter.glutenFree]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.glutenFree, isChecked);
            },
            title: Text(
              'Gluten-free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'Only include gluten-free meals.',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
                      value: activeFilters[Filter.lactoseFree]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.lactoseFree, isChecked);
            },
            title: Text(
              'Lactose-free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'Only include lactose-free meals.',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
                      value: activeFilters[Filter.vegetarian]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegetarian, isChecked);
            },
            title: Text(
              'Vegetarian',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'Only include vegetarian meals.',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: activeFilters[Filter.vegan]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegan, isChecked);
            },
            title: Text(
              'Vegan',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'Only include vegan meals.',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
        ],
      ),
    );
  }
}
