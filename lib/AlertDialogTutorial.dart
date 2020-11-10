import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app1/CustomColor.dart';
import 'package:flutter_app1/ListViewTutorial.dart';

class AlertDialogTutorial extends StatefulWidget {
  AlertDialogTutorial({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _AlertDialogTutorialState createState() => _AlertDialogTutorialState();
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

class _AlertDialogTutorialState extends State<AlertDialogTutorial> {
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
          child: InkWell(child: Text('show dialog',),onTap: (){
            _showMyDialog();
          },),
        ));
  }
  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,barrierColor: Colors.red.withOpacity(0.2),
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('This is a demo alert dialog.'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
