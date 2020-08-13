import 'package:flutter/material.dart';

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
    return GestureDetector(
        onTap: () {
          setState(() {
            open = !open;
          });
        },
        child: Container(
            decoration: BoxDecoration(
                border:
                    Border(bottom: BorderSide(width: 0.2, color: Colors.grey))),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(widget.title,
                          style: TextStyle(
                              fontSize: 18,
                              letterSpacing: 0.8,
                              fontWeight: FontWeight.w500)),
                    ),
                    open
                        ? Icon(Icons.arrow_drop_down)
                        : Icon(Icons.arrow_drop_up)
                  ],
                ),
                open
                    ? Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Row(children: [
                          Expanded(
                            child: Text(widget.description),
                          )
                        ]))
                    : Container()
              ]),
            )));
  }
}
