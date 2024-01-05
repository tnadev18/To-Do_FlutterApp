import 'package:flutter/material.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
// text editing controller to get access to the text entered by the user
  TextEditingController Mycontroller = TextEditingController();

// methode to greet the user
  void greetUser() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Hello ${Mycontroller.text}'),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text field to enter the task
            TextField(
              controller: Mycontroller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter your Name',
                hintText: 'Enter your Name',
              ),
            ),
            // Button to add the task
            ElevatedButton(onPressed: greetUser, child: Text('tap me'))
          ],
        ),
      ),
    ));
  }
}
