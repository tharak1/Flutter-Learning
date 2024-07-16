import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:myapp/data/data.dart";

class TodoModal extends StatefulWidget {
  const TodoModal({super.key, required this.addTodo});
  final void Function(TodoList todo1) addTodo;
  @override
  State<TodoModal> createState() {
    return _TodoModalState();
  }
}

class _TodoModalState extends State<TodoModal> {
  DateTime? _setedDate;
  TimeOfDay? _setedTime;
  var setedTime;

  final _todoTextController = TextEditingController();

  void _presentDatePicker() async {
    final now = DateTime.now();
    final lastDate = DateTime(now.year + 1, now.month, now.day);
    final pickdate = await showDatePicker(
        context: context, initialDate: now, firstDate: now, lastDate: lastDate);
    final picktime =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    setState(() {
      _setedDate = pickdate;
      _setedTime = picktime;
      if (_setedTime != null) {
        setedTime = picktime.toString().substring(10, 15);
      }
    });
    print(_setedDate);
    if (_setedTime != null) {
      print("hey");
    } else {
      print(setedTime);
    }
  }

  void _add() {
    if (_todoTextController.text.trim().isEmpty || _setedDate == null) {
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

    widget.addTodo(TodoList(
        title: _todoTextController.text, date: _setedDate!, time: setedTime));

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(40, 60, 40, 40),
      child: Column(
        children: [
          const Text(
            "New To-Do",
            style: TextStyle(fontSize: 28),
          ),
          TextField(
            controller: _todoTextController,
            decoration: const InputDecoration(
              label: Text(
                "Title",
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _presentDatePicker,
                child: const Text("Pick a reminder"),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: _add,
                child: const Text("Add"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
