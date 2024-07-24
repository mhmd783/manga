import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mango/companent/text_field_verfi_email.dart';
import 'package:mango/prov/prov.dart';
import 'package:provider/provider.dart';

class VerfyEmailNewPass extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _VerfyEmailNewPass();
  }
}

class _VerfyEmailNewPass extends State<VerfyEmailNewPass> {
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
                                  ? "Verfy Email"
                                  : "تاكيد الايميل",
                              style: TextStyle(fontSize: 25),
                            ),
                            Container(
                              height: 200,
                              width: 200,
                              child:
                                  Image.asset("assets/images/verfyemail.png"),
                            ),
                            Text(val.languagebox.get("language") == "en"
                                ? "please enter the 6 digit we send to"
                                : "ادخل 6 ارقام المرسله علي"),
                            Text(
                              "${val.api.emailnewpass1.text}",
                              style: TextStyle(color: Colors.blue),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: TextFormFiledAppVerfyEmail(
                                      controll: val.api.code1),
                                ),
                                Expanded(
                                  child: TextFormFiledAppVerfyEmail(
                                      controll: val.api.code2),
                                ),
                                Expanded(
                                  child: TextFormFiledAppVerfyEmail(
                                      controll: val.api.code3),
                                ),
                                Expanded(
                                  child: TextFormFiledAppVerfyEmail(
                                      controll: val.api.code4),
                                ),
                                Expanded(
                                  child: TextFormFiledAppVerfyEmail(
                                      controll: val.api.code5),
                                ),
                                Expanded(
                                  child: TextFormFiledAppVerfyEmail(
                                      controll: val.api.code6),
                                ),
                              ],
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height / 5,
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 25),
                              child: TextButton(
                                  onPressed: () {
                                    val.verfiEmailNewPass();
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
                      val.verfiEmailNewPass();
                      Navigator.of(context)
                          .pushNamed("messageverfyemailnewpass");

                      print("validat");
                    } else {
                      print("not validat");
                    }
                  },
                  child: Text(
                    val.languagebox.get("language") == "en" ? "Go" : "تاكيد",
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
