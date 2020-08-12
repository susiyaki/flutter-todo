import 'package:flutter/material.dart';
import 'package:todo_app/app.dart';

void main() {
  runApp(TodoApp());
}


class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: RootWidget(),
    );
  }
}
