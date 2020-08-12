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
              return TodoItem(
                  title: widget.todos[index].title,
                  description: widget.todos[index].description);
            },
            itemCount: widget.todos.length));
  }
}

class TodoItem extends StatefulWidget {
  final String title;
  final String description;

  TodoItem({Key key, this.title, this.description}) : super(key: key);

  @override
  _TodoItem createState() => _TodoItem();
}

class _TodoItem extends State<TodoItem> {
  var open = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(width: 0.2, color: Colors.grey))),
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  open = !open;
                });
              },
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.title,
                        style: TextStyle(
                            fontSize: 18,
                            letterSpacing: 0.8,
                            fontWeight: FontWeight.w500)),
                    open
                        ? Icon(Icons.arrow_drop_down)
                        : Icon(Icons.arrow_drop_up)
                  ],
                ),
                open
                    ? Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: Text(widget.description))
                    : Container()
              ]),
            )));
  }
}
