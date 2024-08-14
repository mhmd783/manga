import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:mango/companent/colors.dart';
import 'package:mango/companent/container_chose_platform.dart';
import 'package:mango/companent/drop_dowen_button.dart';
import 'package:mango/companent/text_field_vote.dart';
import 'package:mango/prov/prov.dart';
import 'package:mango/view/profile/dialog_details_order.dart';
import 'package:mango/view/profile/dialog_profile.dart';
import 'package:provider/provider.dart';

class Profile1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Profile1();
  }
}

class _Profile1 extends State<Profile1> {
  ColorsApp colorApp = new ColorsApp();
  GlobalKey<FormState> formstate = GlobalKey();
  late Box tokenbox = Hive.box('token');
  DialogProfile dialogProfile = new DialogProfile();
  DialogOrders dialogOrders=new DialogOrders();
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
              Row(
                children: [
                  Expanded(
                    child: MaterialButton(
                      padding: EdgeInsets.all(5),
                      onPressed: () {
                        val.changeBodyProfile("reels");
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: val.body_profile == "reels"
                              ? Border.all(
                                  color: Colors.black,
                                  width: 1,
                                  style: BorderStyle.solid,
                                  strokeAlign: BorderSide.strokeAlignCenter)
                              : null,
                        ),
                        child: PlatForm(
                            text: val.languagebox.get("language") == "en"
                                ? "Reelse"
                                : "ريلز",
                            image: "assets/images/realsprofile.png",
                            color: colorApp.colorinstgram),
                      ),
                    ),
                  ),
                  Expanded(
                    child: MaterialButton(
                      padding: EdgeInsets.all(5),
                      onPressed: () {
                        val.changeBodyProfile("campaign");
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: val.body_profile == "campaign"
                              ? Border.all(
                                  color: Colors.black,
                                  width: 1,
                                  style: BorderStyle.solid,
                                  strokeAlign: BorderSide.strokeAlignCenter)
                              : null,
                        ),
                        child: PlatForm(
                            text: val.languagebox.get("language") == "en"
                                ? "Campain"
                                : "الحملات",
                            image: "assets/images/campain.png",
                            color: colorApp.colorfacebook),
                      ),
                    ),
                  ),
                ],
              ),

              ////Form
              ListView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemCount: val.body_profile == "campaign"
                      ? val.data_client_profile["data"]["advertising_campaigns"]
                          .length
                      : val.data_client_profile["data"]["reels"].length,
                  itemBuilder: (context, i) {
                    return Container(
                      margin: EdgeInsets.only(top: 20),
                      padding: EdgeInsets.all(5),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade300,
                            blurRadius: 2.0, // soften the shadow
                            spreadRadius: 2.0, //extend the shadow
                            offset: Offset(
                              0.0, // Move to right 5  horizontally
                              0.0, // Move to bottom 5 Vertically
                            ),
                          )
                        ],
                      ),
                      child: ListTile(
                        onTap: (){
                          val.body_profile == "campaign"
                              ?dialogOrders.DetailsOrderCampaign(context, i):dialogOrders.DetailsOrderReels(context, i);
                        },
                        leading: Container(
                            margin: EdgeInsets.only(left: 10),
                            height: 30,
                            width: 30,
                            child:
                                Image.asset("assets/images/campainorder.png")),
                        title: Text(
                          val.body_profile == "campaign"
                              ? "${val.data_client_profile["data"]["advertising_campaigns"][i]["order_type"]}"
                              : val.body_profile == "reels"
                                  ? "${val.data_client_profile["data"]["reels"][i]["product_name"]}"
                                  : "${val.data_client_profile["data"]["offer_orders"][i]["offer_title"]}",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          val.body_profile == "campaign" //check any body show
                              ? val.data_client_profile["data"]
                                              ["advertising_campaigns"][i]
                                          ["status_finished"] ==
                                      "done" //check if task done or not
                                  ? val.languagebox.get("language") ==
                                          "en" //check langouge ar or en
                                      ? "active"
                                      : "مفعل"
                                  : val.data_client_profile["data"]
                                                  ["advertising_campaigns"][i]
                                              ["status_finished"] ==
                                          "notdone" //check if task done or not
                                      ? val.languagebox.get("language") ==
                                              "en" //check langouge ar or en
                                          ? "rejected"
                                          : "تم رفضه"
                                      : val.languagebox.get("language") == "en"
                                          ? "under examination"
                                          : "تتم مراجعه طلبك"
                              : val.body_profile == "reels"
                                  ? val.data_client_profile["data"]["reels"][i]
                                              ["status_finished"] ==
                                          "done"
                                      ? val.languagebox.get("language") == "en"
                                          ? "active"
                                          : "مفعل"
                                      : val.data_client_profile["data"]["reels"]
                                                  [i]["status_finished"] ==
                                              "notdone" //check if task done or not
                                          ? val.languagebox.get("language") ==
                                                  "en" //check langouge ar or en
                                              ? "rejected"
                                              : "تم رفضه"
                                          : val.languagebox.get("language") == "en"
                                              ? "under examination"
                                              : "تتم مراجعه طلبك"
                                  : "",
                          style: TextStyle(
                              color: val.body_profile ==
                                      "campaign" //check any body show
                                  ? val.data_client_profile["data"]
                                                  ["advertising_campaigns"][i]
                                              ["status_finished"] ==
                                          "done" //check if task done or not
                                      ? colorApp.colorgreenApp
                                      : val.data_client_profile["data"]
                                                      ["advertising_campaigns"]
                                                  [i]["status_finished"] ==
                                              "notdone" //check if task done or not
                                          ? Colors.red
                                          : colorApp.coloryelloApp
                                  : val.body_profile == "reels"
                                      ? val.data_client_profile["data"]["reels"]
                                                  [i]["status_finished"] ==
                                              "done"
                                          ? colorApp.colorgreenApp
                                          : val.data_client_profile["data"]
                                                          ["reels"][i]
                                                      ["status_finished"] ==
                                                  "notdone" //check if task done or not
                                              ? Colors.red
                                              : colorApp.coloryelloApp
                                      : null),
                        ),
                      ),
                    );
                  })
            ],
          ),
        ),
      );
    });
  }
}
