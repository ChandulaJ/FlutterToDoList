import 'package:flutter/material.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  //text editing controller
  TextEditingController myController = TextEditingController();
  String greetingMessage = "";

  //greet user mtd
  void greetUser() {
    setState(() {
      greetingMessage = "Hello, " + myController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: myController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Type your name: ",
              ),
            ),
            ElevatedButton(onPressed: greetUser, child: Text("Tap")),
            Text(greetingMessage)
          ],
        ),
      ),
    ));
  }
}
