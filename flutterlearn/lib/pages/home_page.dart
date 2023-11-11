import "package:flutter/material.dart";
import "package:flutterlearn/data/database.dart";
import "package:flutterlearn/pages/weather_page.dart";
import "package:flutterlearn/utilities/dialog_box.dart";
import "package:flutterlearn/utilities/todoTile.dart";
import "package:hive/hive.dart";

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _controller = TextEditingController();
  final _mybox = Hive.box("mybox");
  ToDoDatabase db = ToDoDatabase();

  @override
  void initState() {
    // if first time ever opening the app
    if (_mybox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.todolist[index][1] = !db.todolist[index][1];
    });
    db.updateData();
  }

  void saveNewTask() {
    setState(() {
      db.todolist.add([_controller.text, false]);
    });
    Navigator.of(context).pop();
    _controller.clear();
    db.updateData();
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onCancel: () {
            Navigator.of(context).pop();
          },
          onSave: saveNewTask,
        );
      },
    );
  }

  void deleteTask(int index) {
    setState(() {
      db.todolist.removeAt(index);
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        elevation: 0.0,
        title: Center(
          child: Text('TO DO'),
        ),
      ),
      body:

      ListView.builder(
        itemCount: db.todolist.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: db.todolist[index][0],
            taskCompleted: db.todolist[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),



      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),

    );
  }
}
