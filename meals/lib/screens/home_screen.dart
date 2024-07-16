import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/meals_model.dart';
import 'package:meals/screens/meals_screen.dart';
import 'package:meals/widgets/category_card.dart';
import 'package:meals/models/category_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.ontogglefav1});
  final void Function(Meal meal) ontogglefav1;

  void _categoryMeals(BuildContext context, Category category) {
    final filterdMeals = dummyMeals
        .where((meals) => meals.categories.contains(category.id))
        .toList();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Meals(
          categoryTitle: category.title,
          meals: filterdMeals,
          ontogglefav: ontogglefav1,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: GridView(
            padding: const EdgeInsets.all(5),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 20,
              childAspectRatio: 3 / 3,
            ),
            children: [
              for (var category in availableCategories)
                CategoryCard(
                    category: category,
                    navCategory: () {
                      _categoryMeals(context, category);
                    }),
            ],
          ),
        ),
      ],
    );
  }
}
