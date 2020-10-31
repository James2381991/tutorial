import 'package:flutter/material.dart';

class CustomColor {
  static Color hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }
  static var themeColor = hexToColor('#25488F');
}
class CustomWidget {

  static AppBar appBarCustom (BuildContext context,String title)
  {
    return AppBar(
      // Here we take the value from the MyHomePage object that was created by
      // the App.build method, and use it to set our appbar title.
      title: Text(title),

    );
  }
}