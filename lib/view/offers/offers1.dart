import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mango/companent/container_chose_platform.dart';
import 'package:mango/companent/dialog.dart';
import 'package:mango/companent/drop_dowen_button.dart';
import 'package:mango/companent/text_field_vote.dart';
import 'package:mango/prov/prov.dart';
import 'package:provider/provider.dart';

class Offers1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Offers1();
  }
}

class _Offers1 extends State<Offers1> {
  DialogApp dialoge = new DialogApp();
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
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 20),
                alignment: Alignment.center,
                child: Text(
                  val.languagebox.get("language") == "en" ? "offers" : "عروض",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
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
              val.data_offers == null
                  ? CircularProgressIndicator()
                  : val.data_offers['message'] == "All Offers"
                      ? ListView.builder(
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          itemCount: val.data_offers['data']['data'].length,
                          itemBuilder: (context, i) {
                            return Container(
                              margin: EdgeInsets.only(top: 20),
                              padding: EdgeInsets.all(10),
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
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      MaterialButton(
                                          onPressed: () {
                                            dialoge.subscription(
                                                context,
                                                val.data_offers['data']['data']
                                                    [i]['id']);
                                          },
                                          child: Container(
                                            alignment: Alignment.center,
                                            width: 100,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: const Color.fromARGB(
                                                  255, 239, 241, 255),
                                            ),
                                            child: Text(val.languagebox
                                                        .get("language") ==
                                                    "en"
                                                ? "sub"
                                                : "اشتراك"),
                                          )),
                                      Expanded(child: Container()),
                                      Text(
                                        "${val.data_offers['data']['data'][i]['title']}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Container(
                                          margin: EdgeInsets.only(left: 10),
                                          height: 30,
                                          width: 30,
                                          child: Image.asset(
                                              "assets/images/boke.png"))
                                    ],
                                  ),
                                  ListTile(
                                    title: Text(
                                        style: TextStyle(fontSize: 15),
                                        "${val.data_offers['data']['data'][i]['description']}"),
                                    trailing: Text(
                                        style: TextStyle(fontSize: 13),
                                        val.languagebox.get("language") == "en"
                                            ? "description"
                                            : "الوصف"),
                                  ),
                                  ListTile(
                                    title: Text(
                                        style: TextStyle(fontSize: 15),
                                        "${val.data_offers['data']['data'][i]['price']}"),
                                    trailing: Text(
                                        style: TextStyle(fontSize: 13),
                                        val.languagebox.get("language") == "en"
                                            ? "salary"
                                            : "السعر"),
                                  ),
                                  ListTile(
                                    title: Text(
                                        style: TextStyle(fontSize: 15),
                                        "${val.data_offers['data']['data'][i]['num_of_reels']}"),
                                    trailing: Text(
                                        style: TextStyle(fontSize: 13),
                                        val.languagebox.get("language") == "en"
                                            ? "number vedio"
                                            : "عدد فديوهات"),
                                  ),
                                  ListTile(
                                    title: Text(
                                        style: TextStyle(fontSize: 15),
                                        val.data_offers['data']['data'][i]
                                                    ['status_campaign'] ==
                                                "true"
                                            ? val.languagebox.get("language") ==
                                                    "en"
                                                ? "active"
                                                : "مغعله"
                                            : val.languagebox.get("language") ==
                                                    "en"
                                                ? "not active"
                                                : "غير مفعله"),
                                    trailing: Text(
                                        style: TextStyle(fontSize: 13),
                                        val.languagebox.get("language") == "en"
                                            ? "Campaign"
                                            : "حاله الحملات"),
                                  ),
                                ],
                              ),
                            );
                          })
                      : Center(
                          child: Text(
                            val.languagebox.get("language") == "en"
                                ? "No Offers"
                                : "لا بوجد",
                            style: TextStyle(color: Colors.grey),
                          ),
                        )
            ],
          ),
        ),
      );
    });
  }
}
