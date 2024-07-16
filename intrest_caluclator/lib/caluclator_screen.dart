import 'package:flutter/material.dart';
import "package:flutter/widgets.dart";

class ClacInt extends StatefulWidget {
  const ClacInt({super.key});

  @override
  State<ClacInt> createState() {
    return _CalcIntState();
  }
}

class _CalcIntState extends State<ClacInt> {
  final _amountController = TextEditingController();
  final _intrestController = TextEditingController();
  DateTime? _beginingDate;
  DateTime? _endDate;
  var days = 0;

  void _beginingDatePicker() async {
    final now = DateTime.now();
    final lastDate = DateTime(now.year + 1, now.month, now.day);
    final pickdate = await showDatePicker(
        context: context, initialDate: now, firstDate: now, lastDate: lastDate);
    setState(() {
      _beginingDate = pickdate;
    });
    print(_beginingDate);
  }

  void _endDatePicker() async {
    final now = DateTime.now();
    final lastDate = DateTime(now.year + 1, now.month, now.day);
    final pickdate = await showDatePicker(
        context: context, initialDate: now, firstDate: now, lastDate: lastDate);
    setState(() {
      _endDate = pickdate;
    });
    print(_endDate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("intrest caluclator"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _amountController,
              decoration: const InputDecoration(
                label: Text(
                  "Amount",
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: _intrestController,
              decoration: const InputDecoration(
                label: Text(
                  "Interest",
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: _beginingDatePicker,
              child: const Text("Pick a start"),
            ),
            ElevatedButton(
              onPressed: _endDatePicker,
              child: const Text("Pick a end"),
            ),
            ElevatedButton(
              onPressed: () {
                final difference = _endDate!.difference(_beginingDate!).inDays;
                setState(() {
                  days = difference;
                });
              },
              child: Text("Submit"),
            ),
            Text(days.toString()),
          ],
        ),
      ),
    );
  }
}
