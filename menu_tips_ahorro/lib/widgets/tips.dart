import 'package:flutter/material.dart';

class Tips extends StatefulWidget {
  const Tips({Key? key}) : super(key: key);
  @override
  _TipsState createState() => _TipsState();
}

class _TipsState extends State<Tips> {
  //const EjemColumn({Key? key}) : super(key: key);
  int selectedItemIndex = 0;

  @override
  Widget build(BuildContext context) {
    //widgets secundarios
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        buildTextTipAhorro(Colors.lightGreen, 350.0, 50.0, 'Tips de Ahorro'),
        buildCajaTip(0, Colors.white, 350.0, 50.0, 'Texto 1'),
        buildCajaTip(1, Colors.white, 350.0, 50.0, 'Texto 2'),
        buildCajaTip(2, Colors.white, 350.0, 50.0, 'Texto 3'),
        buildCajaTip(3, Colors.white, 350.0, 50.0, 'Texto 4'),
        buildCajaTip(4, Colors.white, 350.0, 50.0, 'Texto 5'),
        buildCajaTip(5, Colors.white, 350.0, 50.0, 'Texto 6'),
      ],
    );
  }

  Widget buildTextTipAhorro(
      Color color, double ancho, double largo, String text) {
    return Column(
      children: [
        Container(
          width: ancho,
          height: largo,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/png/icon_hoja.png'),
                Text(text,
                    style: const TextStyle(color: Colors.white, fontSize: 35)),
              ]),
          margin:
              const EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 15),
        )
      ],
    );
  }

/*Widget buildCajaTip(Color color, double ancho, double largo, String text) {
  return Column(
    children: [
      Container(
        width: ancho,
        height: largo,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Image.asset('assets/png/icon_hoja.png'),
              Text(text,
                  style: const TextStyle(color: Colors.black, fontSize: 25)),
              //Circulo con número
              Image.asset('assets/png/icon_hoja.png'),
            ]),
        margin: const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
      )
    ],
  );
}*/

  Widget buildCajaTip(
      int index, Color color, double ancho, double largo, String text) {
    return GestureDetector(
        onTap: () {
          setState(() {
            selectedItemIndex = index;
          });
        },
        child: Container(
          width: ancho,
          height: largo,
          decoration: BoxDecoration(
            //color: color,
            borderRadius: BorderRadius.circular(15),

            //EFECTO AL SELECCIONAR UN ITEM
            //El color del icono y el circulo cambiaran dependiendo del Item selecionado
            color: index == selectedItemIndex
                ? Colors.lightGreen[100]
                : Colors.white,
            /*boxShadow: index == selectedItemIndex
                ? [
                    const BoxShadow(
                        color: Colors.grey, blurRadius: 10, spreadRadius: 1)
                  ]
                : [],*/
          ),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Image.asset('assets/png/icon_hoja.png'),
                Text(text,
                    style: const TextStyle(color: Colors.black, fontSize: 25)),
                //Circulo con número
                Image.asset('assets/png/icon_num.png'),
              ]),
          margin:
              const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
        ));
  }
}
