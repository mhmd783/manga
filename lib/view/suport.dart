import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mango/companent/app_bar_home.dart';
import 'package:mango/companent/colors.dart';

import 'package:mango/prov/prov.dart';
import 'package:mango/view/offers/offers1.dart';
import 'package:mango/view/suport/suport1.dart';
import 'package:provider/provider.dart';

class Suport extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Suport();
  }
}

class _Suport extends State<Suport> {
  ColorsApp colorApp = new ColorsApp();
  GlobalKey<FormState> formstate = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Consumer<control>(builder: (context, val, child) {
      return SafeArea(
        child: Scaffold(
            body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 218, 224, 253),
                    Colors.white,
                    Colors.white,
                    Colors.white,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: double.infinity,
              margin: EdgeInsets.all(20),
              child: Column(
                children: [
                  //app bar
                  AppBarHome(),

                  ////body
                  ///
                  Expanded(
                      child: Container(
                          margin: EdgeInsets.only(top: 20), child: Suport1())),

                  //bottom navgator bar
                  Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      Container(
                        height: 55,
                        width: 230,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: colorApp.colorgreenApp),
                        child: Row(
                          children: [
                            Expanded(
                                child: IconButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pushNamedAndRemoveUntil(
                                              "home", (route) => false);
                                    },
                                    icon: Icon(Icons.home_outlined,
                                        color: Colors.white))),
                            Expanded(
                                child: IconButton(
                                    onPressed: () {
                                      Navigator.of(context).pushNamed("offers");
                                    },
                                    icon: Icon(Icons.layers_outlined,
                                        color: Colors.white))),
                            Expanded(
                                child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.call_outlined,
                                        color: Colors.white))),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        height: 3,
                        width: 40,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white,
                              blurRadius: 17.0, // soften the shadow
                              spreadRadius: 6.0, //extend the shadow
                              offset: Offset(
                                1.0, // Move to right 5  horizontally
                                -10.0, // Move to bottom 5 Vertically
                              ),
                            ),
                          ],
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        )),
      );
    });
  }
}
