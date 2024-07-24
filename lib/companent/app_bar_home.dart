import 'package:flutter/material.dart';
import 'package:mango/companent/colors.dart';
import 'package:mango/prov/prov.dart';
import 'package:provider/provider.dart';

class AppBarHome extends StatelessWidget {
  AppBarHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ColorsApp colorApp = new ColorsApp();
    return Consumer<control>(builder: (context, val, child) {
      return Container(
        width: double.infinity,
        height: 55,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: colorApp.coloryelloApp),
        child: Container(
          margin: EdgeInsets.only(left: 10),
          child: Row(
            children: [
              CircleAvatar(
                radius: 18,
                backgroundColor: Colors.white,
                child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed("language");
                    },
                    icon: Icon(
                      Icons.language,
                      size: 18,
                    )),
              ),
              Expanded(child: Container()),
              Stack(
                children: [
                  CircleAvatar(
                    radius: 18,
                    backgroundColor: Colors.white,
                    child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed("notification");
                        },
                        icon: Icon(
                          Icons.notification_important_outlined,
                          size: 18,
                        )),
                  ),
                  val.count_notification == null
                      ? SizedBox()
                      : val.count_notification['message'] ==
                              "Notifications Count"
                          ? val.count_notification['data'] != 0
                              ? val.count_notification['data'] > 0
                                  ? CircleAvatar(
                                      radius: 5,
                                      backgroundColor: Colors.green.shade200,
                                    )
                                  : SizedBox()
                              : SizedBox()
                          : SizedBox(),
                ],
              ),
              Container(
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("profile");
                  },
                  child: CircleAvatar(
                    radius: 22,
                    backgroundColor: Colors.white,
                    child: val.image_profile == null
                        ? Icon(
                            Icons.person_2_outlined,
                            size: 18,
                          )
                        : Container(
                            height: 55,
                            width: 55,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50)),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.file(val.image_profile!,
                                    fit: BoxFit.cover))),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
