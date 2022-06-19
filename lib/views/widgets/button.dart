import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pitjarus_test/assets/colors.dart';

class ButtonWidget extends StatelessWidget {
  final color;
  final text;
  final onPressed;
  final width;
  const ButtonWidget(
      {Key? key,
      this.color,
      required this.text,
      required this.onPressed,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? Get.mediaQuery.size.width - 80,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: color ?? ColorsApp.baseColor,
            textStyle: const TextStyle(fontSize: 12)),
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
