import 'package:flutter/material.dart';
import 'package:to_do_app/pages/home_page.dart';
import 'package:to_do_app/pages/todo_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  //init the hive
  await Hive.initFlutter();

  //open the box
  var box = await Hive.openBox('todo'); 


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: HomePage(),
        theme: ThemeData(
          primarySwatch: Colors.yellow,
        ));
  }
}
