import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mango/companent/colors.dart';
import 'package:mango/companent/container_chose_platform.dart';
import 'package:mango/companent/drop_dowen_button.dart';
import 'package:mango/companent/text_field_profile_edit.dart';
import 'package:mango/companent/text_field_vote.dart';
import 'package:mango/companent/textfield.dart';
import 'package:mango/prov/prov.dart';
import 'package:provider/provider.dart';

class ProfileEditSendPass extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProfileEditSendPass();
  }
}

class _ProfileEditSendPass extends State<ProfileEditSendPass> {
  ColorsApp colorApp = new ColorsApp();
  GlobalKey<FormState> formstate = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Consumer<control>(builder: (context, val, child) {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 1.0, // soften the shadow
              spreadRadius: 1.0, //extend the shadow
              offset: Offset(
                2.0, // Move to right 5  horizontally
                2.0, // Move to bottom 5 Vertically
              ),
            )
          ],
        ),
        /////design body Profile1
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  val.languagebox.get("language") == "en"
                      ? "Your Profile Data"
                      : "بياناتك",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              TextFormFiledProfil(
                  hintText: val.languagebox.get("language") == "en"
                      ? "password"
                      : "كلمه المرور",
                  controll: val.api.lastName,
                  sufixicon: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.password,
                        color: Colors.grey,
                      )),
                  keyboard: TextInputType.emailAddress),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                alignment: Alignment.center,
                width: 80,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: colorApp.coloryelloApp),
                child: Text(
                  val.languagebox.get("language") == "en" ? "Send" : "ارسال",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
