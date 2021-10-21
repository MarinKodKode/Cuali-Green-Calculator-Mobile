// ignore_for_file: await_only_futures, unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:google_sign_in/google_sign_in.dart';

class RegisterLoginController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final formKey = GlobalKey<FormState>();

  //variables para capturar informacion de usuario
  final nameController = TextEditingController();
  final lastnameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final vPasswordController = TextEditingController();

  late bool success;
  late String userEmail;

  void dispose() {
    nameController.dispose();
    lastnameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    vPasswordController.dispose();
    super.dispose();
  }

  void register() async {
    final User? user = (await _auth.createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text))
        .user;
    if (user != null) {
      success = true;
      print('Registro exitoso');
      Future.delayed(
        Duration(seconds: 2),
        () {
          Get.toNamed("/nextpage");
        },
      );
      userEmail = user.email!;
    } else {
      success = false;
    }
  }
}
