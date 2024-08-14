import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mango/companent/colors.dart';
import 'package:mango/companent/container_chose_platform.dart';
import 'package:mango/companent/drop_dowen_button.dart';
import 'package:mango/companent/text_field_profile_edit.dart';
import 'package:mango/companent/text_field_vote.dart';
import 'package:mango/prov/prov.dart';
import 'package:mango/view/firsthome/dialog.dart';
import 'package:provider/provider.dart';

class BodyFirstHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BodyFirstHome();
  }
}

class _BodyFirstHome extends State<BodyFirstHome> {
  ColorsApp colorApp = new ColorsApp();
  GlobalKey<FormState> formstate = GlobalKey();
  DialogFirstHome dialogFirstHome = new DialogFirstHome();

  @override
  Widget build(BuildContext context) {
    return Consumer<control>(builder: (context, val, child) {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(vertical: 10),
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
        /////design body

        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Text(val.languagebox.get("language") == "en"
                    ? "Welcome to"
                    : "مرحبا بك في"),
              ),
              Container(
                height: 50,
                width: 150,
                child: Image.asset(
                  val.languagebox.get("language") == "en"
                      ? "assets/images/mangomedia2.png"
                      : "assets/images/mangomedia.png",
                  fit: BoxFit.fitWidth,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    Expanded(
                        child: MaterialButton(
                      onPressed: () {
                        val.switchHome("reals");
                        Navigator.of(context).pushNamed("home1");
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        alignment: Alignment.center,
                        height: 150,
                        decoration: BoxDecoration(
                            color: colorApp.color1,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              child: Image.asset("assets/images/reals.png"),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              textAlign: TextAlign.center,
                              val.languagebox.get("language") == "en"
                                  ? "Reels"
                                  : "ريلز",
                              style: TextStyle(
                                  color: colorApp.colorf1,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    )),
                    Expanded(
                        child: MaterialButton(
                      onPressed: () {
                        val.switchHome("campain");
                        Navigator.of(context).pushNamed("home1");
                      },
                      child: Container(
                          padding: EdgeInsets.all(10),
                          alignment: Alignment.center,
                          height: 150,
                          decoration: BoxDecoration(
                              color: colorApp.color2,
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  child:
                                      Image.asset("assets/images/campain.png"),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  textAlign: TextAlign.center,
                                  val.languagebox.get("language") == "en"
                                      ? "Campaign"
                                      : "حمله اعلانيه",
                                  style: TextStyle(
                                      color: colorApp.colorf2,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ])),
                    )),
                  ],
                ),
              ),
              //2
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    Expanded(
                        child: MaterialButton(
                      onPressed: () {
                        dialogFirstHome.MessageNotAvalible(context);
                        //Navigator.of(context).pushNamed("");
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        alignment: Alignment.center,
                        height: 150,
                        decoration: BoxDecoration(
                            color: colorApp.color3,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 40,
                                width: 40,
                                child: Image.asset(
                                    "assets/images/campainorder.png"),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                textAlign: TextAlign.center,
                                val.languagebox.get("language") == "en"
                                    ? "Advertising designs"
                                    : "تصاميم اعلانية",
                                style: TextStyle(
                                    color: colorApp.colorf3,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ]),
                      ),
                    )),
                    Expanded(
                        child: MaterialButton(
                      onPressed: () {
                        dialogFirstHome.MessageNotAvalible(context);
                        //Navigator.of(context).pushNamed("");
                      },
                      child: Container(
                          padding: EdgeInsets.all(10),
                          alignment: Alignment.center,
                          height: 150,
                          decoration: BoxDecoration(
                              color: colorApp.color4,
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  child: Image.asset(
                                      "assets/images/realsorder.png"),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  textAlign: TextAlign.center,
                                  val.languagebox.get("language") == "en"
                                      ? "video CGI 3D"
                                      : "فيديو CGI 3D",
                                  style: TextStyle(
                                      color: colorApp.colorf4,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ])),
                    )),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    Expanded(
                        child: MaterialButton(
                      onPressed: () {
                        dialogFirstHome.MessageNotAvalible(context);
                        //Navigator.of(context).pushNamed("");
                      },
                      child: Container(
                          padding: EdgeInsets.all(10),
                          alignment: Alignment.center,
                          height: 150,
                          decoration: BoxDecoration(
                              color: colorApp.color5,
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  child: Image.asset("assets/images/note.png"),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  textAlign: TextAlign.center,
                                  val.languagebox.get("language") == "en"
                                      ? "Visual identity logo"
                                      : "شعار الهوية البصرية",
                                  style: TextStyle(
                                      color: colorApp.colorf5,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ])),
                    )),
                    Expanded(
                        child: MaterialButton(
                      onPressed: () {
                        dialogFirstHome.MessageNotAvalible(context);
                        //Navigator.of(context).pushNamed("");
                      },
                      child: Container(
                          alignment: Alignment.center,
                          height: 150,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: colorApp.color6,
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  child: Image.asset(
                                      "assets/images/realsprofile.png"),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  textAlign: TextAlign.center,
                                  val.languagebox.get("language") == "en"
                                      ? "motion graphics"
                                      : "الرسوم المتحركة",
                                  style: TextStyle(
                                      color: colorApp.colorf6,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ])),
                    )),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
