import 'package:hive_flutter/hive_flutter.dart';


class ToDoDatabase{
  List todoList = [];  


  // reference the box 
 final _box = Hive.box('todo');

 //run this methode if this first time ever opening this app
 void createInitialData() {
   todoList = [
     ['Do Exercise', false],
     ['DO HW', false],
   ];
 }

 //load the data from the DB
 void loadData() {
   todoList = _box.get('ToDoList') ?? [];
 }

 //save the data to the DB
 void updateDataBase(){
 _box.put('ToDoList', todoList);
 }
}