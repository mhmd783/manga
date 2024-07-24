import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mango/prov/prov.dart';
import 'package:provider/provider.dart';

class MessageNewPass1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MessageNewPass1();
  }
}

class _MessageNewPass1 extends State<MessageNewPass1> {
  @override
  Widget build(BuildContext context) {
    return Consumer<control>(builder: (context, val, child) {
      return Scaffold(
        backgroundColor: val.datanewpass1 == null
            ? Colors.white
            : const Color.fromARGB(255, 85, 85, 85),
        body: val.datanewpass1 == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : val.datanewpass1['message'] == "code send Successfuly"
                ? Column(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.white,
                                  Colors.white,
                                  Colors.white,
                                  const Color.fromRGBO(206, 224, 208, 1),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.horizontal(
                                  left: Radius.circular(30),
                                  right: Radius.circular(30))),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 150,
                              ),
                              Stack(
                                alignment: AlignmentDirectional.center,
                                children: [
                                  Container(
                                    height: 70,
                                    width: 70,
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 155, 255, 158)
                                          .withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(35),
                                    ),
                                  ),
                                  CircleAvatar(
                                    backgroundColor:
                                        Color.fromARGB(255, 134, 247, 137),
                                    radius: 30,
                                    child: Icon(
                                      Icons.done,
                                      size: 40,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Text(
                                textAlign: TextAlign.center,
                                val.languagebox.get("language") == "en"
                                  ?
                                "Seccess !":"تم بنجاح",
                                style: TextStyle(
                                    color: Colors.green, fontSize: 18),
                              ),
                              // Text(
                              //   textAlign: TextAlign.center,
                              //   "${val.datanewpass1['message']}",
                              //   style: TextStyle(
                              //       color: Colors.black, fontSize: 18),
                              // ),
                              SizedBox(
                                height: 30,
                              ),
                              Container(
                                height: MediaQuery.of(context).size.height / 3,
                              )
                            ],
                          ),
                        ),
                      ),
                      //switch
                      Container(
                        width: 150,
                        height: 70,
                        margin: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          gradient: LinearGradient(
                            colors: [
                              Colors.grey.withOpacity(0.6),
                              Color.fromARGB(255, 226, 235, 227),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.topRight,
                          ),
                        ),
                        child: Center(
                          child: TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              Navigator.of(context)
                                  .pushNamed("verfyemailnewpass");
                            },
                            child: Text(
                              val.languagebox.get("language") == "en"
                                  ?
                              "Start":"ابداء",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                : Column(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.white,
                                  Colors.white,
                                  Colors.white,
                                  Color.fromARGB(255, 226, 196, 196),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.horizontal(
                                  left: Radius.circular(30),
                                  right: Radius.circular(30))),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 150,
                              ),
                              Stack(
                                alignment: AlignmentDirectional.center,
                                children: [
                                  Container(
                                    height: 70,
                                    width: 70,
                                    decoration: BoxDecoration(
                                      color: Colors.red.withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(35),
                                    ),
                                  ),
                                  CircleAvatar(
                                    backgroundColor: Colors.red,
                                    radius: 30,
                                    child: Icon(
                                      Icons.error_outline,
                                      size: 40,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Text(
                                textAlign: TextAlign.center,
                                val.languagebox.get("language") == "en"
                                  ?
                                "Opps...":"خطاء",
                                style: TextStyle(color: Colors.red),
                              ),
                              // Text(
                              //   textAlign: TextAlign.center,
                              //   "${val.datanewpass1['message']}",
                              //   style: TextStyle(color: Colors.black),
                              // ),
                              SizedBox(
                                height: 30,
                              ),
                              Container(
                                height: MediaQuery.of(context).size.height / 3,
                              )
                            ],
                          ),
                        ),
                      ),
                      //switch
                      Container(
                        width: 150,
                        height: 70,
                        margin: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          gradient: LinearGradient(
                            colors: [
                              Colors.grey.withOpacity(0.6),
                              Color.fromARGB(255, 226, 235, 227),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.topRight,
                          ),
                        ),
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            val.languagebox.get("language") == "en"
                                  ?
                            "Back":"رجوع",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      )
                    ],
                  ),
      );
    });
  }
}
