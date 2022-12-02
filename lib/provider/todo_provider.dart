

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../vo/todo.dart';
class TodoProvider extends ChangeNotifier{

  Todo todo = Todo();
  List<Todo> todoList = [];

  int id=0;
  int userId=0;
  String title='';
  bool completed=false;



  void getTodoListFromServer() async{
    todoList=[];
    Uri url = Uri.parse('https://jsonplaceholder.typicode.com/todos/');
    var response = await http.get(url);
    var listMap = jsonDecode(response.body);

    for(int i=0;i<listMap.length;i++){
      var map = listMap[i];
      Todo t = Todo.fromJson(map);
      todoList.add(t);
    }
    notifyListeners();
  }


  void getTodoFromServer_vo() async{
    Uri url = Uri.parse('https://jsonplaceholder.typicode.com/todos/1');
    var response = await http.get(url);
    var map  = jsonDecode(response.body);
    todo = Todo.fromJson(map);

    notifyListeners();
  }



  void getTodoFromServer() async{
    Uri url = Uri.parse('https://jsonplaceholder.typicode.com/todos/1');
    var response = await http.get(url);
    var map  = jsonDecode(response.body);

    id= map['id'];
    userId=map['userId'];
    title=map['title'];
    completed=map['completed'];

    notifyListeners();
  }

}

