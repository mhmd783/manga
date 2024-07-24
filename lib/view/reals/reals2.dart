import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mango/companent/colors.dart';
import 'package:mango/companent/container_chose_platform.dart';
import 'package:mango/companent/drop_dowen_button.dart';
import 'package:mango/companent/text_field_vote.dart';
import 'package:mango/prov/prov.dart';
import 'package:provider/provider.dart';

class Reals2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Reals2();
  }
}

class _Reals2 extends State<Reals2> {
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
                        ? "description of your product"
                        : "اكتب وصف عن منتجك",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return val.languagebox.get("language") == "en"
                          ? "empty"
                          : "فارغ";
                    }
                    return null;
                  },
                  textAlign: TextAlign.end,
                  minLines: 3,
                  maxLines: 3,
                  keyboardType: TextInputType.text,
                  controller: val.api.description_prodect,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: 15,
                        fontWeight: FontWeight.w300),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    hintText: val.languagebox.get("language") == "en"
                        ? "description"
                        : "اكتب وصف كامل للمنتج",
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20, right: 5, bottom: 10),
                  alignment: val.languagebox.get("language") == "en"
                      ? Alignment.centerLeft
                      : Alignment.centerRight,
                  child: Text(
                    val.languagebox.get("language") == "en"
                        ? "Write how to use the product"
                        : "اكتب طريقه استخدام المنتج",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return val.languagebox.get("language") == "en"
                          ? "empty"
                          : "فارغ";
                    }
                    return null;
                  },
                  textAlign: TextAlign.end,
                  minLines: 3,
                  maxLines: 3,
                  keyboardType: TextInputType.text,
                  controller: val.api.roude_usage_prodect,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: 15,
                        fontWeight: FontWeight.w300),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    hintText: val.languagebox.get("language") == "en"
                        ? "Write how to use the product"
                        : "اكتب طريقه استخدام المنتج",
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(right: 20, top: 20),
                  child: Row(
                    children: [
                      Container(
                        alignment: Alignment.topRight,
                        child: CircleAvatar(
                          backgroundColor:
                              const Color.fromARGB(255, 239, 241, 255),
                          child: IconButton(
                              onPressed: () {
                                val.switchHome("reals");
                              },
                              icon: Icon(
                                Icons.arrow_back,
                                size: 18,
                              )),
                        ),
                      ),
                      Expanded(child: Container()),
                      Container(
                        alignment: Alignment.topRight,
                        child: CircleAvatar(
                          backgroundColor:
                              const Color.fromARGB(255, 239, 241, 255),
                          child: IconButton(
                              onPressed: () {
                                if (formstate.currentState!.validate()) {
                                  val.switchHome("reals3");
                                  print("validat");
                                } else {
                                  print("not validat");
                                }
                              },
                              icon: Icon(
                                Icons.arrow_forward,
                                size: 18,
                              )),
                        ),
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
