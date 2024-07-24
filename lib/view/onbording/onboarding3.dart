import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:mango/companent/colors.dart';
import 'package:mango/prov/prov.dart';
import 'package:provider/provider.dart';

class OnBording3 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _OnBording3();
  }
}

class _OnBording3 extends State<OnBording3> {
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
                                  margin: EdgeInsets.only(left: 20, right: 20),
                                  alignment: Alignment.topLeft,
                                  width: double.infinity,
                                  height: 60,
                                  child: Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          icon: Icon(
                                            Icons.arrow_back_ios_outlined,
                                          )),
                                      Expanded(child: Container()),
                                      IconButton(
                                          onPressed: () {
                                            Navigator.of(context)
                                                .pushNamedAndRemoveUntil(
                                                    "switch", (route) => false);
                                          },
                                          icon: Icon(
                                            Icons.arrow_forward_ios_outlined,
                                          )),
                                    ],
                                  ),
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
                                                  "assets/images/nice.png"),
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
                                                      "assets/images/boke.png"),
                                                )),
                                          ),
                                          Stack(
                                            alignment:
                                                AlignmentDirectional.topCenter,
                                            children: [
                                              Container(
                                                margin:
                                                    EdgeInsets.only(top: 30),
                                                child: CircleAvatar(
                                                  backgroundColor:
                                                      Color.fromARGB(
                                                          255, 193, 255, 195),
                                                  radius: 100,
                                                ),
                                              ),
                                              AnimatedContainer(
                                                duration: Duration(seconds: 2),
                                                curve: Curves.ease,
                                                height: hi,
                                                width: wi,
                                                child: Image.asset(
                                                  "assets/images/onboardingimage3.png",
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Transform.translate(
                                              offset: Offset(-70, 30),
                                              child: Container(
                                                height: 30,
                                                width: 30,
                                                child: Image.asset(
                                                    "assets/images/note.png"),
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
                          margin: EdgeInsets.only(right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Container(
                                  child: Column(
                                    children: [
                                      Container(
                                          margin: EdgeInsets.only(
                                              left: 20, top: 100),
                                          alignment:
                                              val.languagebox.get("language") ==
                                                      "en"
                                                  ? Alignment.topLeft
                                                  : Alignment.topRight,
                                          child: Text(
                                            textAlign: val.languagebox
                                                        .get("language") ==
                                                    "en"
                                                ? TextAlign.start
                                                : TextAlign.end,
                                            val.languagebox.get("language") ==
                                                    "en"
                                                ? "Support and Get Started"
                                                : "الدعم والبدء",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          )),
                                      Row(
                                        mainAxisAlignment:
                                            val.languagebox.get("language") ==
                                                    "en"
                                                ? MainAxisAlignment.start
                                                : MainAxisAlignment.end,
                                        children: [
                                          Container(
                                              margin: EdgeInsets.only(
                                                left: 20,
                                              ),
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                val.languagebox
                                                            .get("language") ==
                                                        "en"
                                                    ? "in"
                                                    : "",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                          Container(
                                              margin: EdgeInsets.only(
                                                left: 10,
                                              ),
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                val.languagebox
                                                            .get("language") ==
                                                        "en"
                                                    ? "mango media"
                                                    : "منجا ميديا",
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
                                                val.languagebox
                                                            .get("language") ==
                                                        "en"
                                                    ? "app"
                                                    : "في تطبيق",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                        ],
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: 25, top: 20, right: 10),
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                            textAlign: val.languagebox
                                                        .get("language") ==
                                                    "en"
                                                ? TextAlign.start
                                                : TextAlign.end,
                                            val.languagebox.get("language") ==
                                                    "en"
                                                ? "Our team is here to help whenever\nyou need.\nLearn how to maximize your ad \ncampaigns, with us."
                                                : "فريقنا موجود لمساعدتك في أي وقت\nتحتاج إليه.\nتعرف على كيفية تحقيق أقصى استفادة من حملاتك الإعلانية معنا."),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              // Container(
                              //   margin: EdgeInsets.symmetric(horizontal: 20),
                              //   height: 150,
                              //   width: 70,
                              //   decoration: BoxDecoration(
                              //       gradient: LinearGradient(
                              //         colors: [
                              //           Color.fromARGB(255, 230, 249, 231),
                              //           Color.fromARGB(255, 177, 247, 181),
                              //           Color.fromRGBO(34, 247, 155, 1),
                              //         ],
                              //         begin: Alignment.topCenter,
                              //         end: Alignment.bottomCenter,
                              //       ),
                              //       //color: Color.fromARGB(255, 193, 255, 195),
                              //       borderRadius: BorderRadius.circular(40)),
                              //   child: Column(
                              //     mainAxisAlignment: MainAxisAlignment.center,
                              //     children: [
                              //       Text("Start",
                              //           style: TextStyle(
                              //               fontWeight: FontWeight.bold,
                              //               color: Colors.white)),
                              //       SizedBox(
                              //         height: 20,
                              //       ),
                              //       Container(
                              //         height: 70,
                              //         width: 50,
                              //         decoration: BoxDecoration(
                              //             color: Colors.white,
                              //             borderRadius:
                              //                 BorderRadius.circular(20)),
                              //         child: IconButton(
                              //             onPressed: () {
                              //               Navigator.of(context)
                              //                   .pushNamedAndRemoveUntil(
                              //                       "switch", (route) => false);
                              //             },
                              //             icon: Icon(
                              //               Icons.touch_app_outlined,
                              //               color: Colors.black,
                              //             )),
                              //       )
                              //     ],
                              //   ),
                              // )
                            ],
                          ),
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
                        backgroundColor: Colors.grey,
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
                        backgroundColor: Colors.black,
                        radius: 4,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
