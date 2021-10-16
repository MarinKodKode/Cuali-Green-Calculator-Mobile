import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContenedorT extends StatelessWidget {
  final String text;
  final Color color1;
  final double size;
  final double tamano;
  ContenedorT(
      {required this.text,
      required this.color1,
      required this.size,
      required this.tamano});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.bottomCenter,
        margin: const EdgeInsets.all(3.0),
        width: tamano,
        child: Text(
          text,
          style: GoogleFonts.lato(
              textStyle: TextStyle(
            color: color1,
            fontSize: size,
          )),
        ));
  }
}
