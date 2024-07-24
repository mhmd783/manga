import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mango/companent/textfield.dart';
import 'package:mango/prov/prov.dart';
import 'package:provider/provider.dart';

class NewPass3 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NewPass3();
  }
}

class _NewPass3 extends State<NewPass3> {
  GlobalKey<FormState> formstate = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Consumer<control>(builder: (context, val, child) {
      return Scaffold(
        backgroundColor: const Color.fromARGB(255, 85, 85, 85),
        body: Form(
          key: formstate,
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(30),
                              right: Radius.circular(30))),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 50,
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              child: IconButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  icon: Icon(
                                    Icons.keyboard_arrow_left,
                                    size: 40,
                                  )),
                            ),
                            Text(
                              val.languagebox.get("language") == "en"
                                  ? "Set New Password"
                                  : "تغيير كلمه السر",
                              style: TextStyle(fontSize: 25),
                            ),
                            Container(
                              height: 200,
                              width: 200,
                              child: Image.asset("assets/images/newpass3.png"),
                            ),
                            Text(
                                textAlign: TextAlign.center,
                                val.languagebox.get("language") == "en"
                                    ? "Your new password must be different from\nyour previously used password"
                                    : "ادخل كلمه السر الجديده"),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              child: TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return val.languagebox.get("language") ==
                                            "en"
                                        ? "empty"
                                        : "فارغ";
                                  }
                                  return null;
                                },
                                obscureText:
                                    val.showpass == true ? false : true,
                                textAlign: TextAlign.start,
                                keyboardType: TextInputType.visiblePassword,
                                controller: val.api.passWordNew,
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(
                                      color: Colors.grey.shade400,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w300),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  hintText:
                                      val.languagebox.get("language") == "en"
                                          ? "new password"
                                          : "كلمه السر الجديده",
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
                              margin: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return val.languagebox.get("language") ==
                                            "en"
                                        ? "empty"
                                        : "فارغ";
                                  }
                                  return null;
                                },
                                obscureText:
                                    val.showconpass == true ? false : true,
                                textAlign: TextAlign.start,
                                keyboardType: TextInputType.visiblePassword,
                                controller: val.api.confirmPassWordNew,
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(
                                      color: Colors.grey.shade400,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w300),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  hintText:
                                      val.languagebox.get("language") == "en"
                                          ? "confirm new password"
                                          : "تاكيد كلمه السر الجديدخ",
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
                            Container(
                              height: MediaQuery.of(context).size.height / 7,
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 25),
                              child: TextButton(
                                  onPressed: () {
                                    val.Rigester();
                                  },
                                  child: Text(
                                      val.languagebox.get("language") == "en"
                                          ? "Resend the code"
                                          : "اعاده ارسال الكود")),
                            )
                          ],
                        ),
                      ),
                    ),
                    Transform.translate(
                        offset: Offset(
                            MediaQuery.of(context).size.width - 100, -50),
                        child: Container(
                          height: 170,
                          width: 170,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 2,
                                  color: Color.fromARGB(223, 163, 198, 221)),
                              borderRadius: BorderRadius.circular(100)),
                        )),
                  ],
                ),
              ),
              //switch
              Container(
                width: 150,
                height: 70,
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  gradient: LinearGradient(
                    colors: [
                      Colors.grey.withOpacity(0.6),
                      Color.fromARGB(255, 226, 235, 227),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.topRight,
                  ),
                ),
                child: TextButton(
                  onPressed: () {
                    if (formstate.currentState!.validate()) {
                      val.NewPass3();
                      Navigator.of(context).pushNamed("messagenewpass3");

                      print("validat");
                    } else {
                      print("not validat");
                    }
                  },
                  child: Text(
                    val.languagebox.get("language") == "en" ? "Go" : "ارسال",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
