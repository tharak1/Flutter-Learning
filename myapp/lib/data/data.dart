import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

final formatter = DateFormat.yMMMEd();

const uuid = Uuid();

class TodoList {
  TodoList({
    required this.title,
    required this.date,
    required this.time,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final String time;
  final DateTime date;

  String get formattedDate {
    return formatter.format(date);
  }
}
