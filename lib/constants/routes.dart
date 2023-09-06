import 'package:flutter/material.dart';

class Routes {
  static Routes instance = Routes();
  Future<dynamic> pushandRemoveUntil(Widget widget, BuildContext context) {
    return Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => widget), (route) => false);
  }

  Future<dynamic> push(Widget widget, BuildContext context) {
    return Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => widget));
  }
}
