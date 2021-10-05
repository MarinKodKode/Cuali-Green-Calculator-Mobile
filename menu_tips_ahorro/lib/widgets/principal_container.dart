import 'package:flutter/material.dart';
import 'package:menu_tips_ahorro/widgets/tips.dart';

class PrincipalContainer extends StatelessWidget {
  const PrincipalContainer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //Contenedor verde principal
    return Scaffold(
        backgroundColor: Colors.grey[250],
        body: Container(
          decoration: BoxDecoration(
            color: Colors.lightGreen,
            borderRadius: BorderRadius.circular(12),
          ),
          margin:
              const EdgeInsets.only(top: 40, left: 14, right: 14, bottom: 80),
          child: const Tips(),
        ));
  }
}
