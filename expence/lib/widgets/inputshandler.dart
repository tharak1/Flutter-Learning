import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:expence/data/expenses_data.dart';

class AddExpence extends StatefulWidget {
  const AddExpence(this.onAddExpence, {super.key});
  final void Function(Expences expences) onAddExpence;
  @override
  State<AddExpence> createState() {
    return _AddExpenceState();
  }
}

class _AddExpenceState extends State<AddExpence> {
  Category _selectedCategory = Category.other;

  final _textController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _setedDate;

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickdate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: now);

    setState(() {
      _setedDate = pickdate;
    });
  }

  void addData() {
    final enteredAmount = double.tryParse(_amountController.text);
    final amountValidator = enteredAmount == null || enteredAmount <= 0;
    if (_textController.text.trim().isEmpty ||
        amountValidator ||
        _setedDate == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text("Invalid Input"),
          content: const Text("All fields are manditory !!"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text("Okay"),
            )
          ],
        ),
      );
    }

    widget.onAddExpence(Expences(
        title: _textController.text,
        amount: enteredAmount!,
        date: _setedDate!,
        category: _selectedCategory));

    Navigator.pop(context);
  }

  @override
  void dispose() {
    _textController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          TextField(
            controller: _textController,
            maxLength: 30,
            decoration: const InputDecoration(
              label: Text("Title"),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixText: '\$ ',
                    label: Text("Amount"),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Row(
                children: [
                  Text(
                    _setedDate == null
                        ? 'No date selected'
                        : formatter.format(_setedDate!),
                  ),
                  IconButton(
                      onPressed: _presentDatePicker,
                      icon: const Icon(Icons.calendar_month))
                ],
              ),
            ],
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DropdownButton(
                  value: _selectedCategory,
                  items: Category.values
                      .map((category) => DropdownMenuItem(
                            value: category,
                            child: Text(category.name.toUpperCase()),
                          ))
                      .toList(),
                  onChanged: (value) {
                    if (value == null) {
                      return;
                    }
                    setState(() {
                      _selectedCategory = value;
                    });
                  }),
              Row(
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Close")),
                  ElevatedButton(
                    onPressed: addData,
                    child: const Text("Submit"),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
