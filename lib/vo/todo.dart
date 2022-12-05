


import 'package:flutter/material.dart';

class Todo extends ChangeNotifier{

  int id=0;
  int userId=0;
  String title='';
  bool completed=false;



  Todo({
    this.id=0,
    this.userId=0,
    this.title='',
    this.completed=false
  });



  factory Todo.fromJson(Map<String, dynamic> map){
    return Todo(
      id: map['id'],
      userId: map['userId'],
      title: map['title'],
      completed: map['completed']
    );
  }


}