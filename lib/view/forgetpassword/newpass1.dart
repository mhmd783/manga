import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mango/companent/textfield.dart';
import 'package:mango/prov/prov.dart';
import 'package:provider/provider.dart';

class NewPass1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NewPass1();
  }
}

class _NewPass1 extends State<NewPass1> {
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
                            Text(val.languagebox.get("language") == "en"
                                ? "enter your email to reset password"
                                : "ادخل الايميل لتغيير كلمه السر"),
                            SizedBox(
                              height: 30,
                            ),
                            TextFormFiledApp(
                                controll: val.api.emailnewpass1,
                                hintText:
                                    val.languagebox.get("language") == "en"
                                        ? "email"
                                        : "الايميل",
                                sufixicon: Icons.email_outlined,
                                keyboard: TextInputType.emailAddress),
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
                child: Container(
                  width: 100,
                  child: TextButton(
                    onPressed: () {
                      if (formstate.currentState!.validate()) {
                        val.newPass1();
                        Navigator.of(context).pushNamed("messagenewpass1");
                        print("validat");
                      } else {
                        print("not validat");
                      }
                    },
                    child: Text(
                      val.languagebox.get("language") == "en"
                          ? "Next"
                          : "التالي",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
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
