import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mango/prov/api.dart';
import 'package:url_launcher/url_launcher.dart';

class control extends ChangeNotifier {
  Api api = new Api();
  double margleft = 10;
  double mergright = 240;
  bool switch_lo_re = true;
  switch_log_reg() {
    if (switch_lo_re == false) {
      switch_lo_re = true;
      margleft = 10;
      mergright = 240;
    } else {
      switch_lo_re = false;
      margleft = 170;
      mergright = 10;
    }
    notifyListeners();
  }

  late Box languagebox = Hive.box("language");
  choseLanguage(String lan) {
    languagebox.put("language", "$lan");
    print(languagebox.get("language"));
    notifyListeners();
  }

  bool showpass = false;
  showPass() {
    showpass = !showpass;
    notifyListeners();
  }

  bool showconpass = false;
  showConPass() {
    showconpass = !showconpass;
    notifyListeners();
  }

  //+972566013123
  call(String number) async {
    final Uri uri = Uri(
      scheme: 'tel',
      path: '$number',
    );
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      print('error');
    }
  }

  String screen = "campain";
  //campain
  //campainnext
  //reals
  //reals2
  //reals3
  switchHome(String scr) {
    screen = scr;
    notifyListeners();
  }

////////////////////////////////////Apis
  late Box firstnamebox = Hive.box('firstname');
  late Box lastnamebox = Hive.box('lastname');
  late Box tokenbox = Hive.box('token');
  late Box idbox = Hive.box('id');
  late Box phonebox = Hive.box('phone');
  late Box emailbox = Hive.box('email');
  late Box addressbox = Hive.box('address');
  late Box imagebox = Hive.box('image');
  late Box statusbox = Hive.box('status');

  var dataUserRigester = null;
  Rigester() async {
    dataUserRigester = null;

    dataUserRigester = await api.Register();

    print("data user${dataUserRigester}");
    print("data user${dataUserRigester}");
    print("data user${dataUserRigester}");
    notifyListeners();

    if (dataUserRigester != null) {
      if (dataUserRigester['message'] == "User Created Successfully") {
        firstnamebox.put(
            "firstname", "${dataUserRigester['data']['data']['first_name']}");
        lastnamebox.put(
            "lastname", "${dataUserRigester['data']['data']['last_name']}");
        tokenbox.put("token", "${dataUserRigester['data']['data']['token']}");
        idbox.put("id", "${dataUserRigester['data']['data']['id']}");
        phonebox.put("phone", "${dataUserRigester['data']['data']['phone']}");
        emailbox.put("email", "${dataUserRigester['data']['data']['email']}");
        addressbox.put(
            "address", "${dataUserRigester['data']['data']['address']}");
        imagebox.put(
            "image", "${dataUserRigester['data']['data']['iamge_baase64']}");
        //عشان لما يعمل تسجيل ميدخلش لما يعمل تسجيل دخول يدخل
        // statusbox.put("status", "1");
      }
    }
  }

  var dataverfyemailcode = null;
  verfiEmail() async {
    dataverfyemailcode = null;
    dataverfyemailcode =
        await api.VerfyEmail("${dataUserRigester['data']['data']['token']}");
    print("dataverfyemailcode=====${dataverfyemailcode}");
    print("dataverfyemailcode=====${dataverfyemailcode}");
    print("dataverfyemailcode=====${dataverfyemailcode}");
    notifyListeners();
  }

  var fbm = FirebaseMessaging.instance;
  String tokendevice = '';
  GetTokenDevice() async {
    await fbm.requestPermission();
    fbm.getToken().then((value) {
      tokendevice = value!;
      print("token== $value");
    });
    notifyListeners();
  }

  var dataUserLogin = null;
  Login() async {
    dataUserLogin = null;
    dataUserLogin = await api.Login(tokendevice);
    print("data user${dataUserLogin}");
    print("data user${dataUserLogin}");
    print("data user${dataUserLogin}");
    notifyListeners();
    if (dataUserLogin != null) {
      if (dataUserLogin['message'] == "User Logged In Successfully") {
        firstnamebox.put(
            "firstname", "${dataUserLogin['data']['data']['first_name']}");
        lastnamebox.put(
            "lastname", "${dataUserLogin['data']['data']['last_name']}");
        tokenbox.put("token", "${dataUserLogin['data']['data']['token']}");
        idbox.put("id", "${dataUserLogin['data']['data']['id']}");
        phonebox.put("phone", "${dataUserLogin['data']['data']['phone']}");
        emailbox.put("email", "${dataUserLogin['data']['data']['email']}");
        addressbox.put(
            "address", "${dataUserLogin['data']['data']['address']}");
        imagebox.put(
            "image", "${dataUserLogin['data']['data']['iamge_baase64']}");
        statusbox.put("status", "1");
        if(dataUserLogin['data']['data']['polls'].length!=0){
          statusvotebox.put("statusvote", "true");
        }
        print('email=== ${emailbox.get("email")}');
        print('email=== ${emailbox.get("email")}');
        print('email=== ${emailbox.get("email")}');
      }
    }
  }

  var datanewpass1 = null;
  newPass1() async {
    datanewpass1 = null;
    datanewpass1 = await api.newPass1();
    print("data user${datanewpass1}");
    print("data user${datanewpass1}");
    print("data user${datanewpass1}");
    notifyListeners();
  }

  var dataverfyemailcodeNewPass = null;
  verfiEmailNewPass() async {
    dataverfyemailcodeNewPass = null;
    dataverfyemailcodeNewPass =
        await api.VerfyEmailNewPass("${datanewpass1['data']['data']['email']}");
    print("dataverfyemailcode=====${dataverfyemailcodeNewPass}");
    print("dataverfyemailcode=====${dataverfyemailcodeNewPass}");
    print("dataverfyemailcode=====${dataverfyemailcodeNewPass}");
    notifyListeners();
  }

  var newPass3 = null;
  NewPass3() async {
    newPass3 = null;
    newPass3 = await api.NewPass3();
    print("dataverfyemailcode=====${newPass3}");
    print("dataverfyemailcode=====${newPass3}");
    print("dataverfyemailcode=====${newPass3}");
    notifyListeners();
  }

  ////vote
  String selectedValue = "";
  List<dynamic> dropdownItems = [];
  DropDowenButtonValus() {
    dropdownItems = [
      selectedValue = languagebox.get("language") == "en"
          ? "advertising campaign"
          : "قمت بحملة إعلانية",
      selectedValue =
          languagebox.get("language") == "en" ? "made Rails" : "قمت بعمل ريلز",
      selectedValue = languagebox.get("language") == "en"
          ? "campaign with Rails"
          : "قمت بحملة إعلانية مع ريلز",
      selectedValue = languagebox.get("language") == "en"
          ? "First time"
          : "لم أقم بأي حملة إعلانية من قبل"
    ];
    selectedValue = languagebox.get("language") == "en"
        ? "Your previous works"
        : "اعمالك السابقه";
    notifyListeners();
  }

  late Box statusvotebox = Hive.box('statusvote');
  var vote = null;
  Vote() async {
    vote = null;
    vote = await api.Vote(tokenbox.get('token'));
    if (vote != null) {
      if (vote['message'] == "Poll Created Successfully") {
        statusvotebox.put("statusvote", "true");
      }
    }
    print("datavote=====${vote}");
    print("datavote=====${vote}");
    print("datavote=====${vote}");
    notifyListeners();
  }

  //campaign
  String selectedGoal = "";
  List<dynamic> dropdownItemsGoal = [];
  DropDowenCampain() {
    dropdownItemsGoal = [
      languagebox.get("language") == "en"
          ? "Increase followers number "
          : "زياده عدد المتابعين",
      languagebox.get("language") == "en"
          ? "Increase interaction"
          : "زياده التفاعل",
      languagebox.get("language") == "en"
          ? "Receive more messages"
          : "تلقي المزيد من الرسائل",
      languagebox.get("language") == "en"
          ? "Attract more visitors"
          : "جزب المزيد من الزوار"
    ];
    selectedGoal = languagebox.get("language") == "en"
        ? "goal campain"
        : "الهدف من الحمله";
    notifyListeners();
  }

  choseDropDowenItemsGoal(String value) {
    api.target_campain = value;
    print(api.target_campain);
    notifyListeners();
  }

  choseDropDowenItemsArea(String value) {
    api.target_area_campain.text = value;
    print(api.target_area_campain);
    notifyListeners();
  }

  String selectedArea = "الجمهور المستهدف";
  List<dynamic> dropdownItemsArea = ["القدس", "الضفه الغربيه", "الداخل 48"];
  DropDowenCampainNext() {
    dropdownItemsArea = [
      languagebox.get("language") == "en" ? "Jerusalem" : "القدس",
      languagebox.get("language") == "en" ? "West Bank" : "الضفه الغربيه",
      languagebox.get("language") == "en" ? "Inside 48" : "الداخل 48"
    ];
    selectedArea = languagebox.get("language") == "en"
        ? "the target audience"
        : "الجمهور المستهدف";
    notifyListeners();
  }

  bool showvote = false;
  showVote(bool value) {
    showvote = value;
    notifyListeners();
  }

  ChoseTypeCampain(String camp) {
    api.order_type_campain = camp;
    print(camp);
    notifyListeners();
  }

  var campain = null;
  Camapain() async {
    campain = null;
    //for select value chose
    //message //The advertising campaign has been requested successfully. We will contact you
    print("goal ${api.target_campain}");
    print("area ${api.target_area_campain}");
    campain = await api.Campain(tokenbox.get('token'));
    switchHome("campain");
    print("datacompain=====${campain}");
    print("datacompain=====${campain}");
    print("datacompain=====${campain}");
    notifyListeners();
  }

  //reals
  //get image
  File? image;
  String base64image = '';
  var pickedImage;
  final imagePicker = ImagePicker();

  Future<void> getphoto() async {
    pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      image = File(pickedImage.path);
      List<int> imagebytes = File(pickedImage.path).readAsBytesSync();
      base64image = base64Encode(imagebytes);
      debugPrint(base64image);
      print("length:${base64image.length}");
      print("length:${base64image.length}");
    } else {
      print("not chose image");
      // إعلان خيار آخر في حالة عدم تحديد صورة
      // يمكنك إضافة المزيد من العمليات هنا بناءً على حالتك
    }
    notifyListeners();
  }

  var reals = null;
  Reals() async {
    reals = null;
    api.image_reals = base64image;
    reals = await api.Reals(tokenbox.get('token'));
    if (reals != null) {
      api.name_prodect.text = '';
      api.image_reals = '';
      api.description_prodect.text = '';
      api.roude_usage_prodect.text = '';
      api.salary_prodect.text = '';
      api.offers_prodect.text = '';
      api.gift_prodect.text = '';
      image = null;
      base64image = '';
    }
    switchHome("reals");
    print("reels=====${reals}");
    print("reels=====${reals}");
    print("reels=====${reals}");
    notifyListeners();
  }

  var data_offers = null;
  GetOffers() async {
    data_offers = null;
    data_offers = await api.GetOffers(tokenbox.get('token'));
    print("data_offers=====${data_offers}");
    print("data_offers=====${data_offers}");
    print("data_offers=====${data_offers}");
    notifyListeners();
  }

  var orderOffers = null;
  OrderOffers(int id) async {
    orderOffers = null;
    orderOffers = await api.OrderOffers(tokenbox.get('token'), id);
    print("orderOffers=====${orderOffers}");
    print("orderOffers=====${orderOffers}");
    print("orderOffers=====${orderOffers}");
    notifyListeners();
  }
  //client profile

  var data_client_profile = null;
  GetDataClientProfile() async {
    data_client_profile = null;
    data_client_profile =
        await api.GetDataClientProfile(tokenbox.get('token'), idbox.get("id"));
    print("data_client_profile=====${data_client_profile}");
    print("data_client_profile=====${data_client_profile}");
    print("data_client_profile=====${data_client_profile}");
    print("data_client_profile=====${data_client_profile['data']['reels']}");
    print("data_client_profile=====${data_client_profile['data']['reels']}");
    
    print(tokenbox.get("token"));
    print(tokenbox.get("token"));
    print(tokenbox.get("token"));

    notifyListeners();
  }

  String body_profile = "campaign";
  //values ===== campaign, reels
  changeBodyProfile(String body) {
    body_profile = body;
    notifyListeners();
  }

  var logout = null;
  Logout() async {
    logout = null;
    logout = await api.Logout(tokenbox.get('token'));
    if (logout != null) {
      if (logout['message'] == "User Logged Out Successfuly") {
        statusbox.put("status", "0");
        tokenbox.put("token", null);
      }
    }
    print("logout=====${logout}");
    print("logout=====${logout}");
    print("logout=====${logout}");
    notifyListeners();
  }

  //get image
  File? imageprofile;
  String base64imageprofile = '';
  var pickedImageprofile;
  final imagePickerprofile = ImagePicker();

  Future<void> getPhotoProfile() async {
    pickedImageprofile =
        await imagePickerprofile.pickImage(source: ImageSource.gallery);
    if (pickedImageprofile != null) {
      imageprofile = File(pickedImageprofile.path);
      List<int> imagebytesprofile =
          File(pickedImageprofile.path).readAsBytesSync();
      base64imageprofile = base64Encode(imagebytesprofile);
      debugPrint(base64imageprofile);
      print("length:${base64imageprofile.length}");
      print("length:${base64imageprofile.length}");
    } else {
      print("not chose image");
      // إعلان خيار آخر في حالة عدم تحديد صورة
      // يمكنك إضافة المزيد من العمليات هنا بناءً على حالتك
    }
    notifyListeners();
  }

  var imageprof = null;
  uploudImageProfile() async {
    imageprof = null;
    api.image_base64 = base64imageprofile;
    imageprof = await api.uploudImageProfile(tokenbox.get('token'));
    if (imageprof != null) {
      if (imageprof['message'] == "Image updated successfully.") {
        imagebox.put("image", base64imageprofile);
        await ProsessIamgeProfile();
      }
    }

    print("imageprofile=====${imageprof}");
    print("imageprofile=====${imageprof}");
    print("imageprofile=====${imageprof}");
    notifyListeners();
  }

  //prosess image profile

  File? image_profile = null;
  Future ProsessIamgeProfile() async {
    List<int> imageBytes = base64Decode(imagebox.get("image"));
    if (imagebox.get("image") != null && imagebox.get("image") != "null") {
      image_profile =
          await _storeImageToFile(imageBytes, Random().nextInt(100));

      print("convert image");
      print("convert image");
      print(imagebox.get("image"));
      print("convert image");
      print("convert image");
    }

    notifyListeners();
  }

  Future<File> _storeImageToFile(List<int> imageBytes, int id) async {
    //get id to stor image by defrent image
    String tempPath = Directory.systemTemp.path;

    File file = File('$tempPath/image$id.jpg');
    await file.writeAsBytes(imageBytes);
    print('image${file.path} ///$tempPath');
    print('image${file.path}///$tempPath');
    return file;
  }

  var notification = null;
  GetAllNotification() async {
    notification = null;
    notification = await api.GetAllNotification(tokenbox.get('token'));
    if (notification != null) {
      if (notification['message'] == "Notifications retrieved successfully.") {
        GetCountAllNotification();
      }
    }
    print("notificationn=====${notification}");
    print("notificationn=====${notification}");
    print("notificationn=====${notification}");
    notifyListeners();
  }

  var count_notification = null;
  GetCountAllNotification() async {
    count_notification = null;
    count_notification =
        await api.GetCountAllNotification(tokenbox.get('token'));
    if (count_notification != null) {
      if (count_notification['message'] == "Unauthenticated.") {
        statusbox.put("status", "0");
      }
    }
    print("count_notification=====${count_notification}");
    print("count_notification=====${count_notification}");
    print("count_notification=====${count_notification}");
    notifyListeners();
  }

  var cansel = null;
  Cansel(String subscription_id) async {
    cansel = null;
    cansel = await api.Cansel(tokenbox.get('token'), subscription_id);
    if (cansel != null) {
      if (cansel['message'] == "success") {
        GetDataClientProfile();
      }
    }
    print("cansel=====${cansel}");
    print("cansel=====${cansel}");
    print("cansel=====${cansel}");
    notifyListeners();
  }

  var return_sup = null;
  ReturnSup() async {
    return_sup = null;
    return_sup =
        await api.ReternSup(tokenbox.get('token'));
    if (return_sup != null) {
      if (return_sup['message'] == "Subscription activated successfully.") {
        GetDataClientProfile();
      }
    }
    print("return_sup=====${return_sup}");
    print("return_sup=====${return_sup}");
    print("return_sup=====${return_sup}");
    notifyListeners();
  }
}
