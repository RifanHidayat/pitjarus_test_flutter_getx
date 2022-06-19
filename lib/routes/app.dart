import 'package:flutter/material.dart';
import 'package:pitjarus_test/routes/name.dart';
import 'package:pitjarus_test/views/detail.dart';
import 'package:pitjarus_test/views/list.dart';
import 'package:pitjarus_test/views/login.dart';

class Routes {
  Routes._();

  static Map<String, WidgetBuilder> get routes {
    return <String, WidgetBuilder>{
      RoutesName.list: (_) => ListPage(),
      RoutesName.login: (_) => LoginPage(),
      RoutesName.detail: (_) => DetailPage(),
    };
  }
}
