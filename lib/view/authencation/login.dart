import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mango/companent/colors.dart';
import 'package:mango/companent/textfield.dart';
import 'package:mango/prov/prov.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Login();
  }
}

class _Login extends State<Login> {
  ColorsApp colorapp = new ColorsApp();
  GlobalKey<FormState> formstate = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Consumer<control>(builder: (context, val, child) {
      return Stack(
        children: [
          Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(30), right: Radius.circular(30))),
            child: SingleChildScrollView(
              child: Form(
                key: formstate,
                child: Column(
                  children: [
                    SizedBox(
                      height: 150,
                    ),
                    Text(
                      val.languagebox.get("language") == "en"
                          ? "Sign In"
                          : "تسجيل الدخول",
                      style: TextStyle(fontSize: 25),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      child: TextFormFiledApp(
                          controll: val.api.emailLogin,
                          hintText: val.languagebox.get("language") == "en"
                              ? "email"
                              : "الايميل",
                          sufixicon: Icons.email_outlined,
                          keyboard: TextInputType.emailAddress),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return val.languagebox.get("language") == "en"
                                ? "empty"
                                : "فارغ";
                          }
                          return null;
                        },
                        obscureText: val.showpass == true ? false : true,
                        textAlign: TextAlign.start,
                        keyboardType: TextInputType.text,
                        controller: val.api.passWordLogin,
                        decoration: InputDecoration(
                          hintStyle: TextStyle(
                              color: Colors.grey.shade400,
                              fontSize: 15,
                              fontWeight: FontWeight.w300),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                          hintText: val.languagebox.get("language") == "en"
                              ? "password"
                              : "كلمه السر ",
                          prefixIcon: IconButton(
                              onPressed: () {
                                val.showPass();
                              },
                              icon: Icon(val.showpass == true
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined)),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 50),
                      child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed("newpass1");
                          },
                          child: Text(val.languagebox.get("language") == "en"
                              ? "Forget Password?"
                              : "نسيت كلمه السر؟")),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 30),
                      child: Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        children: [
                          MaterialButton(
                            onPressed: () {
                              if (formstate.currentState!.validate()) {
                                val.Login();
                                Navigator.of(context).pushNamed("messagelogin");
                                print("validat");
                              } else {
                                print("not validat");
                              }
                              //
                            },
                            child: Container(
                              height: 50,
                              width: 120,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: const Color.fromARGB(255, 85, 85, 85)),
                              child: Center(
                                  child: Text(
                                      val.languagebox.get("language") == "en"
                                          ? "Start"
                                          : "دخول",
                                      style: TextStyle(color: Colors.white))),
                            ),
                          ),
                          Container(
                            height: 3,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white,
                                  blurRadius: 10.0, // soften the shadow
                                  spreadRadius: 5.0, //extend the shadow
                                  offset: Offset(
                                    5.0, // Move to right 5  horizontally
                                    5.0, // Move to bottom 5 Vertically
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 4,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Transform.translate(
              offset: Offset(-50, -50),
              child: Container(
                height: 170,
                width: 170,
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 2,
                        color: const Color.fromARGB(255, 221, 221, 1)),
                    borderRadius: BorderRadius.circular(100)),
              )),
        ],
      );
    });
  }
}
