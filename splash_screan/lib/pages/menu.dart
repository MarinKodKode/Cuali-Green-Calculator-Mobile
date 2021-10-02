import 'package:flutter/material.dart';

class menu extends StatefulWidget {
  menu({Key? key}) : super(key: key);

  @override
  _menuState createState() => _menuState();
}

class _menuState extends State<menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Text("Home"),
      ),
    );
  }
}
