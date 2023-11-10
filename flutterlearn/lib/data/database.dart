import 'package:hive/hive.dart';

class ToDoDatabase {
  List todolist = [];

  //reference the box
  final _mybox = Hive.box("mybox");

//if this is the first time ever opening the app
  void createInitialData() {
    todolist = [
      ["My first task", false],
      ["My completed task", true]
    ];
  }

//load the data from database
  void loadData() {
    todolist = _mybox.get("TODOLIST");
  }

  //update data
  void updateData() {
    _mybox.put("TODOLIST", todolist);
  }
}
