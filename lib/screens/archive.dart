import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:todo_app/widgets/actions.dart';
import 'package:todo_app/widgets/todo_list.dart';
import 'package:todo_app/models/todo.dart';

class ArchivePage extends StatefulWidget {
  @override
  _ArchivePage createState() => _ArchivePage();
}

class _ArchivePage extends State<ArchivePage> {
  // 空配列で初期化
  List<Todo> todos = [];

  void fetchTodo() async {
    var response = await http.get('http://localhost:3000/api/v1/todos');

    if (response.statusCode == 200) {
      setState(() {
        List list = json.decode(response.body);

        var _data = list.map((value) {
          return Todo.fromJson(value);
        }).toList();

        todos = _data;
      });
    } else {
      throw Exception('Could not load todos');
    }
  }

  @override
  initState() {
    super.initState();
    fetchTodo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Archived Todos', style: TextStyle(color: Colors.white)),
      ),
      body: Column(
        children: [
          FilterActions(),
          TodoList(todos: todos.where((todo) => !todo.done).toList()),
        ],
      ),
    );
  }
}
