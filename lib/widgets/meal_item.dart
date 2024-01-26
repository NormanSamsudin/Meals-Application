import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({
    super.key,
    required this.meal,
    required this.onSelectMeal,
  });

  final Meal meal;
  final void Function(Meal meal) onSelectMeal;

  // nak format bila retrieve complexity die
  String get complexityText {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  //na format string affordibility
  String get affordabilityText {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      //ada border radius saja tak cukup
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      //nak pastikan kalau ada element tang terkeluar drpd share cut off
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap: () {
          onSelectMeal(meal);//kirenye bila orang to select meal tu die akan pergi ke meal_details screen
        },
        // nak stackkan widget
        child: Stack(
          children: [
            //bawah sekali
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity, //supaya boleh pakai sebanyak yang mungkin
            ),

            Positioned(
              //top jer takde sbb tak nak amik full size
              bottom: 0,
              left: 0,
              right: 0,

              child: Container(
                color: Colors.black54,
                padding:
                    const EdgeInsets.symmetric(horizontal: 44, vertical: 6),
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow
                          .ellipsis, //text yang panjang sangat akan da ...
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MealItemTrait(
                            icon: Icons.schedule,
                            label: '${meal.duration} min'),
                        const SizedBox(
                          width: 12,
                        ),
                        MealItemTrait(
                            icon: Icons.work,
                            label:
                                '$complexityText min'), //kalau panggil function lain skit dlm string tak yah ada {}
                        const SizedBox(
                          width: 12,
                        ),
                        MealItemTrait(
                            icon: Icons.attach_money, label: affordabilityText),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
