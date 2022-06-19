import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:pitjarus_test/assets/alert.dart';
import 'package:pitjarus_test/models/stores.dart';
import 'package:pitjarus_test/routes/app.dart';
import 'package:pitjarus_test/routes/name.dart';
import 'package:pitjarus_test/services/auth.dart';
import 'package:pitjarus_test/services/db_helper.dart';
import 'package:pitjarus_test/services/endpoin.dart';
import 'package:get/get.dart';
import 'package:pitjarus_test/views/list.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  DatabaseHelper db = new DatabaseHelper();
  RxBool isLoading = false.obs;
  var usernameCtr = TextEditingController();
  var passwordCtr = TextEditingController();
  RxBool isLogin = false.obs;

  RxBool isKeepusername = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getSession();
  }

  // void auth(BuildContext context) async {
  //   var data = {
  //     'username': usernameCtr.text,
  //     'password': passwordCtr.text,
  //   };
  //   isLoading.value = true;
  //   AuthService request = await AuthService(url: EndPoint.auth, body: data);
  //   request.post().then((value) async {
  //     isLoading.value = true;
  //     var response = jsonDecode(value.body);

  //     if (response['stores'] != null) {
  //       print(usernameCtr.text);
  //       saveSession(true, isKeepusername.value, usernameCtr.text);
  //       isLogin.value = true;
  //       List<StoreModel> stores = StoreModel.fromJsonToList(response['stores']);

  //       stores.forEach((element) async {
  //         await db.save(context, element);
  //       });
  //       Future.delayed(const Duration(seconds: 5), () {
  //         isLoading.value = false;
  //         print(response);
  //       });
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(builder: (context) => ListPage()),
  //       );
  //     } else {
  //       isLoading.value = false;
  //       Alert().messagevalidation(response['message'], 4);
  //     }
  //     //

  //     print(isLoading);
  //     return null;
  //   });
  //   isLoading = false.obs;
  // }

  void auth(BuildContext context) async {
    isLoading.value = true;
    var body = {
      'username': usernameCtr.text,
      'password': passwordCtr.text,
    };
    var response = await http
        .post(Uri.parse(EndPoint.auth), body: body)
        .timeout(Duration(minutes: 2));
    final data = jsonDecode(response.body);
    print(response.body);
    if (data['stores'] != null) {
      saveSession(true, isKeepusername.value, usernameCtr.text);
      List<StoreModel> stores = StoreModel.fromJsonToList(data['stores']);

      stores.forEach((element) async {
        await db.save(context, element);
      });

      isLoading.value = false;
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => ListPage()),
      // );
      Get.offAll(RoutesName.list);
    } else {
      isLoading.value = false;
      Alert().messagevalidation(data['message'], 4);
    }
  }

  void saveSession(isLogin, isKeepUsername, username) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool("is_login", isLogin);
    sharedPreferences.setBool("is_keep_username", isKeepUsername);
    sharedPreferences.setString("username", username);
  }

  void getSession() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    isLogin.value = sharedPreferences.getBool("is_login")!;

    var isKeepUsername = sharedPreferences.getBool("is_keep_username");
    var username = sharedPreferences.getString("username");
    isKeepusername.value = isKeepUsername!;
    if (isKeepUsername == true) {
      usernameCtr.text = username.toString();
    }
  }

  void logout() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var isLogin = sharedPreferences.setBool("is_login", false);
    usernameCtr.clear();
    passwordCtr.clear();
    await db.delete();

    await Get.offAllNamed(RoutesName.login);
  }
}
