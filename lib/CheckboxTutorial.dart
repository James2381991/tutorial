import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app1/CustomColor.dart';
import 'package:flutter_app1/ListViewTutorial.dart';

class CheckBoxTutorial extends StatefulWidget {
  CheckBoxTutorial({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _CheckBoxTutorialState createState() => _CheckBoxTutorialState();
}

class ListTileCursor extends MaterialStateMouseCursor {
  @override
  MouseCursor resolve(Set<MaterialState> states) {
    // if (states.contains(MaterialState.disabled)) {
    //   return SystemMouseCursors.forbidden;
    // }
    return SystemMouseCursors.forbidden;
  }

  @override
  String get debugDescription => 'ListTileCursor()';
}

class _CheckBoxTutorialState extends State<CheckBoxTutorial> {
  var color = Colors.black;
  bool expanded = false;
  var dropdownValue = 'One';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  var _isChecked = ['two', 'one'];
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: CustomWidget.appBarCustom(context, widget.title),

        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Container(
            height: 350.0,
            child: Column(
              children: ['one', 'two', 'three']
                  .map((t) => CheckboxListTile(
                        title: Row(
                          children: [
                            Text(t),Text(t)
                          ],
                        ),
                        subtitle: Text(t),tristate: true,
                        value: _isChecked.contains(t),
                        checkColor: Colors.green,
                        activeColor: Colors.red,
                        contentPadding: EdgeInsets.symmetric(horizontal: 50),
                        dense: true,secondary: Text(t),
                        onChanged: (val) {
                          if (_isChecked.contains(t)) {
                            _isChecked.remove(t);
                          } else {
                            _isChecked.add(t);
                          }
                          setState(() {});
                        },
                      ))
                  .toList(),
            ),
          ),
        ));
  }
}
