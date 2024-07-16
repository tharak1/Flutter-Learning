import 'package:expence/data/expenses_data.dart';
import 'package:expence/widgets/card.dart';
import 'package:flutter/widgets.dart';

class CardsList extends StatelessWidget {
  const CardsList(
      {super.key, required this.expences, required this.removeExpence});

  final List<Expences> expences;
  final void Function(Expences expence) removeExpence;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expences.length,
      itemBuilder: (ctx, index) => Dismissible(
        onDismissed: (direction) {
          removeExpence(expences[index]);
        },
        key: ValueKey(expences[index]),
        child: Card1(expences[index]),
      ),
    );
  }
}
