import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/data/dummy_data.dart';


// ni mcm statis provider jer sbb data tu tak beubah pon
final mealsProvider = Provider( // create provider object
  (ref) {
    return dummyMeals;
  },
);
