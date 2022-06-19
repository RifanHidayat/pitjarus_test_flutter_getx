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
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  DatabaseHelper db = new DatabaseHelper();
  RxBool isLoading = false.obs;
  var usernameCtr = TextEditingController();
  var passwordCtr = TextEditingController();

  RxBool isKeepusername = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getSession();
  }

  void auth(BuildContext context) async {
    print("username ${usernameCtr.text}");
    print("password ${passwordCtr.text}");

    var data = {
      'username': usernameCtr.text,
      'password': passwordCtr.text,
    };
    isLoading.value = true;
    print(isLoading);
    AuthService request = await AuthService(url: EndPoint.auth, body: data);
    request.post().then((value) async {
      var response = jsonDecode(value.body);
      print(response);
      if (value.statusCode == 200) {
        usernameCtr.text = "";
        if (response['stores'] != null) {
          saveSession(true, isKeepusername.value, usernameCtr.text);
          List<StoreModel> stores =
              StoreModel.fromJsonToList(response['stores']);

          stores.forEach((element) async {
            await db.save(context, element);
          });

          await Get.offAllNamed(RoutesName.list);
          usernameCtr.text = "";
          passwordCtr.text = "";
        } else {
          isLoading.value = false;
          Alert().messagevalidation(response['message'], 4);
        }
        //
      }

      print(isLoading);
      return null;
    });
    // isLoading = false.obs;
  }

  void saveSession(isLogin, isKeepUsername, username) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool("is_login", isLogin);
    sharedPreferences.setBool("is_keep_username", isKeepUsername);
    sharedPreferences.setString("username", username);
  }

  void getSession() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

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
    await db.delete();

    await Get.offAllNamed(RoutesName.login);
  }
}
