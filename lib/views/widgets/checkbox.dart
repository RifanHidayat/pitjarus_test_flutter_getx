import 'package:flutter/material.dart';
import 'package:pitjarus_test/assets/colors.dart';

class CheckboxWidget extends StatelessWidget {
  final isChecked,onChanged;
  const CheckboxWidget({Key? key, this.isChecked,this.onChanged}) : super(key: key);

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return ColorsApp.baseColor;
  }

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      checkColor: Colors.white,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked ?? false,
      onChanged:onChanged
    );
  }
}
