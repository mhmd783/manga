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

class Notifiction2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Notifiction2();
  }
}

class _Notifiction2 extends State<Notifiction2> {
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
                padding: EdgeInsets.all(7),
                decoration: BoxDecoration(
                    color: colorApp.coloryelloApp,
                    borderRadius: BorderRadius.circular(30)),
                width: 200,
                height: 50,
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Image.asset("assets/images/mango.png"),
                    ),
                    Expanded(
                        child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "اشعاراتك",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    )),
                    CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.notifications_outlined,
                          size: 18,
                        ))
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Divider(
                  height: 1,
                  color: Colors.grey.shade200,
                  thickness: 2,
                  indent: MediaQuery.of(context).size.width / 4,
                  endIndent: MediaQuery.of(context).size.width / 4,
                ),
              ),
              //////
              Container(
                width: double.infinity,
                child: Column(
                  children: [
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: ListTile(
                        leading: CircleAvatar(
                            backgroundColor: Colors.black,
                            radius: 23,
                            child: Image.asset("assets/images/mango.png")),
                        title: Text(
                          "Mango Media",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        subtitle: Text(
                          "6/17/2024",
                          style: TextStyle(color: Colors.grey, fontSize: 13),
                        ),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(right: 30),
                        alignment: Alignment.topRight,
                        child: Text(
                          textAlign: TextAlign.end,
                          "تم إنتهاء صلاحية باقتك , يرجي إعادة تفعيل الباقة أو يمكنك الإشتراك \nفي عروض ال VIP لهذا الشهر باقات حصرية\nلتعيل الباقة مرة أخري يرجي التواصل مع دعم Manga Media علي واتس اب\nوسيتم التفعيل مرة أخري.",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
