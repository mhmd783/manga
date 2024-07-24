import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:mango/companent/colors.dart';
import 'package:mango/companent/dialog.dart';
import 'package:mango/companent/drop_dowen_button.dart';
import 'package:mango/companent/text_field_vote.dart';
import 'package:mango/prov/prov.dart';
import 'package:provider/provider.dart';

class Vote extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Vote();
  }
}

class _Vote extends State<Vote> {
  ColorsApp colorApp = new ColorsApp();
  DialogApp dialogApp = new DialogApp();
  GlobalKey<FormState> formstate = GlobalKey();
  late Box statusbox = Hive.box('status');
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<control>(context, listen: false).DropDowenButtonValus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<control>(builder: (context, val, child) {
      return SafeArea(
        child: Scaffold(
            body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    colorApp.colorbodygreen,
                    Colors.white,
                    Colors.white,
                    Colors.white,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            Container(
              height: double.infinity,
              width: double.infinity,
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 1.0, // soften the shadow
                  spreadRadius: 1.0, //extend the shadow
                  offset: Offset(
                    1.0, // Move to right 5  horizontally
                    1.0, // Move to bottom 5 Vertically
                  ),
                )
              ], color: Colors.white, borderRadius: BorderRadius.circular(30)),
              /////design screen
              child: Form(
                key: formstate,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      //استبيان titile
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: [
                            Container(
                              width: 100,
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: colorApp.colorgreenApp),
                              child: Row(
                                children: [
                                  Container(
                                      height: 50,
                                      width: 40,
                                      child: Image.asset(
                                        "assets/images/mango.png",
                                        fit: BoxFit.fill,
                                      )),
                                  Text(
                                    val.languagebox.get("language") == "en"
                                        ? "Vote"
                                        : "استبيان",
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                            Expanded(child: Container()),
                            CircleAvatar(
                              backgroundColor: colorApp.coloryelloApp,
                              child: Text(
                                  "${val.firstnamebox.get("firstname")[0]}"),
                            )
                          ],
                        ),
                      ),

                      ///form body
                      Container(
                        margin: EdgeInsets.only(top: 30, right: 5),
                        alignment: val.languagebox.get("language") == "en"
                            ? Alignment.centerLeft
                            : Alignment.centerRight,
                        child: Text(
                          textAlign: val.languagebox.get("language") == "en"
                              ? TextAlign.start
                              : TextAlign.end,
                          val.languagebox.get("language") == "en"
                              ? "Enter account links"
                              : "أدخل روابط الحسابات",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: TextFormFiledVote(
                            hintText: val.languagebox.get("language") == "en"
                                ? "Enter your personal Facebook account link"
                                : "ادخل رابط حساب فيسبوك الشخصي",
                            controll: val.api.linkfacebook,
                            sufixicon: Container(
                                padding: EdgeInsets.all(10),
                                height: 20,
                                width: 20,
                                child:
                                    Image.asset("assets/images/facebook.png")),
                            keyboard: TextInputType.text),
                      ),

                      Container(
                        margin: EdgeInsets.symmetric(vertical: 0),
                        child: TextFormFiledVote(
                            hintText: val.languagebox.get("language") == "en"
                                ? "Enter your personal Instagram account link"
                                : "ادخل رابط حساب الانستجرام الشخصي",
                            controll: val.api.linkinstgram,
                            sufixicon: Container(
                                height: 20,
                                width: 20,
                                padding: EdgeInsets.all(10),
                                child: Image.asset(
                                  "assets/images/instgram.png",
                                  fit: BoxFit.fitHeight,
                                )),
                            keyboard: TextInputType.text),
                      ),
                      DrobDowenButtonApp(
                          selectedValue: val.selectedValue,
                          dropdownItems: val.dropdownItems),
                      val.showvote == false
                          ? Container()
                          : Container(
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 20, right: 5),
                                    alignment:
                                        val.languagebox.get("language") == "en"
                                            ? Alignment.centerLeft
                                            : Alignment.centerRight,
                                    child: Text(
                                      val.languagebox.get("language") == "en"
                                          ? "Set your previous daily budget"
                                          : "حدد الميزانية اليومية السابقة لك",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          child: TextFormFiledVote(
                                              hintText: val.languagebox
                                                          .get("language") ==
                                                      "en"
                                                  ? "to 900"
                                                  : "الي 900",
                                              controll: val.api.endSalary,
                                              sufixicon: Icon(Icons.money),
                                              keyboard: TextInputType.number),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          margin:
                                              EdgeInsets.symmetric(vertical: 0),
                                          child: TextFormFiledVote(
                                              hintText: val.languagebox
                                                          .get("language") ==
                                                      "en"
                                                  ? "from 10"
                                                  : "من 10",
                                              controll: val.api.startSalary,
                                              sufixicon: Icon(Icons.money),
                                              keyboard: TextInputType.number),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                      Container(
                        margin: EdgeInsets.only(top: 20, right: 5),
                        alignment: val.languagebox.get("language") == "en"
                            ? Alignment.centerLeft
                            : Alignment.centerRight,
                        child: Text(
                          val.languagebox.get("language") == "en"
                              ? "Notes"
                              : "ملاحظات",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 0),
                        child: TextFormFiledVote(
                            hintText: val.languagebox.get("language") == "en"
                                ? "note"
                                : "اكتب ملاحظاتك",
                            controll: val.api.note,
                            sufixicon: Icon(Icons.note_add_outlined),
                            keyboard: TextInputType.text),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 20),
                        width: 100,
                        height: 40,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade300,
                                blurRadius: 5.0, // soften the shadow
                                spreadRadius: 5.0, //extend the shadow
                                offset: Offset(
                                  3.0, // Move to right 5  horizontally
                                  3.0, // Move to bottom 5 Vertically
                                ),
                              )
                            ],
                            borderRadius: BorderRadius.circular(30),
                            color: colorApp.coloryelloApp),
                        child: Center(
                          child: MaterialButton(
                            onPressed: () {
                              if (formstate.currentState!.validate()) {
                                val.Vote();
                                dialogApp.Vote(context);
                                print("validat");
                              } else {
                                print("not validat");
                              }
                              // val.statusvotebox.put("statusvote", "false");
                              // statusbox.put('status','0');
                            },
                            child: Text(
                              val.languagebox.get("language") == "en"
                                  ? "send"
                                  : "ارسال",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        )),
      );
    });
  }
}
