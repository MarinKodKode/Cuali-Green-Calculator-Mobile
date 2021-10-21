import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NextPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NextPageState();
  }
}

class _NextPageState extends State<NextPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Text(
          'Autenticacion Completa',
        ));
  }
}
