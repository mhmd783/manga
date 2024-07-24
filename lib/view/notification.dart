import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mango/companent/colors.dart';

import 'package:mango/prov/prov.dart';
import 'package:mango/view/notification/notification1.dart';
import 'package:mango/view/notification/notification2.dart';

import 'package:provider/provider.dart';

class NotificationApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NotificationApp();
  }
}

class _NotificationApp extends State<NotificationApp> {
  ColorsApp colorApp = new ColorsApp();
  GlobalKey<FormState> formstate = GlobalKey();
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<control>(context, listen: false).GetAllNotification();
    });
    super.initState();
    
  }

  

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
                    colorApp.colorbodygreen,
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

                  ////body
                  ///
                  Expanded(child: Notifiction1()),

                  //bottom navgator bar
                ],
              ),
            )
          ],
        )),
      );
    });
  }
}
