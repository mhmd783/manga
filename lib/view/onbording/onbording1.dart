import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mango/companent/colors.dart';
import 'package:mango/prov/prov.dart';
import 'package:provider/provider.dart';

class OnBording1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _OnBording1();
  }
}

class _OnBording1 extends State<OnBording1> {
  ColorsApp colorApp = new ColorsApp();
  double hi = 50;
  double wi = 50;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(microseconds: 5), () {
      setState(() {
        hi = 200; // الارتفاع المراد
        wi = 200; // العرض المراد
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double valrot = -1.0;
    return Consumer<control>(builder: (context, val, child) {
      return Scaffold(
        body: SafeArea(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.white,
                  Colors.white,
                  Colors.white,
                  colorApp.colorbodygreen,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            //////
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        //design
                        //circle
                        Stack(
                          alignment: AlignmentDirectional.center,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height / 2,
                              width: double.infinity,
                              child: Row(
                                children: [
                                  Transform.translate(
                                      offset: Offset(-70, -230),
                                      child: Container(
                                        height: 170,
                                        width: 170,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 2,
                                                color: const Color.fromARGB(
                                                    255, 221, 221, 1)),
                                            borderRadius:
                                                BorderRadius.circular(100)),
                                      )),
                                  Expanded(child: Container()),
                                  Transform.translate(
                                      offset: Offset(120, 0),
                                      child: Container(
                                        height: 170,
                                        width: 170,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 2,
                                                color: Color.fromARGB(
                                                    223, 163, 198, 221)),
                                            borderRadius:
                                                BorderRadius.circular(100)),
                                      )),
                                ],
                              ),
                            ),
                            ////////images
                            Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 20),
                                  alignment: Alignment.topRight,
                                  width: double.infinity,
                                  height: 60,
                                  child: IconButton(
                                      onPressed: () {
                                        Navigator.of(context)
                                            .pushNamed("onbording2");
                                      },
                                      icon: Icon(
                                        Icons.arrow_forward_ios_outlined,
                                      )),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 50),
                                  width: 300,
                                  child: Row(
                                    children: [
                                      Transform.translate(
                                          offset: Offset(-20, -30),
                                          child: Transform.rotate(
                                            origin: Offset(0, 0),
                                            angle: valrot,
                                            child: Container(
                                              height: 30,
                                              width: 30,
                                              child: Image.asset(
                                                  "assets/images/facebook.png"),
                                            ),
                                          )),
                                      Column(
                                        children: [
                                          Transform.translate(
                                            offset: Offset(100, -10),
                                            child: Transform.rotate(
                                                origin: Offset(0, 0),
                                                angle: valrot,
                                                child: Container(
                                                  height: 25,
                                                  width: 25,
                                                  child: Image.asset(
                                                      "assets/images/instgram.png"),
                                                )),
                                          ),
                                          AnimatedContainer(
                                            duration: Duration(seconds: 2),
                                            curve: Curves.ease,
                                            height: hi,
                                            width: wi,
                                            child: Image.asset(
                                              "assets/images/onboardingimage1.png",
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Transform.translate(
                                              offset: Offset(-50, 30),
                                              child: Container(
                                                height: 30,
                                                width: 30,
                                                child: Image.asset(
                                                    "assets/images/whatsapp.png"),
                                              )),
                                        ],
                                      ),
                                      Transform.translate(
                                          offset: Offset(40, 200),
                                          child: Container(
                                            height: 25,
                                            width: 25,
                                            child: Image.asset(
                                                "assets/images/cool.png"),
                                          )),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        //text
                        Container(
                          height: MediaQuery.of(context).size.height / 10,
                          width: double.infinity,
                        ),

                        Container(
                            margin:
                                EdgeInsets.only(left: 20, top: 100, right: 20),
                            alignment: val.languagebox.get("language") == "en"
                                ? Alignment.topLeft
                                : Alignment.topRight,
                            child: Text(
                              textAlign: val.languagebox.get("language") == "en"
                                  ? TextAlign.start
                                  : TextAlign.end,
                              val.languagebox.get("language") == "en"
                                  ? "Welcome"
                                  : "مرحبا",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )),
                        Container(
                          margin: EdgeInsets.only(right: 20),
                          child: Row(
                            mainAxisAlignment:
                                val.languagebox.get("language") == "en"
                                    ? MainAxisAlignment.start
                                    : MainAxisAlignment.end,
                            children: [
                              Container(
                                  margin: EdgeInsets.only(
                                    left: 20,
                                  ),
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    textAlign:
                                        val.languagebox.get("language") == "en"
                                            ? TextAlign.start
                                            : TextAlign.end,
                                    val.languagebox.get("language") == "en"
                                        ? "to"
                                        : "",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  )),
                              Container(
                                  margin: EdgeInsets.only(
                                    left: 10,
                                  ),
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    textAlign:
                                        val.languagebox.get("language") == "en"
                                            ? TextAlign.start
                                            : TextAlign.end,
                                    val.languagebox.get("language") == "en"
                                        ? "mango media"
                                        : "مانجا ميديا",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue),
                                  )),
                              Container(
                                  margin: EdgeInsets.only(
                                    left: 10,
                                  ),
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    textAlign:
                                        val.languagebox.get("language") == "en"
                                            ? TextAlign.start
                                            : TextAlign.end,
                                    val.languagebox.get("language") == "en"
                                        ? "app"
                                        : "في تطبيق",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 25, top: 20, right: 25),
                          alignment: val.languagebox.get("language") == "en"
                              ? Alignment.topLeft
                              : Alignment.topRight,
                          child: Text(
                              textAlign: val.languagebox.get("language") == "en"
                                  ? TextAlign.start
                                  : TextAlign.end,
                              val.languagebox.get("language") == "en"
                                  ? "where creating, managing, and tracking \n your ads is a breeze.\n Lets get started and take your business\n to new heights!"
                                  : "حيث يصبح إنشاء إعلاناتك وإدارتها وتتبعها \n أمرًا في غاية السهولة.\n فلنبدأ ونأخذ عملك\n إلى آفاق جديدة!"),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 4,
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: 4,
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: 4,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          elevation: 0,
          backgroundColor: Colors.white,
          onPressed: () {},
          child: Text("1"),
        ),
        floatingActionButtonLocation: val.languagebox.get("language") == "en"
            ? FloatingActionButtonLocation.endFloat
            : FloatingActionButtonLocation.startFloat,
      );
    });
  }
}
