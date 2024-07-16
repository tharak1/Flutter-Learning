import 'package:flutter/material.dart';
import 'package:meals/models/meals_model.dart';
import 'package:meals/widgets/meals_card.dart';

class Meals extends StatelessWidget {
  const Meals({
    super.key,
    required this.categoryTitle,
    required this.meals,
    required this.ontogglefav,
  });

  final String categoryTitle;
  final List<Meal> meals;
  final void Function(Meal meal) ontogglefav;

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
        itemBuilder: (context, index) => MealsCard(
          meal: meals[index],
          ontogglefav: ontogglefav,
        ),
      );
    }

    Widget main = Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: content);

    if (categoryTitle == 'Favourites') {
      main = content;
    }

    return main;
  }
}
