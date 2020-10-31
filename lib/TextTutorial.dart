import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app1/CustomColor.dart';

class TextTutorial extends StatefulWidget {
  TextTutorial({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _TextTutorialState createState() => _TextTutorialState();
}

class _TextTutorialState extends State<TextTutorial> {
  List<String> arrTutorial = ['Text', 'Inkwell'];
  var str = 'test1 test1 test1 test1 test1 test1 test1 test1 test2 test3';
  var arr = [];
  var nullCheck = null;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    arr = str.split('test2');

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
          child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        nullCheck  ?? 'check',
                        overflow: TextOverflow.clip,
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          fontFamily: 'OpenSans-Light',
                          fontSize: 40,
                          fontWeight: FontWeight.w300,
                          decoration: TextDecoration.underline,
                          decorationStyle: TextDecorationStyle.double,
                          decorationColor: Colors.red,
                        ),
                      ),
                      Text(
                        'test2',
                        overflow: TextOverflow.clip,
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          fontFamily: 'OpenSans-Light',
                          fontSize: 40,
                          fontWeight: FontWeight.w300,
                          decoration: TextDecoration.underline,
                          decorationStyle: TextDecorationStyle.double,
                          decorationColor: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                      text: arr[0],
                      style: TextStyle(
                        fontFamily: 'OpenSans-Light',
                        color: Colors.black,
                        fontSize: 40,
                        fontWeight: FontWeight.w300,
                        decoration: TextDecoration.underline,
                        decorationStyle: TextDecorationStyle.double,
                        decorationColor: Colors.red,
                      ),
                    ),
                    TextSpan(
                      text: 'test2',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          print('Terms of Service"');
                        },
                      style: TextStyle(
                        fontFamily: 'OpenSans-Light',
                        color: Colors.red,
                        fontSize: 40,
                        fontWeight: FontWeight.w300,
                        decoration: TextDecoration.underline,
                        decorationStyle: TextDecorationStyle.double,
                        decorationColor: Colors.red,
                      ),
                    ),
                    TextSpan(
                      text: arr[1],
                      style: TextStyle(
                        fontFamily: 'OpenSans-Light',
                        color: Colors.black,
                        fontSize: 40,
                        fontWeight: FontWeight.w300,
                        decoration: TextDecoration.underline,
                        decorationStyle: TextDecorationStyle.double,
                        decorationColor: Colors.red,
                      ),
                    ),
                  ]))
                ],
              )),
        )
        // Center(
        //   // Center is a layout widget. It takes a single child and positions it
        //   // in the middle of the parent.
        //   child:_currentIndex == 0 ? ListView(
        //     // Column is also a layout widget. It takes a list of children and
        //     // arranges them vertically. By default, it sizes itself to fit its
        //     // children horizontally, and tries to be as tall as its parent.
        //     //
        //     // Invoke "debug painting" (press "p" in the console, choose the
        //     // "Toggle Debug Paint" action from the Flutter Inspector in Android
        //     // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
        //     // to see the wireframe for each widget.
        //     //
        //     // Column has various properties to control how it sizes itself and
        //     // how it positions its children. Here we use mainAxisAlignment to
        //     // center the children vertically; the main axis here is the vertical
        //     // axis because Columns are vertical (the cross axis would be
        //     // horizontal).
        //     // mainAxisAlignment: MainAxisAlignment.center,
        //     children: <Widget>[
        //       Padding(
        //         padding: const EdgeInsets.symmetric(vertical: 50),
        //         child: Container(color: Colors.red,padding: EdgeInsets.all(20),
        //           child: Text(
        //             'You have pushed the button this many times:You have pushed the button this many times:You have pushed the button this many times:',
        //      overflow: TextOverflow.ellipsis, maxLines: 3,),
        //         ),
        //       ),
        //       Text(
        //         '$_counter',
        //         style: Theme.of(context).textTheme.headline4,
        //       ),
        //       Container(height: MediaQuery.of(context).size.height,color: Colors.black,)
        //     ],
        //   ) : Text('widget1'),
        // ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: _incrementCounter,
        //   tooltip: 'Increment',
        //   child: Icon(Icons.add),
        // ), // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
