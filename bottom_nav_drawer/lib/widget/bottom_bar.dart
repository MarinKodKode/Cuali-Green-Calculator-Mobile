// ignore_for_file: prefer_const_constructors, duplicate_ignore
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  //Indice del Item seleccionado
  int selectedItemIndex = 2;
  @override
  Widget build(BuildContext context) {
    //Contenedor de los Items del bottom navigation
    return Scaffold(
      backgroundColor: Colors.grey[200],
      bottomNavigationBar: Container(
        height: 70,
        color: Colors.white,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
              boxShadow: [
                BoxShadow(
                    blurRadius: 20,
                    color: Colors.grey.shade100,
                    spreadRadius: 1)
              ]),
          child: Row(
            //Espacio entre los items
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //Botón de grafica
              buildContainerBottomNav(
                  ImageIcon(
                    AssetImage("assets/png/icon_graph.png"),
                    color: Color(0xFF3A5A98),
                  ),
                  0),
              //Botón de inicio o home
              buildContainerBottomNav(
                  ImageIcon(
                    AssetImage("assets/png/icon_home.png"),
                    color: Color(0xFF3A5A98),
                  ),
                  1),
              //Botón de perfil de usuario
              buildContainerBottomNav(
                  ImageIcon(
                    AssetImage("assets/png/icon_profile.png"),
                    color: Color(0xFF3A5A98),
                  ),
                  2),
              //Botón de tienda
              buildContainerBottomNav(
                  ImageIcon(
                    AssetImage("assets/png/icon_shop.png"),
                    color: Color(0xFF3A5A98),
                  ),
                  3),
              //Botón de tips/consejos
              buildContainerBottomNav(
                  ImageIcon(
                    AssetImage("assets/png/icon_tip.png"),
                    color: Color(0xFF3A5A98),
                  ),
                  4),
            ],
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget buildContainerBottomNav(ImageIcon Icono, int index) {
    //Se detecta el gesto realizado sobre un Item del Navigation Bar
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedItemIndex = index;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          //El color del icono y el circulo cambiaran dependiendo del Item selecionado
          color: index == selectedItemIndex ? Colors.lightGreen : Colors.white,
          shape: BoxShape.circle,
          // ignore: prefer_const_literals_to_create_immutables
          // ignore: prefer_const_constructors
          boxShadow: index == selectedItemIndex
              ? [BoxShadow(color: Colors.grey, blurRadius: 10, spreadRadius: 1)]
              : [],
        ),
        height: 70,
        width: 50,
        child: ImageIcon(AssetImage("assets/png/icon_tip.png"),
            //color de la sombra gris que rodea al circulo del item seleccionado
            //tambien cambiara
            color:
                index == selectedItemIndex ? Colors.white : Colors.grey[500]),
      ),
    );
  }
}
