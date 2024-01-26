import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({
    super.key,
    required this.category,
    required this.onSelectCategory,
  });

  final Category category;
  final void Function() onSelectCategory;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onSelectCategory();
      },
      borderRadius: BorderRadius.circular(16),
      splashColor: Theme.of(context)
          .primaryColor, // kalo tap lama2 dekat widget die akan light up skit
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(16), // nak kasi widget ada rounded skit
            gradient: LinearGradient(colors: [
              category.color.withOpacity(0.5),
              category.color.withOpacity(0.9),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      ),
    );
  }
}
