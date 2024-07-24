import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mango/companent/dialog.dart';
import 'package:mango/prov/prov.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class Suport1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Suport1();
  }
}

class _Suport1 extends State<Suport1> {
  DialogApp dialoge = new DialogApp();
  GlobalKey<FormState> formstate = GlobalKey();
  String phone_admin = "+972 56-601-3123";
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
        /////design body campaign
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                width: 170,
                height: 170,
                margin: EdgeInsets.only(top: 40),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 3.0, // soften the shadow
                        spreadRadius: 3.0, //extend the shadow
                        offset: Offset(
                          0.0, // Move to right 5  horizontally
                          0.0, // Move to bottom 5 Vertically
                        ),
                      )
                    ],
                    borderRadius: BorderRadius.circular(100)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      child: Image.asset("assets/images/mango.png"),
                    ),
                    Container(
                      height: 50,
                      width:
                          val.languagebox.get("language") == "en" ? 150 : 100,
                      child: Image.asset(
                        val.languagebox.get("language") == "en"
                            ? "assets/images/mangomedia2.png"
                            : "assets/images/mangomedia.png",
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                alignment: Alignment.center,
                child: Text(
                  val.languagebox.get("language") == "en"
                      ? "To contact Manga Media Manager"
                      : "للتواصل مع Manga Media Manager",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              MaterialButton(
                onPressed: () async {
                  final Uri url = Uri(
                      scheme: 'https', host: 'wa.me', path: phone_admin );
                  if (await canLaunchUrl(url)) {
                    launchUrl(url);
                  }
                },
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 3.0, // soften the shadow
                        spreadRadius: 3.0, //extend the shadow
                        offset: Offset(
                          0.0, // Move to right 5  horizontally
                          0.0, // Move to bottom 5 Vertically
                        ),
                      )
                    ],
                  ),
                  height: 60,
                  width: 60,
                  child: Image.asset("assets/images/whatsapp.png"),
                ),
              ),
              Container(
                margin: EdgeInsets.all(20),
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 3.0, // soften the shadow
                        spreadRadius: 3.0, //extend the shadow
                        offset: Offset(
                          0.0, // Move to right 5  horizontally
                          0.0, // Move to bottom 5 Vertically
                        ),
                      )
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50)),
                child: IconButton(
                    onPressed: () {
                      val.call(phone_admin );
                    },
                    icon: Icon(Icons.call)),
              )
            ],
          ),
        ),
      );
    });
  }
}
