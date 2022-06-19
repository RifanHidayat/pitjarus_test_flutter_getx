import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pitjarus_test/assets/colors.dart';

class TextFormFieldWidget extends StatelessWidget {
  final icon,
      controller,
      hint,
      keyboardType,
      obsecureText,
      hintColor,
      onChanged;
  final color;
  const TextFormFieldWidget(
      {Key? key,
      this.icon,
      this.hint,
      this.controller,
      this.keyboardType,
      this.obsecureText,
      this.color,
      this.onChanged,
      this.hintColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(5),
      elevation: 1,
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obsecureText ?? false,
        decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            prefixIcon: IconTheme(
              data: IconThemeData(color: color ?? ColorsApp.baseColor),
              child: Icon(icon),
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ColorsApp.baseColor, width: 1.0),
                borderRadius: BorderRadius.circular(5)),
            border: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.black.withOpacity(0.2), width: 1.0),
                borderRadius: BorderRadius.circular(5)),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Colors.black.withOpacity(0.2), width: 1.0),
              borderRadius: BorderRadius.circular(5.0),
            ),
            hintText: hint.toString(),
            hintStyle: TextStyle(color: Colors.black.withOpacity(0.2))),
        onSaved: (String? value) {},
        onChanged: onChanged ?? null,
        // validator: (String? value) {
        //   return (value != null && value.contains('@'))
        //       ? 'Do not use the @ char.'
        //       : null;
        // },
      ),
    );
  }
}
