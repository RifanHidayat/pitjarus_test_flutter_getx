import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pitjarus_test/assets/colors.dart';
import 'package:pitjarus_test/assets/font.dart';
import 'package:pitjarus_test/assets/size.dart';
import 'package:pitjarus_test/controllers/login.dart';
import 'package:pitjarus_test/routes/name.dart';
import 'package:pitjarus_test/views/list.dart';
import 'package:pitjarus_test/views/widgets/Icon.dart';
import 'package:pitjarus_test/views/widgets/button.dart';
import 'package:pitjarus_test/views/widgets/checkbox.dart';
import 'package:pitjarus_test/views/widgets/label.dart';
import 'package:pitjarus_test/views/widgets/text_form_field.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final LoginController loginController = Get.put(LoginController());

  final Widget svg = SvgPicture.asset(
      "assets/images/top.svg",
      semanticsLabel: 'Acme Logo'
  );
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return loginController.isLogin.value
          ? ListPage()
          : Scaffold(
              body: SingleChildScrollView(
                child: Container(
                  height: Get.mediaQuery.size.height,
                  width: Get.mediaQuery.size.width,
                  child: Stack(
                    children: [
                      Positioned(
                          top: 0,
                          child: Container(
                            height: Get.mediaQuery.size.height / 2 - 200,
                            width: Get.mediaQuery.size.width,

                            child: svg,

                          )),
                      Container(
                        height: Get.mediaQuery.size.height,
                        width: Get.mediaQuery.size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextFormFieldWidget(
                              controller: loginController.usernameCtr,
                              icon: FontAwesomeIcons.userCircle,
                              keyboardType: TextInputType.text,
                              hint: "Username",
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormFieldWidget(
                              controller: loginController.passwordCtr,
                              icon: MdiIcons.lock,
                              keyboardType: TextInputType.visiblePassword,
                              hint: "Password",
                              obsecureText: true,
                            ),
                            Row(
                              children: [
                                Obx(() {
                                  return CheckboxWidget(
                                    isChecked:
                                        loginController.isKeepusername.value,
                                    onChanged: (value) {
                                      loginController.isKeepusername.value =
                                          value;
                                    },
                                  );
                                }),
                                LabelWidget(
                                  text: "Keep Username",
                                  color: ColorsApp.baseColor,
                                ),
                                Expanded(
                                  child: Container(
                                    width: double.maxFinite,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        IconWidget(
                                          size: TextSize.sizeh2,
                                          icon: Icons.download,
                                          color: ColorsApp.baseColor,
                                        ),
                                        LabelWidget(
                                          text: "Checked Update",
                                          color: ColorsApp.baseColor,
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                          bottom: Get.mediaQuery.size.height / 2 - 150,
                          child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 40),
                              child: Obx(() {
                                return loginController.isLoading.value
                                    ? Container(
                                        width: Get.mediaQuery.size.width - 80,
                                        child: const Center(
                                            child: CircularProgressIndicator()))
                                    : ButtonWidget(
                                        text: "Login",
                                        onPressed: () =>
                                            loginController.auth(context),
                                      );
                              }))),
                      Positioned(
                          bottom: Get.mediaQuery.size.height / 2 - 180,
                          child: Center(
                            child: Container(
                                alignment: Alignment.center,
                                width: Get.mediaQuery.size.width,
                                child: LabelWidget(
                                  size: TextSize.sizep2,
                                  color: ColorsApp.blackColor4,
                                  text: "App Ver 1.0.0 - 20013FEA6BCC820C",
                                )),
                          )),
                   Positioned(
                            bottom: 0,

                              child: Container(
                                height: 80,
                                width: Get.mediaQuery.size.width,
                                alignment: Alignment.bottomCenter,
                                child: RotatedBox(
                                  quarterTurns: 2,
                                  child: svg,
                                ),
                              ),
                            ),

                    ],
                  ),
                ),
              ),
            );
    });
  }
}

class TopClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    // path.quadraticBezierTo(
    //     size.width / 2, size.height - 100, size.width, size.height);
    // path.lineTo(size.width, size.height);
    // path.lineTo(size.width, 0);
    path.close();
    return path;
    // TODO: implement getClip
  //  throw UnimplementedError();
  }


  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
    throw UnimplementedError();
  }
}

class BottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);



    path.quadraticBezierTo(
        size.width / 2, size.height - 100, size.width, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
    // TODO: implement getClip
    //  throw UnimplementedError();
  }


  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
    throw UnimplementedError();
  }
}
