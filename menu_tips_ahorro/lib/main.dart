import 'package:menu_tips_ahorro/widgets/principal_container.dart';
//import 'package:menu_tips_ahorro/widgets/tips_ahorro.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PrincipalContainer(),
    );
  }
}
