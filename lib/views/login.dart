import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pitjarus_test/assets/colors.dart';
import 'package:pitjarus_test/assets/size.dart';
import 'package:pitjarus_test/controllers/login.dart';
import 'package:pitjarus_test/routes/name.dart';
import 'package:pitjarus_test/views/widgets/Icon.dart';
import 'package:pitjarus_test/views/widgets/button.dart';
import 'package:pitjarus_test/views/widgets/checkbox.dart';
import 'package:pitjarus_test/views/widgets/label.dart';
import 'package:pitjarus_test/views/widgets/text_form_field.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    color: ColorsApp.baseColor,
                    // child: ClipPath(
                    //   clipper: myClipper(),
                    //   child: Container(
                    //     height: Get.mediaQuery.size.height / 2 - 200,
                    //     width: Get.mediaQuery.size.width,
                    //     color: ColorsApp.baseColor,
                    //   ),
                    // ),
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
                        const CheckboxWidget(),
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
                                onPressed: () => loginController.auth(context),
                              );
                      }))),
              Positioned(
                  bottom: Get.mediaQuery.size.height / 2 - 180,
                  child: Center(
                    child: Container(
                        alignment: Alignment.center,
                        width: Get.mediaQuery.size.width,
                        child: const LabelWidget(
                          text: "App ver 20013FEA68BCC820C",
                        )),
                  )),
              Positioned(
                  bottom: 0,
                  child: Container(
                    alignment: Alignment.center,
                    height: Get.mediaQuery.size.height / 2 - 200,
                    width: Get.mediaQuery.size.width,
                    color: ColorsApp.baseColor,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class myClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width / 2, size.height - 100, size.width, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    // TODO: implement getClip
    throw UnimplementedError();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    throw UnimplementedError();
  }
}
