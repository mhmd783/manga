import 'package:flutter/material.dart';
import 'package:mango/companent/colors.dart';
import 'package:mango/prov/prov.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class DialogOrders {
  ColorsApp colorApp = new ColorsApp();

  Future<void> DetailsOrderCampaign(BuildContext context, int i) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Consumer<control>(builder: (context, val, child) {
          return AlertDialog(
            backgroundColor: Colors.white,
            shadowColor: Colors.white,
            scrollable: true,
            elevation: 10,
            
            content: Container(
                padding: EdgeInsets.only(top: 20),
                alignment: Alignment.center,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        child: Image.asset("assets/images/mango.png"),
                      ),
                      Container(
                        height: 50,
                        width: 100,
                        child: Image.asset(
                          "assets/images/mangomedia.png",
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: Divider(
                          height: 1,
                          color: Colors.grey.shade300,
                          thickness: 2,
                          endIndent: 100,
                          indent: 100,
                        ),
                      ),
                      ListTile(
                        subtitle: Text(
                            textAlign: val.languagebox.get("language") == "en"
                                ? TextAlign.start
                                : TextAlign.end,
                            style: TextStyle(fontSize: 15),
                            "${val.data_client_profile["data"]['advertising_campaigns'][i]['order_type']}"),
                        title: Text(
                            textAlign: val.languagebox.get("language") == "en"
                                ? TextAlign.start
                                : TextAlign.end,
                            style: TextStyle(fontSize: 13),
                            val.languagebox.get("language") == "en"
                                ? "Platform"
                                : "المنصه"),
                      ),
                      ListTile(
                        subtitle: TextButton(
                          onPressed: () async {
                            final Uri _url = Uri.parse(
                                '${val.data_client_profile["data"]['advertising_campaigns'][i]['instagram_link']}');
                            Uri url = Uri.parse(
                                '${val.data_client_profile["data"]['advertising_campaigns'][i]['instagram_link']}');
                            if (await canLaunchUrl(url)) {
                              if (!await launchUrl(url)) {
                                throw Exception('Could not launch $_url');
                              }
                            }
                          },
                          child: Text(
                              textAlign: val.languagebox.get("language") == "en"
                                  ? TextAlign.start
                                  : TextAlign.end,
                              style: TextStyle(fontSize: 15),
                              "${val.data_client_profile["data"]['advertising_campaigns'][i]['instagram_link']}"),
                        ),
                        title: Text(
                            textAlign: val.languagebox.get("language") == "en"
                                ? TextAlign.start
                                : TextAlign.end,
                            style: TextStyle(fontSize: 13),
                            val.languagebox.get("language") == "en"
                                ? "Instagram page link"
                                : " رابط صفحة انستجرام"),
                      ),
                      ListTile(
                        subtitle: TextButton(
                          onPressed: () async {
                            final Uri _url = Uri.parse(
                                '${val.data_client_profile["data"]['advertising_campaigns'][i]['facebook_link']}');
                            Uri url = Uri.parse(
                                '${val.data_client_profile["data"]['advertising_campaigns'][i]['facebook_link']}');
                            if (await canLaunchUrl(url)) {
                              if (!await launchUrl(url)) {
                                throw Exception('Could not launch $_url');
                              }
                            }
                          },
                          child: Text(
                              textAlign: val.languagebox.get("language") == "en"
                                  ? TextAlign.start
                                  : TextAlign.end,
                              style: TextStyle(fontSize: 15),
                              "${val.data_client_profile["data"]['advertising_campaigns'][i]['facebook_link']}"),
                        ),
                        title: Text(
                            textAlign: val.languagebox.get("language") == "en"
                                ? TextAlign.start
                                : TextAlign.end,
                            style: TextStyle(fontSize: 13),
                            val.languagebox.get("language") == "en"
                                ? "Facebook page link"
                                : " رابط صفحة فيسبوك"),
                      ),ListTile(
                        subtitle: TextButton(
                          onPressed: () async {
                            final Uri _url = Uri.parse(
                                '${val.data_client_profile["data"]['advertising_campaigns'][i]['instagram_post_link']}');
                            Uri url = Uri.parse(
                                '${val.data_client_profile["data"]['advertising_campaigns'][i]['instagram_post_link']}');
                            if (await canLaunchUrl(url)) {
                              if (!await launchUrl(url)) {
                                throw Exception('Could not launch $_url');
                              }
                            }
                          },
                          child: Text(
                              textAlign: val.languagebox.get("language") == "en"
                                  ? TextAlign.start
                                  : TextAlign.end,
                              style: TextStyle(fontSize: 15),
                              "${val.data_client_profile["data"]['advertising_campaigns'][i]['instagram_post_link']}"),
                        ),
                        title: Text(
                            textAlign: val.languagebox.get("language") == "en"
                                ? TextAlign.start
                                : TextAlign.end,
                            style: TextStyle(fontSize: 13),
                            val.languagebox.get("language") == "en"
                                ? "instagram post link"
                                : " رابط منشور انستجرام"),
                      ),
                      ListTile(
                        subtitle: TextButton(
                          onPressed: () async {
                            final Uri _url = Uri.parse(
                                '${val.data_client_profile["data"]['advertising_campaigns'][i]['facebook_post_link']}');
                            Uri url = Uri.parse(
                                '${val.data_client_profile["data"]['advertising_campaigns'][i]['facebook_post_link']}');
                            if (await canLaunchUrl(url)) {
                              if (!await launchUrl(url)) {
                                throw Exception('Could not launch $_url');
                              }
                            }
                          },
                          child: Text(
                              textAlign: val.languagebox.get("language") == "en"
                                  ? TextAlign.start
                                  : TextAlign.end,
                              style: TextStyle(fontSize: 15),
                              "${val.data_client_profile["data"]['advertising_campaigns'][i]['facebook_post_link']}"),
                        ),
                        title: Text(
                            textAlign: val.languagebox.get("language") == "en"
                                ? TextAlign.start
                                : TextAlign.end,
                            style: TextStyle(fontSize: 13),
                            val.languagebox.get("language") == "en"
                                ? "Facebook post link"
                                : " رابط منشور فيسبوك"),
                      ),
                      ///
                      ListTile(
                        subtitle: Text(
                            textAlign: val.languagebox.get("language") == "en"
                                ? TextAlign.start
                                : TextAlign.end,
                            style: TextStyle(fontSize: 15),
                            "${val.data_client_profile["data"]['advertising_campaigns'][i]['target']}"),
                        title: Text(
                            textAlign: val.languagebox.get("language") == "en"
                                ? TextAlign.start
                                : TextAlign.end,
                            style: TextStyle(fontSize: 13),
                            val.languagebox.get("language") == "en"
                                ? "The goal of the campaign"
                                : "الهدف من الحملة"),
                      ),
                      ListTile(
                        subtitle: Text(
                            textAlign: val.languagebox.get("language") == "en"
                                ? TextAlign.start
                                : TextAlign.end,
                            style: TextStyle(fontSize: 15),
                            "${val.data_client_profile["data"]['advertising_campaigns'][i]['day_price']}"),
                        title: Text(
                            textAlign: val.languagebox.get("language") == "en"
                                ? TextAlign.start
                                : TextAlign.end,
                            style: TextStyle(fontSize: 13),
                            val.languagebox.get("language") == "en"
                                ? "daily budget"
                                : "الميزانية اليومية"),
                      ),
                      ListTile(
                        subtitle: Text(
                            textAlign: val.languagebox.get("language") == "en"
                                ? TextAlign.start
                                : TextAlign.end,
                            style: TextStyle(fontSize: 15),
                            "${val.data_client_profile["data"]['advertising_campaigns'][i]['target_area']}"),
                        title: Text(
                            textAlign: val.languagebox.get("language") == "en"
                                ? TextAlign.start
                                : TextAlign.end,
                            style: TextStyle(fontSize: 13),
                            val.languagebox.get("language") == "en"
                                ? "the target audience"
                                : "الجمهور المستهدف"),
                      ),
                    ],
                  ),
                )),
            actions: <Widget>[
              Consumer<control>(builder: (context, val, child) {
                return Container(
                  alignment: Alignment.center,
                  height: 30,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: colorApp.coloryelloApp,
                  ),
                  child: MaterialButton(
                    child: Text(
                      val.languagebox.get("language") == "en" ? "back" : "رجوع",
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                );
              }),
            ],
          );
        });
      },
    );
  }
  Future<void> DetailsOrderReels(BuildContext context, int i) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Consumer<control>(builder: (context, val, child) {
          return AlertDialog(
            backgroundColor: Colors.white,
            shadowColor: Colors.white,
            scrollable: true,
            elevation: 10,
            title: ListTile(

              title: Text(
                  style: TextStyle(fontSize: 15),
                  val.languagebox.get("language") == "en"
                              ?"Reels":"فيديو"),
            ),
            content: Container(
                padding: EdgeInsets.only(top: 20),
                alignment: Alignment.center,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        child: Image.asset("assets/images/mango.png"),
                      ),
                      Container(
                        height: 50,
                        width: 100,
                        child: Image.asset(
                          "assets/images/mangomedia.png",
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: Divider(
                          height: 1,
                          color: Colors.grey.shade300,
                          thickness: 2,
                          endIndent: 100,
                          indent: 100,
                        ),
                      ),
                      ListTile(
                        subtitle: Text(
                            textAlign: val.languagebox.get("language") == "en"
                                ? TextAlign.start
                                : TextAlign.end,
                            style: TextStyle(fontSize: 15),
                            "${val.data_client_profile["data"]['reels'][i]['product_name']}"),
                        title: Text(
                            textAlign: val.languagebox.get("language") == "en"
                                ? TextAlign.start
                                : TextAlign.end,
                            style: TextStyle(fontSize: 13),
                            val.languagebox.get("language") == "en"
                                ? "product name"
                                : "اسم المنتج"),
                      ),
                      
                      ListTile(
                        subtitle: Text(
                            textAlign: val.languagebox.get("language") == "en"
                                ? TextAlign.start
                                : TextAlign.end,
                            style: TextStyle(fontSize: 15),
                            "${val.data_client_profile["data"]['reels'][i]['product_description']}"),
                        title: Text(
                            textAlign: val.languagebox.get("language") == "en"
                                ? TextAlign.start
                                : TextAlign.end,
                            style: TextStyle(fontSize: 13),
                            val.languagebox.get("language") == "en"
                                ? "product description"
                                : "وصف المنتج"),
                      ),
                      ListTile(
                        subtitle: Text(
                            textAlign: val.languagebox.get("language") == "en"
                                ? TextAlign.start
                                : TextAlign.end,
                            style: TextStyle(fontSize: 15),
                            "${val.data_client_profile["data"]['reels'][i]['product_usage']}"),
                        title: Text(
                            textAlign: val.languagebox.get("language") == "en"
                                ? TextAlign.start
                                : TextAlign.end,
                            style: TextStyle(fontSize: 13),
                            val.languagebox.get("language") == "en"
                                ? "product usage"
                                : "طريقه الاستخدام"),
                      ),
                      ListTile(
                        subtitle: Text(
                            textAlign: val.languagebox.get("language") == "en"
                                ? TextAlign.start
                                : TextAlign.end,
                            style: TextStyle(fontSize: 15),
                            "${val.data_client_profile["data"]['reels'][i]['product_price']}"),
                        title: Text(
                            textAlign: val.languagebox.get("language") == "en"
                                ? TextAlign.start
                                : TextAlign.end,
                            style: TextStyle(fontSize: 13),
                            val.languagebox.get("language") == "en"
                                ? "product price"
                                : "سعر المنتج"),
                      ),ListTile(
                        subtitle: Text(
                            textAlign: val.languagebox.get("language") == "en"
                                ? TextAlign.start
                                : TextAlign.end,
                            style: TextStyle(fontSize: 15),
                            "${val.data_client_profile["data"]['reels'][i]['offers']}"),
                        title: Text(
                            textAlign: val.languagebox.get("language") == "en"
                                ? TextAlign.start
                                : TextAlign.end,
                            style: TextStyle(fontSize: 13),
                            val.languagebox.get("language") == "en"
                                ? "offers"
                                : "العروض"),
                      ),ListTile(
                        subtitle: Text(
                            textAlign: val.languagebox.get("language") == "en"
                                ? TextAlign.start
                                : TextAlign.end,
                            style: TextStyle(fontSize: 15),
                            "${val.data_client_profile["data"]['reels'][i]['gift']}"),
                        title: Text(
                            textAlign: val.languagebox.get("language") == "en"
                                ? TextAlign.start
                                : TextAlign.end,
                            style: TextStyle(fontSize: 13),
                            val.languagebox.get("language") == "en"
                                ? "gifts"
                                : "الهدايا"),
                      ),
                    ],
                  ),
                )),
            actions: <Widget>[
              Consumer<control>(builder: (context, val, child) {
                return Container(
                  alignment: Alignment.center,
                  height: 30,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: colorApp.coloryelloApp,
                  ),
                  child: MaterialButton(
                    child: Text(
                      val.languagebox.get("language") == "en" ? "back" : "رجوع",
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                );
              }),
            ],
          );
        });
      },
    );
  }

  
}
