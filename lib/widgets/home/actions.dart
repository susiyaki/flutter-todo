import 'package:flutter/material.dart';

class HomeActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          children: [Icon(Icons.search, size: 26), Text('Search for todo')],
        ),
        IconButton(
            icon: Icon(Icons.sort, size: 26),
            onPressed: () {
              print('filter');
            })
      ]),
    ));
  }
}
