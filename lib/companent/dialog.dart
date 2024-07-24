import 'package:flutter/material.dart';
import 'package:mango/companent/colors.dart';
import 'package:mango/prov/prov.dart';
import 'package:provider/provider.dart';

class DialogApp {
  ColorsApp colorApp = new ColorsApp();
  Future<void> subscription(BuildContext context, int id) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Consumer<control>(builder: (context, val, child) {
          return AlertDialog(
            backgroundColor: Colors.white,
            shadowColor: Colors.white,

            scrollable: true,
            // titleTextStyle: TextStyle(fontSize: 20, color: Colors.black),
            // title: Text('Verify'),
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
                        val.languagebox.get("language") == "en"
                            ? "Confirm"
                            : "تاكيد تفعيل الاشتراك",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )),
            actions: <Widget>[
              Consumer<control>(builder: (context, val, child) {
                return Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 30,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: colorApp.coloryelloApp,
                      ),
                      child: MaterialButton(
                        child: Text(
                          val.languagebox.get("language") == "en"
                              ? "Sure"
                              : "تاكيد",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                          val.OrderOffers(id);
                          Offers(context);
                        },
                      ),
                    ),
                    Expanded(child: Container()),
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
                            val.languagebox.get("language") == "en"
                                ? "back"
                                : "رجوع",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      );
                    }),
                  ],
                );
              }),
            ],
          );
        });
      },
    );
  }

  Future<void> Vote(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Consumer<control>(builder: (context, val, child) {
          // val.vote['message'] == "Poll Created Successfully"?
          return AlertDialog(
            backgroundColor: Colors.white,
            shadowColor: Colors.white,

            scrollable: true,
            // titleTextStyle: TextStyle(fontSize: 20, color: Colors.black),
            // title: Text('Verify'),
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
                        child: val.vote == null
                            ? CircularProgressIndicator(
                                color: colorApp.coloryelloApp,
                              )
                            : val.vote['message'] == "Poll Created Successfully"
                                ? Text(
                                    val.languagebox.get("language") == "en"
                                        ? "has been sent"
                                        : "تم الارسال",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: colorApp.colorgreenApp))
                                : Text(
                                    val.languagebox.get("language") == "en"
                                        ? "Error"
                                        : "خطاء",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red))),
                  ],
                )),
            actions: <Widget>[
              val.vote == null
                  ? Consumer<control>(builder: (context, val, child) {
                      return MaterialButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 30,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: colorApp.coloryelloApp,
                          ),
                          child: Text(
                            val.languagebox.get("language") == "en"
                                ? "Back"
                                : "رجوع",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      );
                    })
                  : val.vote['message'] == "Poll Created Successfully"
                      ? Consumer<control>(builder: (context, val, child) {
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
                                val.languagebox.get("language") == "en"
                                    ? "Enter"
                                    : 'دخول',
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () {
                                val.switch_log_reg();
                                val.statusbox.get("status") == null ||
                                        val.statusbox.get("status") == "0"
                                    ? Navigator.of(context)
                                        .pushNamedAndRemoveUntil(
                                            "switch", (route) => false)
                                    : Navigator.of(context)
                                        .pushNamedAndRemoveUntil(
                                            "home", (route) => false);
                                ;
                              },
                            ),
                          );
                        })
                      : Consumer<control>(builder: (context, val, child) {
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
                                val.languagebox.get("language") == "en"
                                    ? "Back"
                                    : "رجوع",
                                style: TextStyle(color: Colors.white),
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

  Future<void> Campain(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Consumer<control>(builder: (context, val, child) {
          // val.vote['message'] == "Poll Created Successfully"?
          return AlertDialog(
            backgroundColor: Colors.white,
            shadowColor: Colors.white,

            scrollable: true,
            // titleTextStyle: TextStyle(fontSize: 20, color: Colors.black),
            // title: Text('Verify'),
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
                        child: val.campain == null
                            ? CircularProgressIndicator(
                                color: colorApp.coloryelloApp,
                              )
                            : val.campain['message'] ==
                                    "The advertising campaign has been requested successfully. We will contact you"
                                ? Text(
                                    val.languagebox.get("language") == "en"
                                        ? "has been sent"
                                        : "تم الارسال",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: colorApp.colorgreenApp))
                                : val.campain['message'] ==
                                        "User has no Subscription"
                                    ? Text(
                                        textAlign:TextAlign.center,
                                        val.languagebox.get("language") == "en"
                                            ? "No subscription. Subscribe to an offer, renew your current subscription, or contact support."
                                            : "لا يوجد اشتراك اشترك في عرض او جدد اشتراكك الحالي او اتصل بالدعم",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red))
                                    : Text(
                                        val.languagebox.get("language") == "en"
                                            ? "error"
                                            : "خطاء",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red))),
                  ],
                )),
            actions: <Widget>[
              val.campain == null
                  ? Consumer<control>(builder: (context, val, child) {
                      return MaterialButton(
                        onPressed: () {},
                        child: Container(
                          alignment: Alignment.center,
                          height: 30,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: colorApp.coloryelloApp,
                          ),
                          child: Text(
                            val.languagebox.get("language") == "en"
                                ? "Back"
                                : "رجوع",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      );
                    })
                  : val.campain['message'] ==
                          "The advertising campaign has been requested successfully. We will contact you"
                      ? Consumer<control>(builder: (context, val, child) {
                          return Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: colorApp.coloryelloApp,
                            ),
                            child: MaterialButton(
                              child: Text(
                                val.languagebox.get("language") == "en"
                                    ? "Complet"
                                    : "تم",
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                                val.switchHome("campain");
                              },
                            ),
                          );
                        })
                      : Consumer<control>(builder: (context, val, child) {
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
                                val.languagebox.get("language") == "en"
                                    ? "Back"
                                    : "رجوع",
                                style: TextStyle(color: Colors.white),
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

  Future<void> Reals(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Consumer<control>(builder: (context, val, child) {
          // val.vote['message'] == "Poll Created Successfully"?
          return AlertDialog(
            backgroundColor: Colors.white,
            shadowColor: Colors.white,

            scrollable: true,
            // titleTextStyle: TextStyle(fontSize: 20, color: Colors.black),
            // title: Text('Verify'),
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
                        child: val.reals == null
                            ? CircularProgressIndicator(
                                color: colorApp.coloryelloApp,
                              )
                            : val.reals['message'] ==
                                    "The Reels has been requested successfully. We will contact you"
                                ? Text(
                                    val.languagebox.get("language") == "en"
                                        ? "has been sent"
                                        : "تم الارسال",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: colorApp.colorgreenApp))
                                : val.reals['message'] ==
                                        "User has no Subscription"
                                    ? Text(
                                        val.languagebox.get("language") == "en"
                                            ? "you no Subscription"
                                            : "لا يوجد اشتراك",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red))
                                    : Text(
                                        val.languagebox.get("language") == "en"
                                            ? "error"
                                            : "خطاء",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red))),
                  ],
                )),
            actions: <Widget>[
              val.reals == null
                  ? Consumer<control>(builder: (context, val, child) {
                      return MaterialButton(
                        onPressed: () {},
                        child: Container(
                          alignment: Alignment.center,
                          height: 30,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: colorApp.coloryelloApp,
                          ),
                          child: Text(
                            val.languagebox.get("language") == "en"
                                ? "Back"
                                : "رجوع",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      );
                    })
                  : val.reals['message'] ==
                          "The Reels has been requested successfully. We will contact you"
                      ? Consumer<control>(builder: (context, val, child) {
                          return Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: colorApp.coloryelloApp,
                            ),
                            child: MaterialButton(
                              child: Text(
                                val.languagebox.get("language") == "en"
                                    ? "Complet"
                                    : "تم",
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                                val.switchHome("reals");
                              },
                            ),
                          );
                        })
                      : Consumer<control>(builder: (context, val, child) {
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
                                val.languagebox.get("language") == "en"
                                    ? "Back"
                                    : "رجوع",
                                style: TextStyle(color: Colors.white),
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

  Future<void> Offers(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Consumer<control>(builder: (context, val, child) {
          // val.vote['message'] == "Poll Created Successfully"?
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
                        child: val.orderOffers == null
                            ? CircularProgressIndicator(
                                color: colorApp.coloryelloApp,
                              )
                            : val.orderOffers['message'] ==
                                    "Subscription added successfully."
                                ? Text(
                                    val.languagebox.get("language") == "en"
                                        ? "Subscribed"
                                        : "تم الاشتراك",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: colorApp.colorgreenApp))
                                : val.orderOffers['message'] ==
                                        "User account not active."
                                    ? Text(
                                        textAlign: TextAlign.center,
                                        val.languagebox.get("language") == "en"
                                            ? "Your account not active Call Suport Or Wait And Them Contact With You."
                                            : "حسابك غير نشط اتصل بالدعم أو انتظر وسيتواصلون معك",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red))
                                    : val.orderOffers['message'] ==
                                            "User has subscriptions."
                                        ? Text(
                                            textAlign: TextAlign.center,
                                            val.languagebox.get("language") ==
                                                    "en"
                                                ? "You are a subscriber. You cannot send a new subscription request."
                                                : "انت مشترك لا يمكن ارسال طلب اشتراك جديد",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.red))
                                        : Text(
                                            textAlign: TextAlign.center,
                                            val.languagebox.get("language") ==
                                                    "en"
                                                ? "Error resubscribe"
                                                : "خطاء اعد الاشتراك",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.red))),
                  ],
                )),
            actions: <Widget>[
              val.orderOffers == null
                  ? Consumer<control>(builder: (context, val, child) {
                      return MaterialButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 30,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: colorApp.coloryelloApp,
                          ),
                          child: Text(
                            val.languagebox.get("language") == "en"
                                ? "Back"
                                : "رجوع",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      );
                    })
                  : val.orderOffers['message'] ==
                          "The Order has been requested successfully. We will contact you"
                      ? Consumer<control>(builder: (context, val, child) {
                          return Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: colorApp.coloryelloApp,
                            ),
                            child: MaterialButton(
                              child: Text(
                                val.languagebox.get("language") == "en"
                                    ? "Complet"
                                    : "تم",
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          );
                        })
                      : Consumer<control>(builder: (context, val, child) {
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
                                val.languagebox.get("language") == "en"
                                    ? "Back"
                                    : "رجوع",
                                style: TextStyle(color: Colors.white),
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
