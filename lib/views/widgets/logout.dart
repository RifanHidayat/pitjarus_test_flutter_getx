import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogoutWidget extends StatelessWidget {
  final onPressed;
  const LogoutWidget({Key? key,this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.mediaQuery.size.width / 4,
      child: OutlinedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.red)))),
        onPressed: onPressed,
        child: const Text(
          'Logout',
          style: TextStyle(color: Colors.red),
        ),
      ),
    );
    ;
  }
}
