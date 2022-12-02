import 'package:flutter/material.dart';



class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Screen'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [

          ],
        ),
      )
    );
  }
}
