import 'package:flutter/material.dart';
import 'dart:math';

class Constants {
  static const Color primaryColor = Color.fromRGBO(86, 215, 188, 1);
  static Color get randownColor =>
      Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
}
