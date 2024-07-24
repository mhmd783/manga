import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mango/companent/colors.dart';
import 'package:mango/companent/container_chose_platform.dart';
import 'package:mango/companent/dialog.dart';
import 'package:mango/companent/drop_dowen_button.dart';
import 'package:mango/companent/drop_dowen_goal.dart';
import 'package:mango/companent/drop_dowen_goal_area.dart';
import 'package:mango/companent/text_field_vote.dart';
import 'package:mango/prov/prov.dart';
import 'package:provider/provider.dart';

class CampaignNext extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CampaignNext();
  }
}

class _CampaignNext extends State<CampaignNext> {
  ColorsApp colorApp = new ColorsApp();
  GlobalKey<FormState> formstate = GlobalKey();
  DialogApp dialogApp = new DialogApp();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
        /////design body CampaignNext
        child: SingleChildScrollView(
          child: Form(
            key: formstate,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20, right: 5),
                  alignment: val.languagebox.get("language") == "en"
                      ? Alignment.centerLeft
                      : Alignment.centerRight,
                  child: Text(
                    val.languagebox.get("language") == "en"
                        ? "Set a daily budget(choice)"
                        : "حدد الميزانيه اليوميه (اختياري)",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  child: TextFormFiledVoteNotValied(
                      hintText: val.languagebox.get("language") == "en"
                          ? "daily from 10\$ to 900\$"
                          : "من 10\$ الي 900\$ يوميا",
                      controll: val.api.salaryforday_campain,
                      sufixicon: Icon(Icons.money),
                      keyboard: TextInputType.number),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10, right: 5),
                  alignment: val.languagebox.get("language") == "en"
                      ? Alignment.centerLeft
                      : Alignment.centerRight,
                  child: Text(
                    val.languagebox.get("language") == "en"
                        ? "Define your target audience area"
                        : "حدد منطقه الجمهور المستهدف",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  child: TextFormFiledVote(
                      hintText: val.languagebox.get("language") == "en"
                          ? "Jerusalem, West Bank, Inside 48 "
                          : "القدس ,الداخل 48 الضفه الغربه",
                      controll: val.api.target_area_campain,
                      sufixicon: Icon(Icons.location_city),
                      keyboard: TextInputType.text),
                ),
                Row(
                  children: [
                    Container(
                      alignment: Alignment.topRight,
                      child: CircleAvatar(
                        backgroundColor:
                            const Color.fromARGB(255, 239, 241, 255),
                        child: IconButton(
                            onPressed: () {
                              val.switchHome("campain");
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
                          val.Camapain();
                          dialogApp.Campain(context);
                          print("validat");
                        } else {
                          print("not validat");
                        }
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 20),
                        alignment: Alignment.center,
                        width: 100,
                        height: 45,
                        decoration: BoxDecoration(
                            color: colorApp.coloryelloApp,
                            borderRadius: BorderRadius.circular(30)),
                        child: Text(
                          val.languagebox.get("language") == "en"
                              ? "Send"
                              : "ارسال",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
