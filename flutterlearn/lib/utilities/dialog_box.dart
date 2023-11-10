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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      alignment: Alignment.bottomCenter,
      insetPadding: EdgeInsets.all(0.0),
      backgroundColor: Colors.blue[100],
      content: Container(
        width: MediaQuery.of(context).size.width,
        height: 110.0,
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(hintText: "Add a new task"),
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(
                    buttonName: "Save",
                    onPressed: onSave,
                    icon: Icon(Icons.check)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
