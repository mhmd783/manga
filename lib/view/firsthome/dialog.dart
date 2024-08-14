import 'package:flutter/material.dart';
import 'package:mango/companent/colors.dart';
import 'package:mango/prov/prov.dart';
import 'package:provider/provider.dart';

class DialogFirstHome {
  ColorsApp colorApp = new ColorsApp();
  Future<void> MessageNotAvalible(BuildContext context) async {
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
                child: Column(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      child: Image.asset("assets/images/mango.png"),
                    ),
                    Container(
                      height: 50,
                      width:
                          val.languagebox.get("language") == "en" ? 150 : 100,
                      child: Image.asset(
                        val.languagebox.get("language") == "en"
                            ? "assets/images/mangomedia2.png"
                            : "assets/images/mangomedia.png",
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Divider(
                        height: 1,
                        color: Colors.grey.shade300,
                        thickness: 2,
                        endIndent: 50,
                        indent: 50,
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 20),
                        alignment: Alignment.center,
                        child: Text(
                            textAlign: TextAlign.center,
                            val.languagebox.get("language") == "en"
                                ? "This service is not currently available in the system. You can request it directly from the company."
                                : "هذه الخدمة غير متوفرة  في النظام حاليا يمكنك طلبها مباشرة من الشركه",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black))),
                  ],
                )),
            actions: <Widget>[
              Consumer<control>(builder: (context, val, child) {
                return Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: colorApp.coloryelloApp,
                  ),
                  child: MaterialButton(
                    child: Text(
                      val.languagebox.get("language") == "en"
                          ? "Customer Service"
                          : "خدمه العملاء",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pushNamed("suport");
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
