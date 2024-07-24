import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mango/companent/colors.dart';
import 'package:mango/prov/prov.dart';
import 'package:provider/provider.dart';

class OnBording2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _OnBording2();
  }
}

class _OnBording2 extends State<OnBording2> {
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
                                  margin: EdgeInsets.only(right: 20, left: 20),
                                  alignment: Alignment.topRight,
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
                                      Expanded(
                                        child: Container(),
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            Navigator.of(context)
                                                .pushNamed("onbording3");
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
                                  child: AnimatedContainer(
                                    duration: Duration(seconds: 2),
                                    curve: Curves.ease,
                                    height: hi,
                                    width: wi,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(200)),
                                      child: Image.asset(
                                        "assets/images/onboardingimage2.png",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
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
                                  ? "Create Stunning Ads \nwith us"
                                  : "أنشئ إعلانات مذهلة \nمعنا",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )),

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
                                  ? "Reach the right audience with \nadvanced targeting.\nTrack your ads in real-time with \ndetailed analytics."
                                  : "يمكنك الوصول إلى الجمهور المناسب من خلال \nالاستهداف المتقدم.\nتتبع إعلاناتك في الوقت الفعلي باستخدام \nتحليلات تفصيلية."),
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
                        backgroundColor: Colors.black,
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
