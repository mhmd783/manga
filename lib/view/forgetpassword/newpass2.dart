import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mango/companent/textfield.dart';
import 'package:mango/prov/prov.dart';
import 'package:provider/provider.dart';

class NewPass2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NewPass2();
  }
}

class _NewPass2 extends State<NewPass2> {
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
                              child: Image.asset("assets/images/newpass1.png"),
                            ),
                            Text(
                                textAlign: TextAlign.center,
                                val.languagebox.get("language") == "en"
                                    ? "Your new password must be different from\nyour previously used password"
                                    : "يجب ادخال كلمه سر جديده"),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              child: TextFormFiledApp(
                                  controll: val.api.passWordNew,
                                  hintText:
                                      val.languagebox.get("language") == "en"
                                          ? "new password"
                                          : "كلمه السر الجديده",
                                  sufixicon: Icons.remove_red_eye,
                                  keyboard: TextInputType.visiblePassword),
                            ),
                            Container(
                              child: TextFormFiledApp(
                                  controll: val.api.confirmPassWordNew,
                                  hintText:
                                      val.languagebox.get("language") == "en"
                                          ? "confirm password"
                                          : "تاكيد كلمه السر الجديده",
                                  sufixicon: Icons.remove_red_eye,
                                  keyboard: TextInputType.emailAddress),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height / 3,
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
                      Navigator.of(context).pushNamed("secces");
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
