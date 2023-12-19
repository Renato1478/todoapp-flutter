import 'package:flutter/material.dart';
import 'package:todoapp/util/deletetask_dialog.dart';
import 'package:todoapp/util/newtask_dialog.dart';
import 'package:todoapp/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();

  List toDoList = [
    ["Make tutorial", false],
    ["Exercise my legs", false],
    ["Go jogging with Emilia", false],
  ];

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  void saveNewTask() {
    setState(() {
      toDoList.add([_controller.text, false]);
    });
    Navigator.of(context).pop();
    _controller.text = "";
  }

  void cancelNewTask() {
    Navigator.of(context).pop();
    _controller.text = "";
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return NewTaskDialog(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: cancelNewTask,
        );
      },
    );
  }

  void deleteTask(String taskName) {
    for (var i = 0; i < toDoList.length; i++) {
      if (toDoList[i][0] == taskName) {
        setState(() {
          toDoList.removeAt(i);
        });
      }
    }
    Navigator.of(context).pop();
  }

  void confirmTaskDelete(String taskName) {
    showDialog(
      context: context,
      builder: (context) {
        return DeleteTaskDialog(
          taskName: taskName,
          onDelete: deleteTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("TO DO"),
        elevation: 0,
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(
          Icons.add,
        ),
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: toDoList[index][0],
            taskCompleted: toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            onDelete: confirmTaskDelete,
          );
        },
      ),
    );
  }
}
