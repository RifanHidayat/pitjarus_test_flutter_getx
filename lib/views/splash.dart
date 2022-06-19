import 'dart:async';


import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pitjarus_test/routes/name.dart';

class SplassScreen extends StatefulWidget {
  @override
  _SplassScreenState createState() => _SplassScreenState();
}

class _SplassScreenState extends State<SplassScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4), () => Get.offNamed(RoutesName.login));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: <Widget>[
            //position title
            Positioned(
              child: Center(
                child: Container(
                  width: Get.mediaQuery.size.width,
                  height: 100,
                  child: const Center(
                      child: Text(
                    "PITJarus",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontFamily: "Metropolis-semi-bold"),
                  )),
                ),
              ),
              bottom: 15,
            )
          ],
        ) /* add child content here */,
      ),
    );
  }
}

// import 'package:attendance/pages/splash/animted.dart';
// import 'package:flutter/material.dart';
//
//
// class SplassScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: AnimateSplaaScreen(),
//     );
//   }
// }
