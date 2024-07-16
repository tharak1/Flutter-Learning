import 'package:flutter/material.dart';
import 'package:meals/models/meals_model.dart';
import 'package:meals/screens/meals_details_screen.dart';
import 'package:transparent_image/transparent_image.dart';

class MealsCard extends StatelessWidget {
  const MealsCard({super.key, required this.meal, required this.ontogglefav});
  final Meal meal;
  final void Function(Meal meal) ontogglefav;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 207, 207, 207),
      margin: const EdgeInsets.all(20),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  MealsDetails(meal: meal, addtofav: ontogglefav),
            ),
          );
        },
        splashColor: const Color.fromARGB(255, 251, 251, 251),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: FadeInImage(
                  placeholder: MemoryImage(kTransparentImage),
                  image: NetworkImage(meal.imageUrl),
                  fit: BoxFit.cover,
                  height: 200,
                  width: double.infinity,
                ),
              ),
              // const SizedBox(
              //   height: 20,
              // ),
              Text(
                meal.title,
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'time : ${meal.duration} min',
                    style: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "cost : ${meal.affordability.name}",
                    style: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
