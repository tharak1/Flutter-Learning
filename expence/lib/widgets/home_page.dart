import 'package:expence/data/expenses_data.dart';
import 'package:expence/widgets/cards_list.dart';
import 'package:expence/widgets/chart.dart';
import 'package:expence/widgets/inputshandler.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  final List<Expences> _exampleExpences = [
    Expences(
      title: "movie",
      amount: 15.99,
      date: DateTime.now(),
      category: Category.other,
    ),
    Expences(
      title: "work",
      amount: 15.99,
      date: DateTime.now(),
      category: Category.job,
    ),
    Expences(
      title: "burger",
      amount: 15.99,
      date: DateTime.now(),
      category: Category.food,
    ),
  ];

  void _addExpence(Expences expences) {
    setState(() {
      _exampleExpences.add(expences);
    });
  }

  void _removeExpence(Expences expences) {
    final expenceIndex = _exampleExpences.indexOf(expences);
    setState(() {
      _exampleExpences.remove(expences);
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 4),
      content: const Text("Expence deleted !"),
      action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _exampleExpences.insert(expenceIndex, expences);
            });
          }),
    ));
  }

  void _openModel() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx) => AddExpence(_addExpence));
  }

  @override
  Widget build(BuildContext context) {
    Widget mainComponent = const Center(
      child: Text("There are no expences here !!"),
    );

    if (_exampleExpences.isNotEmpty) {
      mainComponent = Center(
        child: CardsList(
            expences: _exampleExpences, removeExpence: _removeExpence),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Expenses"),
        actions: [
          IconButton(
            onPressed: _openModel,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          Chart(expenses: _exampleExpences),
          Expanded(
            child: mainComponent,
          ),
        ],
      ),
    );
  }
}
