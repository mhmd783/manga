import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mango/companent/colors.dart';
import 'package:mango/prov/prov.dart';
import 'package:provider/provider.dart';

class Language extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Language();
  }
}

class _Language extends State<Language> {
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
                                  margin: EdgeInsets.only(top: 100),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Pick a",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        " language",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  width: 150,
                                  height: 150,
                                  child: AnimatedContainer(
                                    duration: Duration(seconds: 2),
                                    curve: Curves.ease,
                                    height: hi,
                                    width: wi,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(200)),
                                      child: Image.asset(
                                        "assets/images/mango.png",
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ),
                                Card(
                                  elevation: 10,
                                  color: Colors.white,
                                  margin: EdgeInsets.only(
                                      right: 40, left: 40, top: 40),
                                  child: ListTile(
                                    onTap: () {
                                      print(val.statusbox.get("status"));
                                      val.choseLanguage("ar");
                                      val.statusbox.get("status") == null ||
                                              val.statusbox.get("status") == "0"
                                          ? Navigator.of(context)
                                              .pushNamed("onbording")
                                          : Navigator.of(context).pop();
                                    },
                                    title: Text("العربيه"),
                                    trailing: Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      size: 18,
                                    ),
                                  ),
                                ),
                                Card(
                                  elevation: 10,
                                  color: Colors.white,
                                  margin: EdgeInsets.only(
                                      right: 40, left: 40, top: 20, bottom: 20),
                                  child: ListTile(
                                    onTap: () {
                                      val.choseLanguage("en");
                                      //
                                      val.statusbox.get("status") == null ||
                                              val.statusbox.get("status") == "0"
                                          ? Navigator.of(context)
                                              .pushNamed("onbording")
                                          : Navigator.of(context).pop();
                                    },
                                    title: Text("ُEnglish"),
                                    trailing: Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      size: 18,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
