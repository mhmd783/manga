import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mango/companent/colors.dart';
import 'package:mango/companent/container_chose_platform.dart';
import 'package:mango/companent/drop_dowen_button.dart';
import 'package:mango/companent/drop_dowen_goal.dart';
import 'package:mango/companent/drop_dowen_goal_area.dart';
import 'package:mango/companent/text_field_vote.dart';
import 'package:mango/prov/prov.dart';
import 'package:provider/provider.dart';

class Campaign extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Campaign();
  }
}

class _Campaign extends State<Campaign> {
  ColorsApp colorApp = new ColorsApp();
  GlobalKey<FormState> formstate = GlobalKey();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<control>(context, listen: false).DropDowenCampain();
    });
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
        /////design body campaign
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 10, right: 5, bottom: 5),
                alignment: val.languagebox.get("language") == "en"
                    ? Alignment.centerLeft
                    : Alignment.centerRight,
                child: Text(
                  val.languagebox.get("language") == "en"
                      ? "Select the type of platform"
                      : "حدد نوع منصه اعلانك",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              //////together
              Row(
                children: [
                  Expanded(
                    child: MaterialButton(
                      padding: EdgeInsets.all(5),
                      onPressed: () {
                        
                        val.ChoseTypeCampain("facebook&instgram");
                      },
                      child: Container(
                        height: 120,
                        width: 150,
                        decoration: BoxDecoration(
                          border:
                              val.api.order_type_campain == "facebook&instgram"
                                  ? Border.all(
                                      color: Colors.black,
                                      width: 1,
                                      style: BorderStyle.solid,
                                      strokeAlign: BorderSide.strokeAlignCenter)
                                  : null,
                          borderRadius: BorderRadius.circular(20),
                          color: colorApp.colorinasta_face,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Stack(
                              alignment: AlignmentDirectional.center,
                              children: [
                                Container(
                                  margin:
                                      EdgeInsets.only(bottom: 10, right: 30),
                                  height: 40,
                                  width: 40,
                                  child:
                                      Image.asset("assets/images/instgram.png"),
                                ),
                                Container(
                                  margin: EdgeInsets.only(bottom: 10, left: 30),
                                  height: 40,
                                  width: 40,
                                  child:
                                      Image.asset("assets/images/facebook.png"),
                                ),
                              ],
                            ),
                            Text(val.languagebox.get("language") == "en"
                                ? "to gether"
                                : "كلاهما")
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: MaterialButton(
                      padding: EdgeInsets.all(5),
                      onPressed: () {
                        val.ChoseTypeCampain("instgram");
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: val.api.order_type_campain == "instgram"
                              ? Border.all(
                                  color: Colors.black,
                                  width: 1,
                                  style: BorderStyle.solid,
                                  strokeAlign: BorderSide.strokeAlignCenter)
                              : null,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: PlatForm(
                            text: val.languagebox.get("language") == "en"
                                ? "instgram"
                                : "انستجرام",
                            image: "assets/images/instgram.png",
                            color: colorApp.colorinstgram),
                      ),
                    ),
                  ),
                  Expanded(
                    child: MaterialButton(
                      padding: EdgeInsets.all(5),
                      onPressed: () {
                        val.ChoseTypeCampain("facebook");
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: val.api.order_type_campain == "facebook"
                              ? Border.all(
                                  color: Colors.black,
                                  width: 1,
                                  style: BorderStyle.solid,
                                  strokeAlign: BorderSide.strokeAlignCenter)
                              : null,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: PlatForm(
                            text: val.languagebox.get("language") == "en"
                                ? "facebook"
                                : "فيسبوك",
                            image: "assets/images/facebook.png",
                            color: colorApp.colorfacebook),
                      ),
                    ),
                  ),
                ],
              ),

              ////Form
              val.api.order_type_campain != ""
                  ? Form(
                      key: formstate,
                      child: Column(
                        children: [
                          val.api.order_type_campain == "instgram"
                              ? Container()
                              : Container(
                                  margin: EdgeInsets.only(top: 20),
                                  child: TextFormFiledVoteNotValied(
                                      hintText: val.languagebox
                                                  .get("language") ==
                                              "en"
                                          ? " link your advertising page on Facebook"
                                          : "أدخل رابط صفحتك الاعلانية علي فايسبوك",
                                      controll: val.api.link_facebook_campain,
                                      sufixicon: Container(
                                          padding: EdgeInsets.all(10),
                                          height: 20,
                                          width: 20,
                                          child: Image.asset(
                                              "assets/images/facebook.png")),
                                      keyboard: TextInputType.text),
                                ),
                          val.api.order_type_campain == "facebook"
                              ? Container()
                              : Container(
                                  margin: EdgeInsets.only(top: 0),
                                  child: TextFormFiledVoteNotValied(
                                      hintText: val.languagebox
                                                  .get("language") ==
                                              "en"
                                          ? "link your page on Instagram"
                                          : "أدخل رابط صفحتك الاعلانية علي انستجرام",
                                      controll: val.api.link_instgram_campain,
                                      sufixicon: Container(
                                          padding: EdgeInsets.all(10),
                                          height: 20,
                                          width: 20,
                                          child: Image.asset(
                                              "assets/images/instgram.png")),
                                      keyboard: TextInputType.text),
                                ),
                          val.api.order_type_campain == "instgram"
                              ? Container()
                              : Container(
                                  margin: EdgeInsets.symmetric(vertical: 0),
                                  child: TextFormFiledVote(
                                      hintText:
                                          val.languagebox.get("language") ==
                                                  "en"
                                              ? "post link facebook"
                                              : "ادخل رايط المنشور علي فيسبوك",
                                      controll:
                                          val.api.link_post_campain_facebook,
                                      sufixicon: Icon(Icons.link),
                                      keyboard: TextInputType.text),
                                ),
                          val.api.order_type_campain == "facebook"
                              ? Container()
                              : Container(
                                  margin: EdgeInsets.symmetric(vertical: 0),
                                  child: TextFormFiledVote(
                                      hintText:
                                          val.languagebox.get("language") ==
                                                  "en"
                                              ? "post link instgram"
                                              : "رابط المنشور علي انستجرام",
                                      controll:
                                          val.api.link_post_campain_instgram,
                                      sufixicon: Icon(Icons.link),
                                      keyboard: TextInputType.text),
                                ),
                          DrobDowenGoal(
                              selectedValue: val.selectedGoal,
                              dropdownItems: val.dropdownItemsGoal),
                          Container(
                            margin: EdgeInsets.only(right: 20, top: 20),
                            alignment: Alignment.topRight,
                            child: CircleAvatar(
                              backgroundColor:
                                  const Color.fromARGB(255, 239, 241, 255),
                              child: IconButton(
                                  onPressed: () {
                                    if (formstate.currentState!.validate()) {
                                      val.switchHome("campainnext");
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
                          )
                        ],
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      );
    });
  }
}
