// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:pitjarus_test/assets/colors.dart';

// class TextFormFieldPasswordWidget extends StatelessWidget {
//   const TextFormFieldPasswordWidget({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       keyboardType: TextInputType.text,
      
//       decoration: InputDecoration(
        
//         contentPadding: EdgeInsets.fromLTRB(5, 5, 5, 0),
//         prefixIcon: Icon(Icons.),
//         focusedBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: ColorsApp.baseColor, width: 1.0),
//             borderRadius: BorderRadius.circular(5)),
//         border: OutlineInputBorder(
//             borderSide: BorderSide(color: ColorsApp.line, width: 1.0),
//             borderRadius: BorderRadius.circular(5)),
//         hintText: 'Username',
//       ),
//       onSaved: (String? value) {},
//       validator: (String? value) {
//         return (value != null && value.contains('@'))
//             ? 'Do not use the @ char.'
//             : null;
//       },
//     );
//   }
// }
