import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mango/companent/textfield.dart';
import 'package:mango/prov/prov.dart';
import 'package:provider/provider.dart';

class Rigester extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Rigester();
  }
}

class _Rigester extends State<Rigester> {
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
                          ? "Sign Up"
                          : "تسجيل حساب",
                      style: TextStyle(fontSize: 25),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            child: TextFormFiledApp(
                                controll: val.api.firstName,
                                hintText:
                                    val.languagebox.get("language") == "en"
                                        ? "first name"
                                        : "الاسم الاول",
                                sufixicon: Icons.person_2_outlined,
                                keyboard: TextInputType.text),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: TextFormFiledApp(
                                controll: val.api.lastName,
                                hintText:
                                    val.languagebox.get("language") == "en"
                                        ? "last name"
                                        : "الاسم الثاني",
                                sufixicon: Icons.person_2_outlined,
                                keyboard: TextInputType.text),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      child: TextFormFiledApp(
                          controll: val.api.email,
                          hintText: val.languagebox.get("language") == "en"
                              ? "email"
                              : "الايميل",
                          sufixicon: Icons.email_outlined,
                          keyboard: TextInputType.emailAddress),
                    ),
                    Container(
                      child: TextFormFiledApp(
                          controll: val.api.phone,
                          hintText: val.languagebox.get("language") == "en"
                              ? "phone"
                              : "رقم الهاتف",
                          sufixicon: Icons.phone,
                          keyboard: TextInputType.number),
                    ),
                    Container(
                      child: TextFormFiledApp(
                          controll: val.api.address,
                          hintText: val.languagebox.get("language") == "en"
                              ? "addres"
                              : "العنوان",
                          sufixicon: Icons.location_city,
                          keyboard: TextInputType.text),
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
                        keyboardType: TextInputType.visiblePassword,
                        controller: val.api.passWord,
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
                              : "كلمه السر",
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
                      margin:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return val.languagebox.get("language") == "en"
                                ? "empty"
                                : "فارغ";
                          }
                          return null;
                        },
                        obscureText: val.showconpass == true ? false : true,
                        textAlign: TextAlign.start,
                        keyboardType: TextInputType.visiblePassword,
                        controller: val.api.confirmPassWord,
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
                              ? "confirm password"
                              : "تاكيد كلمه السر",
                          prefixIcon: IconButton(
                              onPressed: () {
                                val.showConPass();
                              },
                              icon: Icon(val.showconpass == true
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 13,
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 30),
                      child: Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        children: [
                          Container(
                            height: 50,
                            width: 120,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: const Color.fromARGB(255, 85, 85, 85)),
                            child: Center(
                                child: MaterialButton(
                              onPressed: () {
                                if (formstate.currentState!.validate()) {
                                  Navigator.of(context)
                                      .pushNamed("messagerigester");
                                  val.Rigester();
                                  print("validat");
                                } else {
                                  print("not validat");
                                }
                                //val.Rigester();
                              },
                              child: Text(
                                  val.languagebox.get("language") == "en"
                                      ? "Start"
                                      : "تسجيل ",
                                  style: TextStyle(color: Colors.white)),
                            )),
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
                    )
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
                        width: 2, color: Color.fromARGB(223, 163, 198, 221)),
                    borderRadius: BorderRadius.circular(100)),
              )),
        ],
      );
    });
  }
}
