import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mango/prov/prov.dart';
import 'package:mango/view/home.dart';
import 'package:mango/view/notification.dart';
import 'package:mango/view/offers.dart';
import 'package:mango/view/onbording/language.dart';
import 'package:mango/view/message/message_login.dart';
import 'package:mango/view/message/message_newpass1.dart';
import 'package:mango/view/message/message_newpass3.dart';
import 'package:mango/view/message/message_verfy_email.dart';
import 'package:mango/view/message/message_verfy_email_newpass.dart';
import 'package:mango/view/message/message_Rigester.dart';
import 'package:mango/view/forgetpassword/newpass1.dart';
import 'package:mango/view/forgetpassword/newpass2.dart';
import 'package:mango/view/forgetpassword/newpass3.dart';
import 'package:mango/view/onbording/onboarding.dart';
import 'package:mango/view/onbording/onboarding3.dart';
import 'package:mango/view/onbording/onbording1.dart';
import 'package:mango/view/onbording/onbording2.dart';
import 'package:mango/view/authencation/switch_login_register.dart';
import 'package:mango/view/forgetpassword/verfy_email_newpass.dart';
import 'package:mango/view/authencation/verfyemail.dart';
import 'package:mango/view/profile.dart';
import 'package:mango/view/suport.dart';
import 'package:mango/view/vote.dart';
import 'package:provider/provider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  WidgetsFlutterBinding.ensureInitialized();
  Directory dir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(dir.path);
  await Hive.openBox('firstname');
  await Hive.openBox('lastname');
  await Hive.openBox('token');
  await Hive.openBox('id');
  await Hive.openBox('phone');
  await Hive.openBox('email');
  await Hive.openBox('address');
  await Hive.openBox('image');
  await Hive.openBox('status');
  //
  await Hive.openBox('language');
  await Hive.openBox('statusvote');
  runApp(MyApp());
  // تحديد اتجاه التطبيق
  //SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  late Box statusvotebox = Hive.box('statusvote');
  late Box statusbox = Hive.box('status');
  late Box tokenbox = Hive.box('token');

  MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) {
          return control();
        },
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            "onbording1": (context) => OnBording1(),
            "onbording2": (context) => OnBording2(),
            "onbording3": (context) => OnBording3(),
            "onbording": (context) => OnBoarding(),
            "verfyemail": (context) => VerfyEmail(),
            "newpass1": (context) => NewPass1(),
            "newpass2": (context) => NewPass2(),
            "switch": (context) => Switch_Lo_Re(),
            "messagerigester": (context) => MessageRigester(),
            "messagelogin": (context) => MessageLogin(),
            "language": (context) => Language(),
            "messageverfyemail": (context) => MessageVerfyEmail(),
            "messagenewpass1": (context) => MessageNewPass1(),
            "verfyemailnewpass": (context) => VerfyEmailNewPass(),
            "messageverfyemailnewpass": (context) => MessageVerfyEmailNewPass(),
            "newpass3": (context) => NewPass3(),
            "messagenewpass3": (context) => MessageNewPass3(),
            "vote": (context) => Vote(),
            "home": (context) => Home(),
            "profile": (context) => Profile(),
            "notification": (context) => NotificationApp(),
            "offers": (context) => Offers(),
            "suport": (context) => Suport()
          },
          //  home: NewPass3(),
          home:
              statusbox.get("status") == null || statusbox.get("status") == "0"
                  ? Language()
                  : Home(),
        ));
  }
}
