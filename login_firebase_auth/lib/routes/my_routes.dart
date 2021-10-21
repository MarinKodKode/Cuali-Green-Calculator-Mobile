//import 'package:flutter_login_ui/controller/food_page.dart';
import 'package:flutter_login_ui/pages/forgot_password_page.dart';
import 'package:flutter_login_ui/pages/forgot_password_verification_page.dart';
//import 'package:flutter_login_ui/pages/home_page.dart';
import 'package:flutter_login_ui/pages/login_page.dart';
import 'package:flutter_login_ui/pages/next_page.dart';
import 'package:flutter_login_ui/pages/registration_page.dart';
//import 'package:flutter_login_ui/pages/next_page.dart';
import 'package:get/route_manager.dart';

routes() => [
      GetPage(name: "/registration", page: () => RegistrationPage()),
      GetPage(name: "/forgotpassword", page: () => ForgotPasswordPage()),
      GetPage(name: "/login", page: () => LoginPage()),
      GetPage(
          name: "/verificationpage",
          page: () => ForgotPasswordVerificationPage()),
      GetPage(
          name: "/nextpage",
          page: () => NextPage(),
          transition: Transition.zoom),
    ];
