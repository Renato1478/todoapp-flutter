import 'package:flutter/material.dart';
import 'package:todoapp/util/primary_button.dart';

class DeleteTaskDialog extends StatelessWidget {
  final String taskName;
  Function(String taskName) onDelete;
  VoidCallback onCancel;

  DeleteTaskDialog({
    super.key,
    required this.taskName,
    required this.onDelete,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Are you sure you want to delete this task?"),
      content: Container(
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PrimaryButton(text: "Cancel", onPressed: onCancel),
            PrimaryButton(
              text: "Delete",
              onPressed: (() => onDelete(taskName)),
            ),
          ],
        ),
      ),
    );
  }
}
