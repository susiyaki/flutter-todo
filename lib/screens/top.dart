import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:todo_app/widgets/actions.dart';
import 'package:todo_app/widgets/todo_list.dart';
import 'package:todo_app/models/todo.dart';

class TopPage extends StatefulWidget {
  @override
  _TopPage createState() => _TopPage();
}

class _TopPage extends State<TopPage> {
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

  void archiveTodo(int index, Todo todo) async {
    var todoId = todo.id;

    todo.done = true;
    var response = await http.put('http://localhost:3000/api/v1/todos/$todoId',
        headers: {"Content-Type": "application/json"},
        body: json.encode(todo.toJson()));

    if (response.statusCode == 200) {
      setState(() {
        todos.removeAt(index);
      });
    }
  }

  void unarchiveTodo(int index, Todo todo) async {
    todo.done = false;
    var response = await http.put('http://localhost:3000/api/v1/todos/$index',
        headers: {"Content-Type": "application/json"},
        body: json.encode(todo.toJson()));

    if (response.statusCode == 200) {
      setState(() {
        todos.insert(index, todo);
      });
    }
  }

  void addTodo() async {
    var todo = new Todo(title: 'flutter3', description: 'desc', done: false);
    var response = await http.post('http://localhost:3000/api/v1/todos',
        headers: {"Content-Type": "application/json"},
        body: json.encode(todo.toJson()));

    if (response.statusCode == 200) {
      setState(() {
        todos.insert(todos.length, todo);
      });
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
        title: Text('Todo List', style: TextStyle(color: Colors.white)),
      ),
      body: Column(
        children: [
          FilterActions(),
          TodoList(
            todos: todos
                .where(
                  (todo) => !todo.done,
                )
                .toList(),
            archiveTodo: archiveTodo,
            unarchiveTodo: unarchiveTodo,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            print('tapped');
            addTodo();
          },
          backgroundColor: Colors.green,
          child: Icon(Icons.add)),
    );
  }
}
