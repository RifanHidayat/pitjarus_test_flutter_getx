import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pitjarus_test/assets/colors.dart';
import 'package:pitjarus_test/assets/font.dart';

class ButtonWidget extends StatelessWidget {
  final color;
  final text;
  final onPressed;
  final width;
  final textSize;
  final fontFamily;
  const ButtonWidget(
      {Key? key,
      this.color,
      required this.text,
      required this.onPressed,
      this.width,
      this.textSize,
      this.fontFamily})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? Get.mediaQuery.size.width - 80,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: color ?? ColorsApp.baseColor,
            textStyle: TextStyle(
                fontSize: textSize ?? 12,
                fontFamily: fontFamily ?? Font.interBlack)),
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
