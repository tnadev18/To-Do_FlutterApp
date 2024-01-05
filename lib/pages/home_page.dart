import 'package:flutter/material.dart';
import 'package:to_do_app/Data/database.dart';
import 'package:to_do_app/util/dialogbox.dart';
import 'package:to_do_app/util/todo_tile.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //reference the Box
  final _box = Hive.box('todo');

  //text controller
  final _textconroller = TextEditingController();

// todo list
  ToDoDatabase db = ToDoDatabase();

  @override
  void initState() {
    // TODO: implement initState
    // if this is first time erver opining the app then create default data
    if (_box.isEmpty) {
      db.createInitialData();
      db.updateDataBase();
    } else {
      db.loadData();
    }

    super.initState();
  }

//check box was tapped
  void CheckBoxChange(bool? Value, int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updateDataBase();

  }

  // create new task
  void CreateNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          textconroller: _textconroller,
          onSave: () {
            setState(() {
              db.todoList.add([_textconroller.text, false]);
              _textconroller.clear();
            });
            Navigator.pop(context);
          },
          onCancel: () {
            Navigator.pop(context);
          },
        );
      },
    );
      db.updateDataBase();

  }

  //delete Tasks
  void deleteTask(int index) {
    setState(() {
      db.todoList.removeAt(index);
    });
      db.updateDataBase();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: const Text('To Do'),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (CreateNewTask),
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.todoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            task: db.todoList[index][0],
            isDone: db.todoList[index][1],
            onChanged: (value) => CheckBoxChange(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
