import 'package:flutter/material.dart';
import 'package:mango/companent/colors.dart';
import 'package:mango/prov/prov.dart';
import 'package:provider/provider.dart';

class DialogProfile {
  ColorsApp colorApp = new ColorsApp();
  Future<void> logout(BuildContext context) async {
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
                        val.languagebox.get("language") == "en"
                            ? "Logout"
                            : "تسجيل الخروج",
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
                          val.Logout();
                          Navigator.of(context).pop();
                          checkLogout(context);
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
                                ? "cancel"
                                : "الغاء",
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

  Future<void> checkLogout(BuildContext context) async {
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
                        child: val.logout == null
                            ? CircularProgressIndicator(
                                color: colorApp.coloryelloApp,
                              )
                            : val.logout['message'] ==
                                    "User Logged Out Successfuly"
                                ? Text(
                                    val.languagebox.get("language") == "en"
                                        ? "Complet Logout"
                                        : "تم تسجيل الخروج",
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
              val.logout == null
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
                  : val.logout['message'] == "User Logged Out Successfuly"
                      ? Consumer<control>(builder: (context, val, child) {
                          return Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: colorApp.coloryelloApp,
                            ),
                            child: MaterialButton(
                              child: Text(
                                val.languagebox.get("language") == "en"
                                    ? "complete"
                                    : "تم",
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () {
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                    "language", (route) => false);
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

  //edit image
  Future<void> editImage(BuildContext context) async {
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
                    //add image
                    MaterialButton(
                      onPressed: () {
                        val.getPhotoProfile();
                      },
                      child: Container(
                        height: 150,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.black,
                              width: 1,
                              style: BorderStyle.solid,
                              strokeAlign: BorderSide.strokeAlignCenter),
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(255, 250, 250, 250),
                        ),
                        child: val.imageprofile == null
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(bottom: 10),
                                    height: 40,
                                    width: 40,
                                    child: Icon(Icons.add_a_photo),
                                  ),
                                  Text(val.languagebox.get("language") == "en"
                                      ? 'add image'
                                      : 'اضافه صوره')
                                ],
                              )
                            : Image.file(val.imageprofile!),
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
                          val.uploudImageProfile();
                          Navigator.of(context).pop();
                          checkEditImage(context);
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
                                ? "cancel"
                                : "الغاء",
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

  Future<void> checkEditImage(BuildContext context) async {
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
                        child: val.imageprof == null
                            ? CircularProgressIndicator(
                                color: colorApp.coloryelloApp,
                              )
                            : val.imageprof['message'] ==
                                    "Image updated successfully."
                                ? Text(
                                    val.languagebox.get("language") == "en"
                                        ? "Complet Upload"
                                        : "تم رفع الصوره",
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
              val.imageprof == null
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
                  : val.imageprof['message'] == "Image updated successfully."
                      ? Consumer<control>(builder: (context, val, child) {
                          return Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: colorApp.coloryelloApp,
                            ),
                            child: MaterialButton(
                              child: Text(
                                val.languagebox.get("language") == "en"
                                    ? "complete"
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

  // cansel
  Future<void> Cansel(BuildContext context, String subscription_id) async {
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
                    Text(
                      val.languagebox.get("language") == "en"
                          ? "unsubscribe"
                          : "الغاء الاشتراك",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    )
                  ],
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
                      val.languagebox.get("language") == "en"
                          ? "sure"
                          : "تاكيد",
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () {
                      val.Cansel(subscription_id);
                      Navigator.of(context).pop();
                      CheckCansel(context);
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

  Future<void> CheckCansel(BuildContext context) async {
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
                    val.cansel == null
                        ? CircularProgressIndicator()
                        : Container(
                            child: val.cansel['message'] == "success"
                                ? Text(
                                    "تم الارسال",
                                    style: TextStyle(
                                        color: colorApp.colorgreenApp,
                                        fontWeight: FontWeight.bold),
                                  )
                                : Text(
                                    "خطاء",
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold),
                                  ),
                          )
                  ],
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
                      "تم",
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

  //return_sup
  Future<void> ReturnSup(BuildContext context) async {
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
                    Text(
                      val.languagebox.get("language") == "en"
                          ? "subscribe"
                          : "اشتراك",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    )
                  ],
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
                      val.languagebox.get("language") == "en"
                          ? "sure"
                          : "تاكيد",
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () {
                      val.ReturnSup();
                      Navigator.of(context).pop();
                      CheckReturnSup(context);
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

  Future<void> CheckReturnSup(BuildContext context) async {
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
                    val.return_sup == null
                        ? CircularProgressIndicator()
                        : Container(
                            child: val.return_sup['message'] ==
                                    "Subscription activated successfully."
                                ? Text(
                                    "تم الارسال",
                                    style: TextStyle(
                                        color: colorApp.colorgreenApp,
                                        fontWeight: FontWeight.bold),
                                  )
                                : Text(
                                    "خطاء",
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold),
                                  ),
                          )
                  ],
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
                      "تم",
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

  Future<void> DetailsSub(BuildContext context) async {
    DialogProfile dialogProfile = new DialogProfile();
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
              leading: val.data_client_profile["data"]['latest_subscription']
                          ['accept'] ==
                      "true"
                  ? val.data_client_profile["data"]['latest_subscription']
                              ['subscription_status'] ==
                          "sub"
                      ? IconButton(
                          onPressed: () {
                            //edit in here
                            dialogProfile.Cansel(
                                context,
                                val.data_client_profile["data"]
                                        ['latest_subscription']['id']
                                    .toString());
                          },
                          icon: Icon(Icons.cancel))
                      : IconButton(
                          onPressed: () {
                            dialogProfile.ReturnSup(context);
                          },
                          icon: Icon(Icons.refresh))
                  : Icon(Icons.lock_clock),
              title: Text(
                  style: TextStyle(fontSize: 15),
                  val.data_client_profile["data"]['latest_subscription']
                              ['accept'] ==
                          "true"
                      ? val.data_client_profile["data"]['latest_subscription']
                                  ['subscription_status'] ==
                              "sub"
                          ? "${val.data_client_profile["data"]['latest_subscription']['title']} مفعله وتم الموافقه"
                          : "${val.data_client_profile["data"]['latest_subscription']['title']} غير مفعله وتم الموافقه"
                      : "${val.data_client_profile["data"]['latest_subscription']['title']} انتظر تتم مراجعه طلبك"),
            ),
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
                      title: Text(
                          style: TextStyle(fontSize: 15),
                          "${val.data_client_profile["data"]['latest_subscription']['description']}"),
                      trailing: Text(
                          style: TextStyle(fontSize: 13),
                          val.languagebox.get("language") == "en"
                              ? "description"
                              : "الوصف"),
                    ),
                    val.data_client_profile["data"]['latest_subscription']
                                ['pay_date'] ==
                            null
                        ? SizedBox()
                        : ListTile(
                            title: Text(
                                style: TextStyle(fontSize: 15),
                                "${val.data_client_profile["data"]['latest_subscription']['pay_date']}"),
                            trailing: Text(
                                style: TextStyle(fontSize: 13),
                                val.languagebox.get("language") == "en"
                                    ? "date pay"
                                    : "تاريخ الدفع"),
                          ),
                    ListTile(
                      title: Text(
                          style: TextStyle(fontSize: 15),
                          "${val.data_client_profile["data"]['latest_subscription']['price_sub_monthe']}"),
                      trailing: Text(
                          style: TextStyle(fontSize: 13),
                          val.languagebox.get("language") == "en"
                              ? "salary"
                              : "السعر"),
                    ),
                    ListTile(
                      title: Text(
                          style: TextStyle(fontSize: 15),
                          "${val.data_client_profile["data"]['latest_subscription']['num_of_reels']}"),
                      trailing: Text(
                          style: TextStyle(fontSize: 13),
                          val.languagebox.get("language") == "en"
                              ? "number vedio"
                              : "عدد فيديوهات"),
                    ),
                    ListTile(
                      title: Text(
                          style: TextStyle(fontSize: 15),
                          val.data_client_profile["data"]['latest_subscription']
                                      ['status_campaign'] ==
                                  "true"
                              ? val.languagebox.get("language") == "en"
                                  ? "active"
                                  : "مغعله"
                              : val.languagebox.get("language") == "en"
                                  ? "not active"
                                  : "غير مفعله"),
                      trailing: Text(
                          style: TextStyle(fontSize: 13),
                          val.languagebox.get("language") == "en"
                              ? "Campaign"
                              : "حاله الحملات"),
                    ),
                    val.data_client_profile["data"]['latest_subscription']
                                ['price_days'] ==
                            0
                        ? SizedBox()
                        : ListTile(
                            title: Text(
                                style: TextStyle(fontSize: 15),
                                "${val.data_client_profile["data"]['latest_subscription']['price_days']}"),
                            trailing: Text(
                                style: TextStyle(fontSize: 13),
                                val.languagebox.get("language") == "en"
                                    ? "salary subscription"
                                    : "مبلغ الاشتراك"),
                          ),
                  ],
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
