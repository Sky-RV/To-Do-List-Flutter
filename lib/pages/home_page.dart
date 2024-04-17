import 'package:flutter/material.dart';
import 'package:flutterproject/util/dialog_box.dart';
import 'package:flutterproject/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // text controller
  final _controller = TextEditingController();

  // list of to do tasks
  List toDoList = [
    ["Task Name", false],
    ["Task Name 1", false],
    ["Task Name 2", false],
  ];

  // checkbox was tapped
  void checkBoxChanged(bool? value, int index){
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  // save a task
  void saveNewTask(){
    setState(() {
      toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  // create a new task
  void createNewTask(){
    showDialog(
        context: context,
        builder: (context){
          return DialogBox(
            controller: _controller,
            onSave: saveNewTask,
            onCancel: () => Navigator.of(context).pop(),
          );
        }
    );
  }

  // delete task
  void deleteTask(int index){
    setState(() {
      toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        title: Text("To Do"),
        centerTitle: true,
        backgroundColor: Colors.amber,
        elevation: 0, // remove app bar shadow
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
        backgroundColor: Colors.amber,
      ),

      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index){
          return ToDoTile(
              taskName: toDoList[index][0],
              taskCompleted: toDoList[index][1],
              onChanged: (value) => checkBoxChanged(value, index),
              // deleteFunction: (context) => deleteTask(index),
          );
        },
      ),

      // body: ListView(
      //   children: [
      //     ToDoTile(
      //       taskName: "Make Tutorial",
      //       taskCompleted: true,
      //       onChanged: (p0){}, // do nothing right now
      //     ),
      //     ToDoTile(
      //       taskName: "Do Exercise",
      //       taskCompleted: false,
      //       onChanged: (p0){}, // do nothing right now
      //     ),
      //   ],
      // ),
    );
  }
}
