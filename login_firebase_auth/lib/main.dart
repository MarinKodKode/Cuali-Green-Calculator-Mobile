// ignore_for_file: deprecated_member_use, must_be_immutable
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'routes/my_routes.dart';

//void main() => runApp(MyApp());

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

/*void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: "/home",
    navigatorKey: Get.key,
    getPages: routes(),
  ));
}*/

class MyApp extends StatelessWidget {
  //verde bajo
  Color _primaryColor = HexColor('#52E472');
  //verde fuerte
  Color _accentColor = HexColor('#309246');

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: _primaryColor,
        accentColor: _accentColor,
        scaffoldBackgroundColor: Colors.grey.shade100,
        primarySwatch: Colors.grey,
      ),
      initialRoute: "/login",
      navigatorKey: Get.key,
      getPages: routes(),
      //home: LoginPage(),
    );
  }
}
