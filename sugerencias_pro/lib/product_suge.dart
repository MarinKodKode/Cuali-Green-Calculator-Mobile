import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:sugerencias_pro/widgets/contenedor_t.dart';
import 'package:sugerencias_pro/widgets/item_prod.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:sugerencias_pro/productos.dart';

class productSuge extends StatefulWidget {
  @override
  _productSugeState createState() => _productSugeState();
}

class _productSugeState extends State<productSuge> {
  // ignore: deprecated_member_use
  List<Productos> data = <Productos>[];

  Future<List<Productos>> readJson() async {
    var url =
        'https://scientistic-investi.000webhostapp.com/Sistemas/productos.json';
    var response =
        await http.post(Uri.parse(url)).timeout(Duration(seconds: 90));
    var productos = jsonDecode(response.body);
    var registros = <Productos>[];
    for (productos in productos) {
      registros.add(Productos.fromJson(productos));
    }
    return registros;
  }

  @override
  void initState() {
    super.initState();
    readJson().then((value) {
      setState(() {
        data.addAll(value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Container(
        margin: const EdgeInsets.all(5.0),
        width: 400,
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
          color: Colors.white,
        ),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            ContenedorT(
                text: 'Productos sugeridos',
                color1: Color.fromRGBO(25, 25, 112, 12),
                size: 30,
                tamano: 300),
            SizedBox(height: 10.0),
            Expanded(
              child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ItemProd(
                        image: data[index].image,
                        price: data[index].price,
                        name: data[index].name,
                        descripcion: data[index].descripcion);
                  }),
            )
          ],
        ),
      ),
    );
  }
}
