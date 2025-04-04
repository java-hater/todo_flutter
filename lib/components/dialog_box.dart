import 'package:flutter/material.dart';
import 'package:todo_flutter/components/todo_button.dart';

class DialogBox extends StatelessWidget {
  final TextEditingController controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.tealAccent[100],
      content: Container(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // get user input
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add a new task",
              ),
            ),
            // buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // save
                todoButton(text: "Save", onPressed: onSave ),
                // manual spacer
                const SizedBox(width: 8.0),
                // cancel
                todoButton(text: "Cancel", onPressed: onCancel ),
              ],
            )
        ],),

      ),
    );
  }
}