import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/widgets/todo_item.dart';

class TodoList extends StatefulWidget {
  // immutableなwidgetなので、finalで固定
  final List<Todo> todos;
  final void Function(int index, Todo todo) archiveTodo;
  final void Function(int index, Todo todo) unarchiveTodo;

  // todosを受け取ってセット
  TodoList({Key key, this.todos, this.archiveTodo, this.unarchiveTodo})
      : super(key: key);

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
              // Dismissible -> swipe削除を提供してくれる
              return Dismissible(
                background: stackBehindDismiss(),
                key: ObjectKey(widget.todos[index].id),
                child: TodoItem(
                    title: widget.todos[index].title,
                    description: widget.todos[index].description),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) {
                  var todo = widget.todos.elementAt(index);

                  widget.archiveTodo(index, todo);

                  // 削除と同時に画面下にundoのアクションを描画
                  Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text("Todo archived"),
                      action: SnackBarAction(
                          label: "UNDO",
                          onPressed: () {
                            widget.unarchiveTodo(index, todo);
                          })));
                },
              );
            },
            itemCount: widget.todos.length));
  }
}

Widget stackBehindDismiss() {
  return Container(
    alignment: Alignment.centerRight,
    padding: EdgeInsets.only(right: 20.0),
    color: Colors.red,
    child: Icon(
      Icons.delete,
      color: Colors.white,
    ),
  );
}
