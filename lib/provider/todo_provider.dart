

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
class TodoProvider extends ChangeNotifier{

  int id=0;
  int userId=0;
  String title='';
  bool completed=false;


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

