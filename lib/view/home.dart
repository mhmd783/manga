import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mango/companent/app_bar_home.dart';
import 'package:mango/companent/colors.dart';
import 'package:mango/prov/prov.dart';
import 'package:mango/view/campains/campaign.dart';
import 'package:mango/view/campains/campaign_next.dart';
import 'package:mango/view/reals/reals.dart';
import 'package:mango/view/reals/reals2.dart';
import 'package:mango/view/reals/reals3.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Home();
  }
}

class _Home extends State<Home> {
  ColorsApp colorApp = new ColorsApp();
  GlobalKey<FormState> formstate = GlobalKey();
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<control>(context, listen: false).GetCountAllNotification();
    });
    //لو معملش سماحيه في تسجيل الدخول
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<control>(context, listen: false).GetTokenDevice();
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<control>(context, listen: false).ProsessIamgeProfile();
    });
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
                  AppBarHome(),
                  //switch orders
                  SizedBox(
                    height: 10,
                  ),

                  // Stack(
                  //   alignment: AlignmentDirectional.center,
                  //   children: [
                  // Container(
                  //   margin: EdgeInsets.symmetric(vertical: 20),
                  //   child: Row(
                  //     children: [
                  //       Expanded(
                  //         child: Stack(
                  //           alignment: AlignmentDirectional.bottomCenter,
                  //           children: [
                  //             Container(
                  //               height: 60,
                  //               decoration: BoxDecoration(
                  //                 borderRadius: BorderRadius.circular(30),
                  //                 color: Colors.white,
                  //                 boxShadow: [
                  //                   BoxShadow(
                  //                     color: Colors.grey.shade300,
                  //                     blurRadius: 1.0, // soften the shadow
                  //                     spreadRadius: 1.0, //extend the shadow
                  //                     offset: Offset(
                  //                       1.0, // Move to right 5  horizontally
                  //                       1.0, // Move to bottom 5 Vertically
                  //                     ),
                  //                   )
                  //                 ],
                  //               ),
                  //               child: Center(
                  //                 child: MaterialButton(
                  //                     onPressed: () {
                  //                       val.switchHome("reals");
                  //                     },
                  //                     child: Text(
                  //                         val.languagebox.get("language") ==
                  //                                 "en"
                  //                             ? "Reels"
                  //                             : "فيديو اعلاني")),
                  //               ),
                  //             ),
                  //             val.screen == "reals" ||
                  //                     val.screen == "reals2" ||
                  //                     val.screen == "reals3"
                  //                 ? Container(
                  //                     height: 2,
                  //                     width: 40,
                  //                     color: Colors.blue,
                  //                   )
                  //                 : Container(),
                  //           ],
                  //         ),
                  //       ),
                  //       SizedBox(
                  //         width: 30,
                  //       ),
                  //       Expanded(
                  //         child: Stack(
                  //           alignment: AlignmentDirectional.bottomCenter,
                  //           children: [
                  //             Container(
                  //               height: 60,
                  //               decoration: BoxDecoration(
                  //                 borderRadius: BorderRadius.circular(30),
                  //                 color: Colors.white,
                  //                 boxShadow: [
                  //                   BoxShadow(
                  //                     color: Colors.grey.shade300,
                  //                     blurRadius: 1.0, // soften the shadow
                  //                     spreadRadius: 1.0, //extend the shadow
                  //                     offset: Offset(
                  //                       1.0, // Move to right 5  horizontally
                  //                       1.0, // Move to bottom 5 Vertically
                  //                     ),
                  //                   )
                  //                 ],
                  //               ),
                  //               child: Center(
                  //                 child: MaterialButton(
                  //                     onPressed: () {
                  //                       val.switchHome("campain");
                  //                     },
                  //                     child: Text(
                  //                         val.languagebox.get("language") ==
                  //                                 "en"
                  //                             ? "Campain"
                  //                             : "حمله اعلانيه")),
                  //               ),
                  //             ),
                  //             val.screen == "campain" ||
                  //                     val.screen == "campainnext"
                  //                 ? Container(
                  //                     height: 2,
                  //                     width: 40,
                  //                     color: Colors.blue,
                  //                   )
                  //                 : Container(),
                  //           ],
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  //     Container(
                  //       decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(30),
                  //         gradient: LinearGradient(
                  //           colors: [colorApp.colorlogo1, colorApp.colorlogo2],
                  //           begin: Alignment.topLeft,
                  //           end: Alignment.bottomRight,
                  //         ),
                  //       ),
                  //       child: CircleAvatar(
                  //         radius: 30,
                  //         backgroundColor: Colors.black.withOpacity(0.0),
                  //         child: Container(
                  //             height: 40,
                  //             width: 40,
                  //             child: Image.asset("assets/images/mango.png")),
                  //       ),
                  //     )
                  //   ],
                  // ),

                  ////body
                  ///
                  Expanded(
                      child: val.screen == "campain"
                          ? Campaign()
                          : val.screen == "campainnext"
                              ? CampaignNext()
                              : val.screen == "reals"
                                  ? Reals()
                                  : val.screen == "reals2"
                                      ? Reals2()
                                      : Reals3()),

                  //bottom navgator bar
                  // Stack(
                  //   alignment: AlignmentDirectional.bottomStart,
                  //   children: [
                  //     Container(
                  //       height: 55,
                  //       width: 230,
                  //       decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(30),
                  //           color: colorApp.colorgreenApp),
                  //       child: Row(
                  //         children: [
                  //           Expanded(
                  //               child: IconButton(
                  //                   onPressed: () {
                  //                     val.switchHome("campain");
                  //                   },
                  //                   icon: Icon(Icons.home_outlined,
                  //                       color: Colors.white))),
                  //           Expanded(
                  //               child: IconButton(
                  //                   onPressed: () {
                  //                     Navigator.of(context).pushNamed("offers");
                  //                   },
                  //                   icon: Icon(Icons.layers_outlined,
                  //                       color: Colors.white))),
                  //           Expanded(
                  //               child: IconButton(
                  //                   onPressed: () {
                  //                     Navigator.of(context).pushNamed("suport");
                  //                   },
                  //                   icon: Icon(Icons.call_outlined,
                  //                       color: Colors.white))),
                  //         ],
                  //       ),
                  //     ),
                  //     Container(
                  //       margin: EdgeInsets.symmetric(horizontal: 20),
                  //       height: 3,
                  //       width: 40,
                  //       decoration: BoxDecoration(
                  //         boxShadow: [
                  //           BoxShadow(
                  //             color: Colors.white,
                  //             blurRadius: 17.0, // soften the shadow
                  //             spreadRadius: 6.0, //extend the shadow
                  //             offset: Offset(
                  //               1.0, // Move to right 5  horizontally
                  //               -10.0, // Move to bottom 5 Vertically
                  //             ),
                  //           )
                  //         ],
                  //         color: Colors.white,
                  //       ),
                  //     )
                  //   ],
                  // ),
                ],
              ),
            )
          ],
        )),
      );
    });
  }
}
