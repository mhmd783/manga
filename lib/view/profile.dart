import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mango/companent/colors.dart';
import 'package:mango/prov/prov.dart';
import 'package:mango/view/profile/dialog_profile.dart';
import 'package:mango/view/profile/profile1.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Profile();
  }
}

class _Profile extends State<Profile> {
  ColorsApp colorApp = new ColorsApp();
  GlobalKey<FormState> formstate = GlobalKey();
  DialogProfile dialogProfile = new DialogProfile();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<control>(context, listen: false).GetDataClientProfile();
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
                  Container(
                    width: double.infinity,
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: Icon(
                                Icons.keyboard_arrow_left,
                                //size: 20,
                              )),
                          Expanded(child: Container()),
                          MaterialButton(
                            onPressed: () {
                              dialogProfile.logout(context);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: 120,
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: colorApp.coloryelloApp),
                              margin: EdgeInsets.only(left: 10),
                              child: Text(
                                val.languagebox.get("language") == "en"
                                    ? "LogOut"
                                    : "تسجيل الخروج",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 13),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //information
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: ListTile(
                      leading: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.black,
                            radius: 40,
                            child: val.image_profile == null
                                ? Icon(
                                    Icons.person_outlined,
                                    color: Colors.white,
                                    size: 30,
                                  )
                                : Container(
                                    height: 55,
                                    width: 55,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child: Image.file(val.image_profile!,
                                            fit: BoxFit.cover))),
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 12,
                            child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.camera_alt_outlined,
                                  size: 10,
                                )),
                          )
                        ],
                      ),
                      subtitle: Text(
                        "${val.emailbox.get("email")}",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      title: Text(
                          "${val.firstnamebox.get("firstname")} ${val.lastnamebox.get("lastname")}"),
                      trailing: IconButton(
                        onPressed: () {
                          dialogProfile.editImage(context);
                        },
                        icon: Icon(Icons.edit),
                      ),
                    ),
                  ),
                  //sup
                  val.data_client_profile == null
                      ? Container()
                      : val.data_client_profile['message'] ==
                              "User data retrieved successfully."
                          ? val
                                      .data_client_profile["data"]
                                          ['latest_subscription']
                                      .length !=
                                  0
                              ? Container(
                                  child: ListTile(
                                    onTap: () {
                                      dialogProfile.DetailsSub(context);
                                    },
                                    leading: val.data_client_profile["data"]
                                                    ['latest_subscription']
                                                ['accept'] ==
                                            "true"
                                        ? val.data_client_profile["data"]
                                                        ['latest_subscription']
                                                    ['subscription_status'] ==
                                                "sub"
                                            ? IconButton(
                                                onPressed: () {
                                                  //edit in here
                                                  dialogProfile.Cansel(
                                                      context,
                                                      val.data_client_profile[
                                                              "data"][
                                                              'latest_subscription']
                                                              ['id']
                                                          .toString());
                                                },
                                                icon: Icon(Icons.cancel))
                                            : IconButton(
                                                onPressed: () {
                                                  dialogProfile.ReturnSup(
                                                      context);
                                                },
                                                icon: Icon(Icons.refresh))
                                        : Icon(Icons.lock_clock),
                                    title: Text(val.data_client_profile["data"]
                                                    ['latest_subscription']
                                                ['accept'] ==
                                            "true"
                                        ? val.data_client_profile["data"]
                                                        ['latest_subscription']
                                                    ['subscription_status'] ==
                                                "sub"
                                            ? val.languagebox.get("language") ==
                                                    "ar"
                                                ? "${val.data_client_profile["data"]['latest_subscription']['title']} مفعله وتم الموافقه"
                                                : "${val.data_client_profile["data"]['latest_subscription']['title']} Activated and approved"
                                            : val.languagebox.get("language") ==
                                                    "ar"
                                                ? "${val.data_client_profile["data"]['latest_subscription']['title']} غير مفعله وتم الموافقه"
                                                : "${val.data_client_profile["data"]['latest_subscription']['title']} Not activated and approved."
                                        : val.languagebox.get("language") ==
                                                "ar"
                                            ? "${val.data_client_profile["data"]['latest_subscription']['title']} انتظر تتم مراجعه طلبك"
                                            : "${val.data_client_profile["data"]['latest_subscription']['title']} Wait for your application to be reviewed."),
                                    trailing: Text(
                                        "${val.data_client_profile["data"]['latest_subscription']['price_sub_monthe']}"),
                                    subtitle: Text(val.languagebox
                                                .get("language") ==
                                            "en"
                                        ? val.data_client_profile["data"]
                                                        ['latest_subscription']
                                                    ['status_campaign'] ==
                                                "true"
                                            ? "Reels: ${val.data_client_profile["data"]['latest_subscription']['num_of_reels']}    Campaign: No Limits"
                                            : "Reels: ${val.data_client_profile["data"]['latest_subscription']['num_of_reels']}    Campaign: "
                                        : val.data_client_profile["data"]
                                                        ['latest_subscription']
                                                    ['status_campaign'] ==
                                                "true"
                                            ? "الفديوهات: ${val.data_client_profile["data"]['latest_subscription']['num_of_reels']}    الحملات : بلا حدود"
                                            : "الفديوهات: ${val.data_client_profile["data"]['latest_subscription']['num_of_reels']}    الحملات: "),

                                    //val.languagebox.get("language") == "en"?//${val.data_client_profile["data"]['latest_subscription']['status_campaign']=="true"?

                                    //complet
                                  ),
                                )
                              : Container(
                                  alignment: Alignment.center,
                                  child: Text("No Sup"))
                          : Container(),

                  ////body
                  ///
                  Expanded(
                      child: val.data_client_profile == null
                          ? Center(child: CircularProgressIndicator())
                          : val.data_client_profile['message'] ==
                                  "User data retrieved successfully."
                              ? Profile1()
                              : IconButton(
                                  onPressed: () {
                                    val.GetDataClientProfile();
                                  },
                                  icon: Icon(Icons.refresh))),

                  //Profile1  ProfileEditSendPass
                ],
              ),
            )
          ],
        )),
      );
    });
  }
}
