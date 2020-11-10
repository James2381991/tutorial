import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app1/CustomColor.dart';
import 'package:flutter_app1/ListViewTutorial.dart';

class RadioTutorial extends StatefulWidget {
  RadioTutorial({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _RadioTutorialState createState() => _RadioTutorialState();
}

enum SingingCharacter { lafayette, jefferson }

class _RadioTutorialState extends State<RadioTutorial> {
  SingingCharacter _character = SingingCharacter.lafayette;
  double _currentSliderValue = 0;
  bool isSwitched = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
            child: Column(
              children: [
                Column(
                  children: <Widget>[
                    ListTile(
                      title: const Text('Lafayette'),
                      leading: Radio(
                        value: SingingCharacter.lafayette,
                        groupValue: _character,
                        onChanged: (SingingCharacter value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text('Thomas Jefferson'),
                      leading: Radio(
                        value: SingingCharacter.jefferson,
                        groupValue: _character,
                        onChanged: (SingingCharacter value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Slider(
                  value: _currentSliderValue,
                  min: 0,
                  max: 250,
                  onChangeEnd: (a) {
                    print(a);
                  },
                  onChangeStart: (a) {
                    print(a);
                  },
                  // divisions: 5,
                  label: _currentSliderValue.round().toString(),
                  activeColor: Colors.red, inactiveColor: Colors.green,
                  onChanged: (double value) {
                    // print(value);
                    setState(() {
                      _currentSliderValue = value;
                    });
                  },
                ),

                Switch(
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() {
                      isSwitched = value;
                      print(isSwitched);
                    });
                  },
                  activeTrackColor: Colors.lightGreenAccent,
                  activeColor: Colors.green,inactiveThumbColor: Colors.blue,inactiveTrackColor: Colors.red,
                ),
              ],
            )));
  }
}
