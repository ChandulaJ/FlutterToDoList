import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterlearn/utilities/my_button.dart';

class DialogBox extends StatelessWidget {
  VoidCallback onSave;
  VoidCallback onCancel;

  final controller;

  DialogBox({
    super.key,
    required this.controller,
    required this.onCancel,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blueAccent,
      content: Container(
        height: 120.0,
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Add a new task"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(
                    buttonName: "Save",
                    onPressed:
                    onSave,

                    icon: Icon(Icons.check)),
                SizedBox(
                  width: 4.0,
                ),
                MyButton(
                    buttonName: "Cancel",
                    onPressed:
                    onCancel
                    ,
                    icon: Icon(Icons.close))
              ],
            )
          ],
        ),
      ),
    );
  }
}
