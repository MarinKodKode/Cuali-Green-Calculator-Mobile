import 'package:flutter/material.dart';
import 'package:sugerencias_pro/widgets/contenedor_t.dart';

import 'contants.dart';

class ItemProd extends StatelessWidget {
  final String image;
  final String price;
  final String name;
  final String descripcion;

  ItemProd(
      {required this.image,
      required this.price,
      required this.name,
      required this.descripcion});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Stack(
        children: <Widget>[
          Container(
            alignment: Alignment.bottomLeft,
            margin: const EdgeInsets.all(10.0),
            width: 400,
            height: 130.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: <Color>[
                    Constants.randownColor,
                    Color.fromRGBO(250, 235, 215, 100),
                  ]),
            ),
            child: contenido(),
          ),
        ],
      ),
    );
  }

  Widget contenido() {
    return Row(
      children: <Widget>[
        SizedBox(width: 20.0),
        Image.network(
          image,
          width: 75,
        ),
        SizedBox(
          height: 20.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 10.0,
            ),
            ContenedorT(
              text: price,
              color1: Colors.black,
              size: 20.0,
              tamano: 250,
            ),
            ContenedorT(
              text: descripcion,
              color1: Colors.black,
              size: 20.0,
              tamano: 250,
            ),
            ContenedorT(
              text: name,
              color1: Colors.black,
              size: 20.0,
              tamano: 250,
            ),
          ],
        ),
      ],
    );
  }

  void _onTap() {
    int i = 1;
    i = i + 1;
    print("hi: $i");
  }
}
