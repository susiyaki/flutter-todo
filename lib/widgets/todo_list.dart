import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart';

class TodoList extends StatefulWidget {
  // immutableなwidgetなので、finalで固定
  final List<Todo> todos;

  // todosを受け取ってセット
  TodoList({Key key, this.todos}) : super(key: key);

  @override
  _TodoList createState() => _TodoList();
}

class _TodoList extends State<TodoList> {
  @override
  Widget build(BuildContext contest) {
    // Flexibleで囲むことでColumnの中でもListViewを使用可能
    return Flexible(
        child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return Container(
                color: Colors.grey,
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                    child: Row(
                      children: [
                        Text(widget.todos[index].id.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 18)),
                        SizedBox(width: 10),
                        Text(widget.todos[index].title,
                            style: TextStyle(
                              fontSize: 18,
                            )),
                      ],
                    )),
              );
            },
            itemCount: widget.todos.length));
  }
}
