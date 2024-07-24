import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api {
  //rigester opration
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController passWord = TextEditingController();
  TextEditingController confirmPassWord = TextEditingController();
  TextEditingController address = TextEditingController();
  String ip = "https://mangamediaa.com/mango/public";

  var lRegister;
  Future Register() async {
    lRegister = null;
    String url = "$ip/api/user/register";
    try {
      var response = await http.post(
        Uri.parse(url),
        body: {
          "first_name": "${firstName.text.toString()}",
          "last_name": "${lastName.text.toString()}",
          "phone": "${phone.text.toString()}",
          "email": "${email.text.toString()}",
          "country": "egypt",
          "password": "${passWord.text.toString()}",
          "password_confirmation": "${confirmPassWord.text.toString()}",
          "city": "sohage",
          "address": "${address.text.toString()}"
        },
        headers: {'Accept': 'application/json'},
      );
      var responsebody = jsonDecode(response.body);

      if (responsebody.isNotEmpty) {
        lRegister = responsebody;
      }

      print("responbody=====${responsebody}");
      print("responbody=====${responsebody}");
      print("responbody=====${responsebody}");
      print("responbody=====${responsebody}");
    } catch (e) {
      print(e);
    }

    return lRegister;
  }

  TextEditingController code1 = TextEditingController();
  TextEditingController code2 = TextEditingController();
  TextEditingController code3 = TextEditingController();
  TextEditingController code4 = TextEditingController();
  TextEditingController code5 = TextEditingController();
  TextEditingController code6 = TextEditingController();
  TextEditingController code7 = TextEditingController();
  var verfyEmail;
  Future VerfyEmail(String token) async {
    String code =
        "${code1.text.toString()}${code2.text.toString()}${code3.text.toString()}${code4.text.toString()}${code5.text.toString()}${code6.text.toString()}";
    verfyEmail = null;
    String url = "$ip/api/check-code";
    try {
      var response = await http.post(
        Uri.parse(url),
        body: {
          "code": "${code}",
        },
        headers: {'Accept': 'application/json', 'Authorization': '$token'},
      );
      var responsebody = jsonDecode(response.body);

      if (responsebody.isNotEmpty) {
        verfyEmail = responsebody;
      }
      print("responbody=====${responsebody}");
      print("responbody=====${responsebody}");
      print("responbody=====${responsebody}");
    } catch (e) {
      print(e);
    }
    return verfyEmail;
  }

  //login
  TextEditingController emailLogin = TextEditingController();
  TextEditingController passWordLogin = TextEditingController();
  var llogin;
  Future Login(String tokendevice) async {
    llogin = null;
    String url = "$ip/api/user/login";
    try {
      var response = await http.post(
        Uri.parse(url),
        body: {
          "email": "${emailLogin.text.toString()}",
          "password": "${passWordLogin.text.toString()}",
          "fcm_token": tokendevice
        },
        headers: {'Accept': 'application/json'},
      );
      var responsebody = jsonDecode(response.body);

      if (responsebody.isNotEmpty) {
        llogin = responsebody;
      }
      print("responbody=====${responsebody}");
      print("responbody=====${responsebody}");
      print("responbody=====${responsebody}");
    } catch (e) {
      print(e);
    }
    return llogin;
  }

  //newpass opration
  TextEditingController emailnewpass1 = TextEditingController();
  var newpass1;
  Future newPass1() async {
    newpass1 = null;
    String url = "$ip/api/user/reset/password";
    try {
      var response = await http.post(
        Uri.parse(url),
        body: {"email": "${emailnewpass1.text.toString()}"},
        headers: {'Accept': 'application/json'},
      );
      var responsebody = jsonDecode(response.body);

      if (responsebody.isNotEmpty) {
        newpass1 = responsebody;
      }
      print("responbody=====${responsebody}");
      print("responbody=====${responsebody}");
      print("responbody=====${responsebody}");
    } catch (e) {
      print(e);
    }
    return newpass1;
  }

  var verfyEmailNewPass;
  Future VerfyEmailNewPass(String emaill) async {
    String code =
        "${code1.text.toString()}${code2.text.toString()}${code3.text.toString()}${code4.text.toString()}${code5.text.toString()}${code6.text.toString()}";
    print("code===== $code");
    print("code===== $code");
    print("code===== $code");
    print("code===== $code");
    print("code===== $code");
    verfyEmailNewPass = null;
    String url = "$ip/api/user/reset/password/checkcode";
    try {
      var response = await http.post(
        Uri.parse(url),
        body: {
          "code": "$code",
          "email": "${emaill.toString()}",
        },
        headers: {
          'Accept': 'application/json',
        },
      );
      var responsebody = jsonDecode(response.body);

      if (responsebody.isNotEmpty) {
        verfyEmailNewPass = responsebody;
      }
      print("responbody=====${responsebody}");
      print("responbody=====${responsebody}");
      print("responbody=====${responsebody}");
    } catch (e) {
      print(e);
    }
    return verfyEmailNewPass;
  }

  TextEditingController passWordNew = TextEditingController();
  TextEditingController confirmPassWordNew = TextEditingController();
  var newPass3;
  Future NewPass3() async {
    verfyEmailNewPass = null;
    String url = "$ip/api/user/reset/password/change/password";
    try {
      var response = await http.post(
        Uri.parse(url),
        body: {
          "password": "${passWordNew.text.toString()}",
          "password_confirmation": "${confirmPassWordNew.text.toString()}",
          "email": "${emailnewpass1.text.toString()}",
        },
        headers: {
          'Accept': 'application/json',
        },
      );
      var responsebody = jsonDecode(response.body);

      if (responsebody.isNotEmpty) {
        newPass3 = responsebody;
      }
      print("responbody=====${responsebody}");
      print("responbody=====${responsebody}");
      print("responbody=====${responsebody}");
    } catch (e) {
      print(e);
    }
    return newPass3;
  }

  //vote
  TextEditingController linkfacebook = TextEditingController();
  TextEditingController linkinstgram = TextEditingController();
  String statusInMedia = '';

  TextEditingController startSalary = TextEditingController();
  TextEditingController endSalary = TextEditingController();
  TextEditingController note = TextEditingController();

  var vote;
  Future Vote(String token) async {
    vote = null;
    String url = "$ip/api/user/vote";
    try {
      var response = await http.post(
        Uri.parse(url),
        body: {
          "facebook_link": "${linkfacebook.text.toString()}",
          "instagram_link": "${linkinstgram.text.toString()}",
          "status_in_media": "${statusInMedia}",
          "from": "${startSalary.text.toString()}",
          "to": "${endSalary.text.toString()}",
          "note": "${note.text.toString()}"
        },
        headers: {'Accept': 'application/json', 'Authorization': '$token'},
      );
      var responsebody = jsonDecode(response.body);

      if (responsebody.isNotEmpty) {
        vote = responsebody;
      }
      print("responbody=====${responsebody}");
      print("responbody=====${responsebody}");
      print("responbody=====${responsebody}");
    } catch (e) {
      print(e);
    }
    return vote;
  }

  //campain
  String order_type_campain = '';
  String target_campain = "";
  TextEditingController link_facebook_campain = TextEditingController();
  TextEditingController link_instgram_campain = TextEditingController();
  TextEditingController link_post_campain_facebook = TextEditingController();
  TextEditingController link_post_campain_instgram = TextEditingController();
  TextEditingController salaryforday_campain = TextEditingController();
  TextEditingController target_area_campain = TextEditingController();
  var compain;
  Future Campain(String token) async {
    compain = null;
    String url = "$ip/api/user/advertising/campaign";
    try {
      var response = await http.post(
        Uri.parse(url),
        body: {
          "order_type": "$order_type_campain",
          "facebook_link": "${link_facebook_campain.text}",
          "instagram_link": "${link_instgram_campain.text}",
          "facebook_post_link": "${link_post_campain_facebook.text}",
          "instagram_post_link": "${link_post_campain_instgram.text}",
          "target": "$target_campain",
          "day_price": "${salaryforday_campain.text}",
          "target_area": "${target_area_campain.text}"
        },
        headers: {'Accept': 'application/json', 'Authorization': '$token'},
      );
      var responsebody = jsonDecode(response.body);

      if (responsebody.isNotEmpty) {
        compain = responsebody;
        order_type_campain = '';
        target_campain = '';
        target_area_campain.text = '';
        link_facebook_campain.text = '';
        link_instgram_campain.text = '';
        link_post_campain_facebook.text = '';
        link_post_campain_instgram.text = '';
        salaryforday_campain.text = '';
      }
      print("responbody=====${responsebody}");
      print("responbody=====${responsebody}");
      print("responbody=====${responsebody}");
    } catch (e) {
      print(e);
    }
    return compain;
  }

  //reals
  TextEditingController name_prodect = TextEditingController();
  String image_reals = '';
  TextEditingController description_prodect = TextEditingController();
  TextEditingController roude_usage_prodect = TextEditingController();
  TextEditingController salary_prodect = TextEditingController();
  TextEditingController offers_prodect = TextEditingController();
  TextEditingController gift_prodect = TextEditingController();
  var reals;
  Future Reals(String token) async {
    reals = null;
    String url = "$ip/api/user/advertising/reels";
    try {
      var response = await http.post(
        Uri.parse(url),
        body: {
          "product_name": "${name_prodect.text.toString()}",
          "product_image": "$image_reals",
          "product_description": "${description_prodect.text.toString()}",
          "product_usage": "${roude_usage_prodect.text.toString()}",
          "product_price": "${salary_prodect.text.toString()}",
          "offers": "${offers_prodect.text.toString()}",
          "gift": "${gift_prodect.text.toString()}"
        },
        headers: {'Accept': 'application/json', 'Authorization': '$token'},
      );
      var responsebody = jsonDecode(response.body);

      if (responsebody.isNotEmpty) {
        reals = responsebody;
      }
      print("responbody=====${responsebody}");
      print("responbody=====${responsebody}");
      print("responbody=====${responsebody}");
    } catch (e) {
      print(e);
    }
    return reals;
  }

  var data_offers = null;
  Future GetOffers(String tok) async {
    data_offers = null;
    String url = "$ip/api/user/get/offers";
    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {'Accept': 'application/json', 'Authorization': '$tok'},
      );
      if (!response.body.isEmpty) {
        var responsebody = jsonDecode(response.body);
        data_offers = responsebody;
        print(responsebody.length);
        print(responsebody.length);
        print(responsebody);
        print(responsebody);
      }
    } catch (e) {
      print(e);
    }

    return data_offers;
  }

  var orderOffers;
  Future OrderOffers(String token, int id) async {
    orderOffers = null;
    String url = "$ip/api/user/add/offer";
    try {
      var response = await http.post(
        Uri.parse(url),
        body: {"offer_id": "$id"},
        headers: {'Accept': 'application/json', 'Authorization': '$token'},
      );
      var responsebody = jsonDecode(response.body);

      if (responsebody.isNotEmpty) {
        orderOffers = responsebody;
      }
      print("responbody=====${responsebody}");
      print("responbody=====${responsebody}");
      print("responbody=====${responsebody}");
    } catch (e) {
      print(e);
    }
    return orderOffers;
  }

  //client profile
  var data_client_profile = null;
  Future GetDataClientProfile(String tok, String id) async {
    data_client_profile = null;
    String url = "$ip/api/user/get-all-user-order/$id";
    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {'Accept': 'application/json', 'Authorization': '$tok'},
      );
      if (!response.body.isEmpty) {
        var responsebody = jsonDecode(response.body);
        data_client_profile = responsebody;
        print(responsebody.length);
        print(responsebody.length);
        print(responsebody["data"]['latest_subscription']);
        print(responsebody["data"]['latest_subscription']);
        print(responsebody["data"]['latest_subscription']);
        print(responsebody);
        print(responsebody);
      }
    } catch (e) {
      print(e);
    }

    return data_client_profile;
  }

  var logout = null;
  Future Logout(String tok) async {
    logout = null;
    String url = "$ip/api/user/logout";
    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {'Accept': 'application/json', 'Authorization': '$tok'},
      );
      if (!response.body.isEmpty) {
        var responsebody = jsonDecode(response.body);
        logout = responsebody;
        print(responsebody.length);
        print(responsebody.length);
        print(responsebody);
        print(responsebody);
      }
    } catch (e) {
      print(e);
    }

    return logout;
  }

  var imageprof;
  String image_base64 = '';
  Future uploudImageProfile(String token) async {
    imageprof = null;
    String url = "$ip/api/user/update/image";
    try {
      var response = await http.post(
        Uri.parse(url),
        body: {"iamge_baase64": "$image_base64"},
        headers: {'Accept': 'application/json', 'Authorization': '$token'},
      );
      var responsebody = jsonDecode(response.body);

      if (responsebody.isNotEmpty) {
        imageprof = responsebody;
      }
      print("responbody=====${responsebody}");
      print("responbody=====${responsebody}");
      print("responbody=====${responsebody}");
    } catch (e) {
      print(e);
    }
    return imageprof;
  }

  var notification = null;
  Future GetAllNotification(String tok) async {
    notification = null;
    String url = "$ip/api/user/get/all-notifications";
    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {'Accept': 'application/json', 'Authorization': '$tok'},
      );
      if (!response.body.isEmpty) {
        var responsebody = jsonDecode(response.body);
        notification = responsebody;
        print(responsebody.length);
        print(responsebody.length);
        print(responsebody);
        print(responsebody);
      }
    } catch (e) {
      print(e);
    }

    return notification;
  }

  var count_notification = null;
  Future GetCountAllNotification(String tok) async {
    count_notification = null;
    String url = "$ip/api/user/count/all-notifications";
    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {'Accept': 'application/json', 'Authorization': '$tok'},
      );
      if (!response.body.isEmpty) {
        var responsebody = jsonDecode(response.body);
        count_notification = responsebody;
        print(responsebody.length);
        print(responsebody.length);
        print(responsebody);
        print(responsebody);
      }
    } catch (e) {
      print(e);
    }

    return count_notification;
  }

  //cancel
  var cancel;
  Future Cansel(String token, String subscription_id) async {
    cancel = null;
    String url = "$ip/api/user/cancel-subscription";
    try {
      var response = await http.post(
        Uri.parse(url),
        body: {
          "subscription_id":subscription_id
        },
        headers: {'Accept': 'application/json', 'Authorization': '$token'},
      );
      var responsebody = jsonDecode(response.body);

      if (responsebody.isNotEmpty) {
        cancel = responsebody;
      }
      print("responbody=====${responsebody}");
      print("responbody=====${responsebody}");
      print("responbody=====${responsebody}");
    } catch (e) {
      print(e);
    }
    return cancel;
  }
  //for orders اتاكد 
  var retern_sup;
  Future ReternSup(String token) async {
    retern_sup = null;
    String url = "$ip/api/user/active-subscription";
    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {'Accept': 'application/json', 'Authorization': '$token'},
      );
      var responsebody = jsonDecode(response.body);
      if (responsebody.isNotEmpty) {
        retern_sup = responsebody;
      }
      print("responbody=====${responsebody}");
      print("responbody=====${responsebody}");
      print("responbody=====${responsebody}");
    } catch (e) {
      print(e);
    }
    return retern_sup;
  }
}