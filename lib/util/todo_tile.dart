import 'package:flutter/material.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(String taskName) onDelete;

  ToDoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 0),
        child: GestureDetector(
          onLongPress: () {
            onDelete(taskName);
          },
          child: CheckboxListTile(
            title: Text(
              taskName,
              style: TextStyle(
                  decoration: taskCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none),
            ),
            value: taskCompleted,
            onChanged: onChanged,
            controlAffinity: ListTileControlAffinity.leading,
          ),
        ),
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(width: 1, color: Colors.black12)),
        ),
      ),
    );
  }
}
