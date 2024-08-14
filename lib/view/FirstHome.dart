import 'package:flutter/material.dart';
import 'package:mango/companent/app_bar_home.dart';
import 'package:mango/companent/colors.dart';
import 'package:mango/prov/prov.dart';
import 'package:mango/view/firsthome/body_first_home.dart';
import 'package:provider/provider.dart';

class FirstHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FirstHome();
  }
}

class _FirstHome extends State<FirstHome> {
  ColorsApp colorApp = new ColorsApp();
  @override
  void initState() {
    //TODO: implement initState
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
        backgroundColor: Colors.white,
        body: Container(
          height: double.infinity,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(20),
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
          child: Column(
            children: [
              //appbar
              AppBarHome(),
              Expanded(child: BodyFirstHome()),

              Stack(
                alignment: AlignmentDirectional.bottomStart,
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
                                  val.switchHome("campain");
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
                                onPressed: () {
                                  Navigator.of(context).pushNamed("suport");
                                },
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
                        )
                      ],
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ));
    });
  }
}
