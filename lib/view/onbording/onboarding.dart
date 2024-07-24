import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mango/companent/colors.dart';
import 'package:mango/prov/prov.dart';
import 'package:provider/provider.dart';

class OnBoarding extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _OnBoarding();
  }
}

class _OnBoarding extends State<OnBoarding> {
  ColorsApp colorApp = new ColorsApp();
  @override
  Widget build(BuildContext context) {
    return Consumer<control>(builder: (context, val, child) {
      return Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Image.asset(
            "assets/images/onpoarding.jpg",
            fit: BoxFit.cover,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .pushNamedAndRemoveUntil("switch", (route) => false);
          },
          backgroundColor: const Color.fromARGB(255, 232, 98, 88),
          child: Text(
            val.languagebox.get("language") == "en" ? "enter" : "دخول",
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    });
  }
}
