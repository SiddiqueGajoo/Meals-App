import 'package:flutter/material.dart';
import 'package:practice/models/meal.dart';
import 'package:practice/screens/meals_detail_screen.dart';
import 'package:practice/widgets/meal_item.dart';
// this screen also show the favorites meals
class MealsScreen extends StatelessWidget {
  const MealsScreen({this.title, required this.meals, super.key});

  final String? title; // add ? means it's not necessary
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    void selectMeal(Meal meal) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MealsDetailScreen(
                    meal: meal,
                  )));
    }

    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Uh oh...Nothing here!',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground)),
          const SizedBox(
            height: 16,
          ),
          Text(
            'Try selecting a different category',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
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
                  selectMeal(meal);
                },
              ));
    }
    if (title == null) {
      return content;
    }
    return Scaffold(
        appBar: AppBar(
          title: Text(title!),
        ),
        body: content);
  }
}
