import 'package:flutter/material.dart';
import 'package:myapp/data/data.dart';
import 'package:myapp/modals/todo_model.dart';
import 'package:myapp/widgets/todo_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  final List<TodoList> _enteredTodo = [];
  void _openModel() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) => TodoModal(addTodo: _add));
  }

  void _add(TodoList todo1) {
    setState(() {
      _enteredTodo.add(todo1);
    });
  }

  void _delete(TodoList todo1) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Conformation"),
        content: const Text("lakwfbi3ryvbfewilruvbaryvibvuwlvbeuirvbhebv"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("cancel"),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                _enteredTodo.remove(todo1);
              });
              Navigator.pop(context);
            },
            child: const Text("Okay"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget main = const Center(
      child: Text(
        "there is nothing here !!",
        style: TextStyle(fontSize: 20),
      ),
    );
    if (_enteredTodo.isNotEmpty) {
      main = ListView.builder(
        itemCount: _enteredTodo.length,
        itemBuilder: (context, index) =>
            TodoCard(todo: _enteredTodo[index], deleteTodo: _delete),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo List "),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(child: main),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openModel,
        child: const Icon(Icons.add),
      ),
    );
  }
}
