import 'package:flutter/material.dart';
import 'package:todo_app/screens/top.dart';
import 'package:todo_app/screens/archive.dart';

class RootWidget extends StatefulWidget {
  @override
  _RootWidget createState() => _RootWidget();
}

class _RootWidget extends State<RootWidget> {
  int _currentTab = 0;

  List<Widget> _widgetOptions = <Widget>[TopPage(), ArchivePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _widgetOptions.elementAt(_currentTab),
        bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.dock), title: SizedBox.shrink()),
              BottomNavigationBarItem(
                  icon: Icon(Icons.done), title: SizedBox.shrink())
            ],
            currentIndex: _currentTab,
            onTap: (int index) {
              setState(() {
                _currentTab = index;
              });
            }));
  }
}
