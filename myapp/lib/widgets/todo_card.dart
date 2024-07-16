import 'package:flutter/material.dart';
import 'package:myapp/data/data.dart';

class TodoCard extends StatelessWidget {
  const TodoCard({super.key, required this.todo, required this.deleteTodo});

  final TodoList todo;
  final void Function(TodoList todo1) deleteTodo;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.fromLTRB(15, 25, 15, 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  todo.title,
                  style: const TextStyle(
                      fontSize: 26, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 7,
                ),
                const Text(
                  "Complete By:",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 7,
                ),
                Row(
                  children: [
                    Text(
                      todo.formattedDate,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      todo.time,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                  ],
                )
              ],
            ),
            ElevatedButton.icon(
              onPressed: () {
                deleteTodo(todo);
              },
              style: ElevatedButton.styleFrom(
                  elevation: 10,
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white),
              icon: const Icon(Icons.delete),
              label: Text("Delete"),
            ),
          ],
        ),
      ),
    );
  }
}
