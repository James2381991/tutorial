import 'package:flutter/material.dart';

class CustomColor {
  static Color hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }
  static var themeColor = hexToColor('#25488F');
}
class CustomWidget {

  static AppBar appBarCustom (BuildContext context1,String title)
  {
    return AppBar(
      // Here we take the value from the MyHomePage object that was created by
      // the App.build method, and use it to set our appbar title.
      title: Row(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/temp1.png',
            width: 30,
            height: 30,
            fit: BoxFit.cover,
            alignment: Alignment.topRight,
          ),
          Text(title),
        ],
      ),

    );
  }
}