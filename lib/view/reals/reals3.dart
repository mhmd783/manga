import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mango/companent/colors.dart';
import 'package:mango/companent/container_chose_platform.dart';
import 'package:mango/companent/dialog.dart';
import 'package:mango/companent/drop_dowen_button.dart';
import 'package:mango/companent/text_field_vote.dart';
import 'package:mango/prov/prov.dart';
import 'package:provider/provider.dart';

class Reals3 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Reals3();
  }
}

class _Reals3 extends State<Reals3> {
  ColorsApp colorApp = new ColorsApp();
  GlobalKey<FormState> formstate = GlobalKey();
  DialogApp dialogApp = new DialogApp();
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
          child: Form(
            key: formstate,
            child: Column(
              children: [
                //////together
                PlatForm(
                    text: val.languagebox.get("language") == "en"
                        ? "Advertising video"
                        : "فيديو اعلاني",
                    image: "assets/images/reals.png",
                    color: colorApp.colorreals),

                ////Form
                Container(
                  margin: EdgeInsets.only(top: 20, right: 5, bottom: 0),
                  alignment: val.languagebox.get("language") == "en"
                      ? Alignment.centerLeft
                      : Alignment.centerRight,
                  child: Text(
                    val.languagebox.get("language") == "en"
                        ? "Enter the price of your product"
                        : "ادخل سعر منتجك",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5),
                  child: TextFormFiledVote(
                      hintText: val.languagebox.get("language") == "en"
                          ? "price"
                          : "السعر",
                      controll: val.api.salary_prodect,
                      sufixicon: Container(
                        width: 1,
                      ),
                      keyboard: TextInputType.number),
                ),

                Container(
                  margin: EdgeInsets.only(top: 20, right: 5, bottom: 10),
                  alignment: val.languagebox.get("language") == "en"
                      ? Alignment.centerLeft
                      : Alignment.centerRight,
                  child: Text(
                    val.languagebox.get("language") == "en"
                        ? "Do you have product offers?"
                        : "هل لديك عروض للمنتج",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5),
                  child: TextFormFiledVote(
                      hintText: val.languagebox.get("language") == "en"
                          ? "Write an offer"
                          : "اكتب عرض",
                      controll: val.api.offers_prodect,
                      sufixicon: Container(
                        width: 1,
                      ),
                      keyboard: TextInputType.text),
                ),

                Container(
                  margin: EdgeInsets.only(top: 20, right: 5, bottom: 10),
                  alignment: val.languagebox.get("language") == "en"
                      ? Alignment.centerLeft
                      : Alignment.centerRight,
                  child: Text(
                    val.languagebox.get("language") == "en"
                        ? "Does the product advertise gifts?"
                        : "هل المنتج يعلن معه عن هدايا",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5),
                  child: TextFormFiledVote(
                      hintText: val.languagebox.get("language") == "en"
                          ? "Write gifts"
                          : "اكتب الهدايا",
                      controll: val.api.gift_prodect,
                      sufixicon: Container(
                        width: 1,
                      ),
                      keyboard: TextInputType.text),
                ),

                Container(
                  margin: EdgeInsets.only(right: 5, top: 20, bottom: 10),
                  child: Row(
                    children: [
                      Container(
                        child: CircleAvatar(
                          backgroundColor:
                              const Color.fromARGB(255, 239, 241, 255),
                          child: IconButton(
                              onPressed: () {
                                val.switchHome("reals2");
                              },
                              icon: Icon(
                                Icons.arrow_back,
                                size: 18,
                              )),
                        ),
                      ),
                      Expanded(child: Container()),
                      MaterialButton(
                        onPressed: () {
                          if (formstate.currentState!.validate()) {
                            val.Reals();
                            dialogApp.Reals(context);
                            print("validat");
                          } else {
                            print("not validat");
                          }
                        },
                        child: Container(
                            width: 100,
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: const Color.fromARGB(255, 85, 85, 85)),
                            alignment: Alignment.center,
                            child: Text(
                              val.languagebox.get("language") == "en"
                                  ? "Send"
                                  : "رسال",
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
