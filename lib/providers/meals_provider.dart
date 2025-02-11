import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice/data/dummy_data.dart';

final mealsProviders = Provider((ref) {
  //Provider is a basic class of riverpod best use for a data that never changes
  return dummyMeals;
});
