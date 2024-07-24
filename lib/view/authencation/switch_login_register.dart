import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mango/companent/colors.dart';
import 'package:mango/prov/prov.dart';
import 'package:mango/view/authencation/login.dart';
import 'package:mango/view/authencation/register.dart';
import 'package:provider/provider.dart';

class Switch_Lo_Re extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Switch_Lo_Re();
  }
}

class _Switch_Lo_Re extends State<Switch_Lo_Re> {
  ColorsApp colorapp = new ColorsApp();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<control>(context, listen: false).GetTokenDevice();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<control>(builder: (context, val, child) {
      return Scaffold(
        backgroundColor: const Color.fromARGB(255, 85, 85, 85),
        body: Column(
          children: [
            ///set switch design login register
            Expanded(
                child: AnimatedCrossFade(
                    firstChild: Login(),
                    secondChild: Rigester(),
                    crossFadeState: val.switch_lo_re
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    duration: Duration(seconds: 2))),
            //switch
            Container(
              width: 300,
              height: 70,
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.grey.withOpacity(0.6)),
              child: Stack(
                alignment: AlignmentDirectional.centerStart,
                children: [
                  AnimatedContainer(
                    duration: Duration(seconds: 2),
                    curve: Curves.ease,
                    margin: EdgeInsets.only(left: val.margleft),
                    width: 120,
                    height: 55,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.3),
                          blurRadius: 7.0, // soften the shadow
                          spreadRadius: 5.0, //extend the shadow
                          offset: Offset(
                            2.0, // Move to right 5  horizontally
                            2.0, // Move to bottom 5 Vertically
                          ),
                        )
                      ],
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        val.switch_log_reg();
                      },
                      child: Center(
                        child: Text(val.switch_lo_re == true
                            ? val.languagebox.get("language") == "en"
                                ? "Sign up"
                                : "تسجيل حساب"
                            : val.languagebox.get("language") == "en"
                                ? "Sign In"
                                : "تسجيل الدخول"),
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    duration: Duration(seconds: 2),
                    curve: Curves.ease,
                    margin: EdgeInsets.only(left: val.mergright),
                    child: Icon(
                      val.switch_lo_re == true
                          ? Icons.keyboard_double_arrow_left
                          : Icons.keyboard_double_arrow_right,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}
