import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mango/companent/colors.dart';
import 'package:mango/companent/container_chose_platform.dart';
import 'package:mango/companent/drop_dowen_button.dart';
import 'package:mango/companent/text_field_vote.dart';
import 'package:mango/prov/prov.dart';
import 'package:provider/provider.dart';

class Reals extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Reals();
  }
}

class _Reals extends State<Reals> {
  ColorsApp colorApp = new ColorsApp();
  GlobalKey<FormState> formstate = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Consumer<control>(builder: (context, val, child) {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 1.0, // soften the shadow
              spreadRadius: 1.0, //extend the shadow
              offset: Offset(
                2.0, // Move to right 5  horizontally
                2.0, // Move to bottom 5 Vertically
              ),
            )
          ],
        ),
        /////design body campaign
        child: SingleChildScrollView(
          child: Form(
            key: formstate,
            child: Column(
              children: [
                //////together
                PlatForm(
                    text: val.languagebox.get("language") == "en"
                        ? "Advertising video"
                        : "فيديو اعلاني",
                    image: "assets/images/reals.png",
                    color: colorApp.colorreals),

                ////Form
                Container(
                  margin: EdgeInsets.only(top: 20, right: 5, bottom: 0),
                  alignment: val.languagebox.get("language") == "en"
                      ? Alignment.centerLeft
                      : Alignment.centerRight,
                  child: Text(
                    val.languagebox.get("language") == "en"
                        ? "name prodect"
                        : "اكتب اسم المنتج ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5),
                  child: TextFormFiledVote(
                      hintText: val.languagebox.get("language") == "en"
                          ? "name prodect"
                          : "اكتب اسم المنتج",
                      controll: val.api.name_prodect,
                      sufixicon: Container(
                        width: 1,
                      ),
                      keyboard: TextInputType.text),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20, right: 5, bottom: 10),
                  alignment: val.languagebox.get("language") == "en"
                      ? Alignment.centerLeft
                      : Alignment.centerRight,
                  child: Text(
                    val.languagebox.get("language") == "en"
                        ? "uploade image for prodect"
                        : "قم بتحميل صوره للمنتج",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    val.getphoto();
                  },
                  child: Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.black,
                          width: 1,
                          style: BorderStyle.solid,
                          strokeAlign: BorderSide.strokeAlignCenter),
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(255, 250, 250, 250),
                    ),
                    child: val.image == null
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 10),
                                height: 40,
                                width: 40,
                                child: Icon(Icons.add_a_photo),
                              ),
                              Text(val.languagebox.get("language") == "en"
                                  ? 'add image'
                                  : 'اضافه صوره')
                            ],
                          )
                        : Image.file(val.image!),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 20, top: 20),
                  alignment: Alignment.topRight,
                  child: CircleAvatar(
                    backgroundColor: const Color.fromARGB(255, 239, 241, 255),
                    child: IconButton(
                        onPressed: () {
                          if (formstate.currentState!.validate()) {
                            val.switchHome("reals2");
                            print("validat");
                          } else {
                            print("not validat");
                          }
                        },
                        icon: Icon(
                          Icons.arrow_forward,
                          size: 18,
                        )),
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
