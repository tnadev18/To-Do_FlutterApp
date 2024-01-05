import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:to_do_app/util/my_buttons.dart';

class DialogBox extends StatelessWidget {
  final textconroller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({
    super.key,
    required this.textconroller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[200],
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //Get user Input
            TextField(
              controller: textconroller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                // labelText: 'Enter your Task',
                hintText: 'Enter your Task',
              ),
            ),

            //Button to add the task
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //Save Button
                MyButton(text: "Save", onPressed: onSave),

                //Cancel Button
                MyButton(text: "Cancel", onPressed: onCancel),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
