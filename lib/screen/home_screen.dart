import 'package:flutter/material.dart';
import 'package:flutter_restapi/provider/todo_provider.dart';

import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {



  void getTodoFromServer() async{
    Uri url = Uri.parse('https://jsonplaceholder.typicode.com/todos/1');
    var response = await http.get(url);
    print(response.body);
  }
  
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Provider.of<TodoProvider>(context,listen: false).getTodoFromServer_vo();


    
  }

  @override
  Widget build(BuildContext context) {

    TextStyle ts = TextStyle(fontSize: 20);

    return Scaffold(
      appBar: AppBar(
        title: Text('TODO rest api'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Consumer<TodoProvider>(builder: (context,todoProvider,child){
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('${todoProvider.todo.id}',style: ts,),
              Text('${todoProvider.todo.userId}',style: ts,),
              Text('${todoProvider.todo.title}',style: ts,),
              Text('${todoProvider.todo.completed}',style: ts,)

            ],
          );
        },)
      ),
    );
  }
}
