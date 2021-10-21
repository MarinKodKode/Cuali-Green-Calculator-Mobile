import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_login_ui/common/theme_helper.dart';
//import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
//import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import 'login_page.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  //verde bajo
  Color _primaryColor = HexColor('#52E472');
  //verde fuerte
  Color _accentColor = HexColor('#309246');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: _primaryColor,
        // ignore: deprecated_member_use
        accentColor: _accentColor,
        scaffoldBackgroundColor: Colors.grey.shade100,
        primarySwatch: Colors.grey,
      ),
      home: LoginPage(),
    );
  }
}
