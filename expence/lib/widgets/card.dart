import 'package:expence/data/expenses_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Card1 extends StatelessWidget {
  const Card1(this.currentExpences, {super.key});

  final Expences currentExpences;
  @override
  Widget build(BuildContext context) {
    return Card(
      // color: Color.fromARGB(255, 216, 216, 216),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 40,
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              currentExpences.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Row(
              children: [
                Text('\$${currentExpences.amount.toStringAsFixed(2)}'),
                const Spacer(),
                Row(
                  children: [
                    Icon(categoryIcons[currentExpences.category]),
                    const SizedBox(width: 8),
                    Text(currentExpences.formattedDate),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
