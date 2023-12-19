import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List toDoList = [];

  final _toDoBox = Hive.box('todobox');

  // run this if its the first time ever running the app
  void createInitialData() {
    toDoList = [
      ["Make tutorial", false],
      ["Do exercise", false],
    ];
  }

  void loadData() {
    toDoList = _toDoBox.get('TODOLIST');
  }

  void updateDataBase() {
    _toDoBox.put('TODOLIST', toDoList);
  }
}
