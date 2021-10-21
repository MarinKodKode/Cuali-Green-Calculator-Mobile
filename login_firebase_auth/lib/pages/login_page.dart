// ignore_for_file: deprecated_member_use
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_ui/common/theme_helper.dart';
import 'package:flutter_login_ui/controller/login_controller.dart';
import 'package:flutter_login_ui/validations/validations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'widgets/header_widget.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //controllador
  final controller = Get.put(LoginController());
  final _formKey = GlobalKey<FormState>();

  double _headerHeight = 250;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: GetBuilder<LoginController>(
            init: LoginController(),
            builder: (_) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: _headerHeight,
                      child: HeaderWidget(
                          _headerHeight,
                          true,
                          Icons
                              .login_rounded), //let's create a common header widget
                    ),
                    SafeArea(
                      child: Container(
                          padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                          margin: EdgeInsets.fromLTRB(
                              20, 0, 20, 10), // This will be the login form
                          child: Column(
                            children: [
                              Text(
                                'Cuali',
                                style: TextStyle(
                                    fontSize: 60, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Inicia sesión en tu cuenta',
                                style: TextStyle(color: Colors.grey),
                              ),
                              SizedBox(height: 30.0),
                              Form(
                                  key: _formKey,
                                  child: Column(
                                    children: [
                                      Container(
                                        child: TextFormField(
                                            //controlador email
                                            controller:
                                                controller.emailController,
                                            decoration: ThemeHelper()
                                                .textInputDecoration('Email',
                                                    'Ingresa tu email'),
                                            validator: (text) {
                                              if (text == null) return null;
                                              return isValidEmail(text)
                                                  ? null
                                                  : "Dirección de correo electrónico inválida";
                                            }),
                                        decoration: ThemeHelper()
                                            .inputBoxDecorationShaddow(),
                                      ),
                                      SizedBox(height: 30.0),
                                      Container(
                                        child: TextFormField(
                                          //controlador password
                                          controller:
                                              controller.passwordController,
                                          obscureText: true,
                                          decoration:
                                              ThemeHelper().textInputDecoration(
                                            'Contraseña',
                                            'Ingresa tu contraseña',
                                          ),
                                          validator: (text) {
                                            if (text == null) return null;
                                            if (text.trim().length >= 8) {
                                              return null;
                                            }
                                            return "La contraseña debe tener mínimo 8 digitos";
                                          },
                                        ),
                                        decoration: ThemeHelper()
                                            .inputBoxDecorationShaddow(),
                                      ),
                                      SizedBox(height: 15.0),
                                      Container(
                                        margin:
                                            EdgeInsets.fromLTRB(10, 0, 10, 20),
                                        alignment: Alignment.topRight,
                                        child: GestureDetector(
                                          onTap: () {
                                            Get.toNamed('/forgotpassword');
                                            /*Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ForgotPasswordPage()),
                                    );*/
                                          },
                                          child: Text(
                                            "¿Olvidaste tu contraseña?",
                                            style: TextStyle(
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        decoration: ThemeHelper()
                                            .buttonBoxDecoration(context),
                                        child: ElevatedButton(
                                          style: ThemeHelper().buttonStyle(),
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                40, 10, 40, 10),
                                            child: Text(
                                              'Entrar'.toUpperCase(),
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                          ),
                                          onPressed: () async {
                                            //validar email y password con firebase
                                            if (_formKey.currentState!
                                                .validate()) {
                                              //Entramos con correo electronico
                                              _.signInWithEmailAndPassword();

                                              //Get.toNamed('/nextpage');

                                              /*Navigator.of(context).pushAndRemoveUntil(
                                          MaterialPageRoute(
                                              builder: (context) => NextPage()),
                                          (Route<dynamic> route) => false);*/
                                            }

                                            //navegar a NextPage
                                            /* Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => NextPage()));*/
                                          },
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.fromLTRB(10, 20, 10, 20),
                                        //child: Text('Don\'t have an account? Create'),
                                        child: Text.rich(TextSpan(children: [
                                          TextSpan(
                                              text: "¿No tienes una cuenta? "),
                                          TextSpan(
                                            text: 'Crear cuenta',
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                Get.toNamed('/registration');
                                                /*Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    RegistrationPage()));*/
                                              },
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Theme.of(context)
                                                    .accentColor),
                                          ),
                                        ])),
                                      ),
                                      SizedBox(height: 5.0),
                                      Text(
                                        "O inicia sesión usando:",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      SizedBox(height: 25.0),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          GestureDetector(
                                            child: FaIcon(
                                              FontAwesomeIcons.googlePlus,
                                              size: 35,
                                              color: HexColor("#EC2D2F"),
                                            ),
                                            onTap: () {
                                              setState(() {
                                                _.signInWithGoogle();
                                                /*showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return ThemeHelper()
                                                        .alartDialog(
                                                            "Google Plus",
                                                            "You tap on GooglePlus social icon.",
                                                            context);
                                                  },
                                                );*/
                                              });
                                            },
                                          ),
                                          /*SizedBox(
                                            width: 30.0,
                                          ),
                                          GestureDetector(
                                            child: Container(
                                              padding: EdgeInsets.all(0),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                                border: Border.all(
                                                    width: 5,
                                                    color: HexColor("#40ABF0")),
                                                color: HexColor("#40ABF0"),
                                              ),
                                              child: FaIcon(
                                                FontAwesomeIcons.twitter,
                                                size: 23,
                                                color: HexColor("#FFFFFF"),
                                              ),
                                            ),
                                            onTap: () {
                                              setState(() {
                                                //iniciar sesion con google
                                                
                                                showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return ThemeHelper().alartDialog(
                                              "Twitter",
                                              "You tap on Twitter social icon.",
                                              context);
                                        },
                                      );
                                              });
                                            },
                                          ),
                                          SizedBox(
                                            width: 30.0,
                                          ),
                                          GestureDetector(
                                            child: FaIcon(
                                              FontAwesomeIcons.facebook,
                                              size: 35,
                                              color: HexColor("#3E529C"),
                                            ),
                                            onTap: () {
                                              setState(() {
                                                showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return ThemeHelper()
                                                        .alartDialog(
                                                            "Facebook",
                                                            "You tap on Facebook social icon.",
                                                            context);
                                                  },
                                                );
                                              });
                                            },
                                          ),*/
                                        ],
                                      ),
                                    ],
                                  )),
                            ],
                          )),
                    ),
                  ],
                ),
              );
            }));
  }
}
