import 'package:flutter/material.dart';
import 'package:pitjarus_test/assets/colors.dart';
import 'package:pitjarus_test/assets/size.dart';

class IconWidget extends StatelessWidget {
  final icon;
  final color;
  final size;
  const IconWidget({Key? key, required this.icon, this.color, this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: size ?? TextSize.sizep,
      color: color ?? baseColor,
    );
  }
}
