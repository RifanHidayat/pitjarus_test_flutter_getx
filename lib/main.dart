import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pitjarus_test/assets/colors.dart';
import 'package:pitjarus_test/routes/app.dart';
import 'package:pitjarus_test/views/list.dart';
import 'package:pitjarus_test/views/login.dart';
import 'package:pitjarus_test/views/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: LoginPage(),
      title: "Pitjarus",
      color: ColorsApp.baseColor,
      routes: Routes.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
