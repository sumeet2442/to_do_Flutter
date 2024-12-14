// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:to_do_app/Components/dialog_box.dart';
import 'package:to_do_app/Components/todo_tile.dart';
import 'package:to_do_app/Data/database.dart';

class Todo extends StatefulWidget {
  const Todo({super.key});

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  final _myBox = Hive.box('hiveBox');
  ToDoDatabase db = ToDoDatabase();

  final _textController = TextEditingController();

  @override
  void initState() {
    if (db.toDoList.isEmpty) {
      Center(
        child: Text(
          "Please add a task to Begin!",
          style: TextStyle(fontSize: 16, color: Colors.black54),
        ),
      );
    } else {
      db.loadData();
    }
    super.initState();
  }

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateData();
  }

  void saveNewTask() {
    setState(() {
      db.toDoList.add([_textController.text, false]);
      _textController.clear();
    });
    Navigator.of(context).pop();
    db.updateData();
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          textController: _textController,
          onSave: saveNewTask,
          onCancel: Navigator.of(context).pop,
        );
      },
    );
  }

  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 8,
        shadowColor: Colors.black38,
        centerTitle: true,
        title: Text(
          "Todo Tasks",
          style: TextStyle(
              fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white54),
        ),
      ),
      backgroundColor: Colors.indigo[400],
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white54,
        splashColor: Colors.red[400],
        child: Icon(Icons.add),
      ),
      /*part of the static List already existing in the application
         children: [
          TodoTile(
            taskName: "Bhaang Piyo",
            taskCompleted: true,
            onChanged: (p0) {},
          ),
          TodoTile(
            taskName: "Bhaang Piliya",
            taskCompleted: false,
            onChanged: (p0) {},
          ),
        ],*/

      //the code commented below doesn't show anything if the list is empty
      /* 
      body: ListView.builder(
            itemCount: toDoList.length,
            itemBuilder: (context, index) {
              if (toDoList.length == 0) {
                setState(() {
                  Center(
                    child: Text("Please add a new task to Begin!"),
                  );
                });
              }
              return TodoTile(
                taskName: toDoList[index][0],
                taskCompleted: toDoList[index][1],
                onChanged: (value) => checkBoxChanged(value, index),
                deleteFunc: (context) => deleteTask(index),
              );
            })*/
      // below is the code add default text if the list is empty
      body: db.toDoList.isEmpty
          ? Center(
              child: Text(
                "Please add a task to Begin!",
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
            )
          : ListView.builder(
              itemCount: db.toDoList.length,
              itemBuilder: (context, index) {
                return TodoTile(
                  taskName: db.toDoList[index][0],
                  taskCompleted: db.toDoList[index][1],
                  onChanged: (value) => checkBoxChanged(value, index),
                  deleteFunc: (context) => deleteTask(index),
                );
              },
            ),
    );
  }
}
