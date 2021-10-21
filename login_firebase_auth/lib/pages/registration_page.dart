import 'package:flutter/material.dart';
import 'package:flutter_login_ui/common/theme_helper.dart';
import 'package:flutter_login_ui/controller/register_login_controller.dart';
import 'package:flutter_login_ui/validations/validations.dart';
import 'package:flutter_meedu/state.dart';
import 'package:get/get.dart';
//import 'registration_page_prov.dart';
import 'widgets/header_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_login_ui/pages/widgets/header_widget.dart';

// ignore: must_be_immutable
class RegistrationPage extends StatelessWidget {
  final controller = Get.put(RegisterLoginController());
  final _formKey = GlobalKey<FormState>();

  bool checkedValue = false;
  bool checkboxValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<RegisterLoginController>(builder: (_) {
        return SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: 150,
                child: HeaderWidget(150, false, Icons.person_add_alt_1_rounded),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(25, 50, 25, 10),
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          GestureDetector(
                            child: Stack(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(
                                        width: 5, color: Colors.white),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 20,
                                        offset: const Offset(5, 5),
                                      ),
                                    ],
                                  ),
                                  child: Icon(
                                    Icons.person,
                                    color: Colors.grey.shade300,
                                    size: 80.0,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(80, 80, 0, 0),
                                  child: Icon(
                                    Icons.add_circle,
                                    color: Colors.grey.shade700,
                                    size: 25.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            child: TextFormField(
                              controller: controller.nameController,
                              decoration: ThemeHelper().textInputDecoration(
                                'Nombre',
                                'Ingresa tu nombre',
                              ),
                              //onChanged: controller.onNameChanged,
                              validator: (text) {
                                if (text == null) return null;
                                return isValidName(text)
                                    ? null
                                    : "Nombre inválido";
                              },
                            ),
                            decoration:
                                ThemeHelper().inputBoxDecorationShaddow(),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            child: TextFormField(
                              controller: controller.lastnameController,
                              decoration: ThemeHelper().textInputDecoration(
                                  'Apellidos', 'Ingresa tus apellidos'),
                              //onChanged: controller.onLastNameChanged,
                              validator: (text) {
                                if (text == null) return null;
                                return isValidLastName(text)
                                    ? null
                                    : "Apellidos inválidos";
                              },
                            ),
                            decoration:
                                ThemeHelper().inputBoxDecorationShaddow(),
                          ),
                          SizedBox(height: 20.0),
                          Container(
                            child: TextFormField(
                                controller: controller.emailController,
                                decoration: ThemeHelper().textInputDecoration(
                                    "Correo electrónico",
                                    "Ingresa tu correo electrónico"),
                                keyboardType: TextInputType.emailAddress,
                                //onChanged: controller.onEmailChanged,
                                validator: (text) {
                                  if (text == null) return null;
                                  return isValidEmail(text)
                                      ? null
                                      : "Dirección de correo electrónico inválida";
                                }
                                /*validator: (val) {
                                  if (!(val!.isEmpty) &&
                                      !RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                                          .hasMatch(val)) {
                                    return "Dirección de correo electrónico inválida";
                                  }
                                  return null;
                                },*/

                                ),
                            decoration:
                                ThemeHelper().inputBoxDecorationShaddow(),
                          ),
                          SizedBox(height: 20.0),
                          Container(
                            child: TextFormField(
                              controller: controller.passwordController,
                              decoration: ThemeHelper().textInputDecoration(
                                  "Contraseña*", "Ingresa tu contraseña"),
                              //onChanged: controller.onPasswordChanged,
                              validator: (text) {
                                /*if (val!.isEmpty) {
                                    return "Por favor ingresa tu contraseña";
                                  }*/
                                if (text == null) return null;

                                if (text.trim().length >= 8) {
                                  return null;
                                }

                                return "La contraseña debe tener mínimo 8 digitos";
                              },
                            ),
                            decoration:
                                ThemeHelper().inputBoxDecorationShaddow(),
                          ),
                          SizedBox(height: 20.0),
                          Consumer(builder: (_, watch, __) {
                            // ignore: unnecessary_statements
                            //watch(registerProvider.select((_) => _.password));
                            return Container(
                              child: TextFormField(
                                controller: controller.vPasswordController,
                                obscureText: false,
                                decoration: ThemeHelper().textInputDecoration(
                                    "Verificar contraseña",
                                    "Ingresa tu contraseña nuevamente"),
                                //onChanged: controller.onvPasswordChanged,
                                validator: (text) {
                                  /*if (val!.isEmpty) {
                                    return "Por favor ingresa tu contraseña";
                                  }*/
                                  if (text == null)
                                    return "Debe ingresar una contraseña";
                                  /*if (controller.state.password != text) {
                                    return "Contraseñas no coinciden";
                                  }*/
                                  if (text.trim().length >= 8) {
                                    return null;
                                  }

                                  return "La contraseña debe tener mínimo 8 digitos";
                                },
                              ),
                              decoration:
                                  ThemeHelper().inputBoxDecorationShaddow(),
                            );
                          }),
                          SizedBox(height: 15.0),
                          FormField<bool>(
                            builder: (state) {
                              return Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Checkbox(
                                          value: checkboxValue,
                                          onChanged: (value) {
                                            //setState(() {
                                            checkboxValue = value!;
                                            state.didChange(value);
                                            //});
                                          }),
                                      Text(
                                        "Acepto todos los términos y condiciones.",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      state.errorText ?? '',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Theme.of(context).errorColor,
                                        fontSize: 12,
                                      ),
                                    ),
                                  )
                                ],
                              );
                            },
                            validator: (value) {
                              if (!checkboxValue) {
                                return 'Nececitas aceptar los términos y condiciones.';
                              } else {
                                return null;
                              }
                            },
                          ),
                          SizedBox(height: 20.0),
                          Container(
                            decoration:
                                ThemeHelper().buttonBoxDecoration(context),
                            child: ElevatedButton(
                              style: ThemeHelper().buttonStyle(),
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(40, 10, 40, 10),
                                child: Text(
                                  "Registrarme".toUpperCase(),
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              onPressed: () {
                                //validar email y password con firebase
                                if (_formKey.currentState!.validate()) {
                                  //se invoca al metodo de registro
                                  _.register();
                                  //Get.toNamed('/login');

                                  /*Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: (context) => LoginPage()),
                                      (Route<dynamic> route) => false);*/
                                }
                              },
                            ),
                          ),
                          /*SizedBox(height: 30.0),
                          Text(
                            "O crear una cuenta usando red social",
                            style: TextStyle(color: Colors.grey),
                          ),
                          SizedBox(height: 25.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                child: FaIcon(
                                  FontAwesomeIcons.googlePlus,
                                  size: 35,
                                  color: HexColor("#EC2D2F"),
                                ),
                                onTap: () {
                                  // setState(() {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return ThemeHelper().alartDialog(
                                          "Google Plus",
                                          "You tap on GooglePlus social icon.",
                                          context);
                                    },
                                  );
                                  // });
                                },
                              ),
                              SizedBox(
                                width: 30.0,
                              ),
                              GestureDetector(
                                child: Container(
                                  padding: EdgeInsets.all(0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(
                                        width: 5, color: HexColor("#40ABF0")),
                                    color: HexColor("#40ABF0"),
                                  ),
                                  child: FaIcon(
                                    FontAwesomeIcons.twitter,
                                    size: 23,
                                    color: HexColor("#FFFFFF"),
                                  ),
                                ),
                                onTap: () {
                                  // setState(() {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return ThemeHelper().alartDialog(
                                          "Twitter",
                                          "You tap on Twitter social icon.",
                                          context);
                                    },
                                  );
                                  //});
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
                                  //setState(() {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return ThemeHelper().alartDialog(
                                          "Facebook",
                                          "You tap on Facebook social icon.",
                                          context);
                                    },
                                  );
                                  // });
                                },
                              ),
                            ],
                          ),*/
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
