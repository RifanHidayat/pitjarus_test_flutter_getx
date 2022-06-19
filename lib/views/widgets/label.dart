import 'package:flutter/material.dart';
import 'package:pitjarus_test/assets/colors.dart';
import 'package:pitjarus_test/assets/size.dart';

class LabelWidget extends StatelessWidget {
  final text;
  final size;
  final color;

  const LabelWidget({Key? key, this.text, this.size, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toString(),
      style: TextStyle(
          fontSize: size ?? TextSize.sizep, color: color ?? ColorsApp.black),
    );
  }
}
