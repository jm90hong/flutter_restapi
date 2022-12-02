import 'package:flutter/material.dart';
import 'package:flutter_restapi/provider/todo_provider.dart';
import 'package:provider/provider.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<TodoProvider>(context,listen: false).getTodoListFromServer();
  }

  Widget buildTodo({
      required int userId,
      required String title,
      required bool isCompleted
    }){

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      color: Colors.white,
      width: double.infinity,
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('$userId'),
              Container(
                  width: 300,
                  child: Text(title,overflow: TextOverflow.ellipsis,)
              )
            ],
          ),
          isCompleted ? Text('완료') : Text('미완료')
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('List Screen'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Consumer<TodoProvider>(builder: (context, todoProvider, child){
            return Column(
              children: todoProvider.todoList.map((e) => buildTodo(
                title: e.title,
                userId: e.userId,
                isCompleted: e.completed
              )).toList(),
            );
          },),
        )
      ),
    );
  }
}



