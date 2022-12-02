import 'package:flutter/material.dart';
import 'package:flutter_restapi/provider/todo_provider.dart';
import 'package:flutter_restapi/screen/home_screen.dart';
import 'package:flutter_restapi/screen/list_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>TodoProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ListScreen()
      ),
    );
  }
}

