import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app1/CustomColor.dart';
import 'package:flutter_app1/ListViewTutorial.dart';

class ButtonTutorial extends StatefulWidget {
  ButtonTutorial({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _ButtonTutorialState createState() => _ButtonTutorialState();
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
class _ButtonTutorialState extends State<ButtonTutorial> {
  var color = Colors.black;
  bool expanded = false;
  var dropdownValue = 'One';
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
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            // Add your onPressed code here!
          },
          label: Text(expanded ? 'floating' : ''),
          icon: Icon(Icons.email),
          isExtended: expanded,
          backgroundColor: Colors.green,
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  FlatButton(
                    color: Colors.blue,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(50.0)),
                    textColor: Colors.white,
                    disabledColor: Colors.grey,
                    disabledTextColor: Colors.black,
                    padding: EdgeInsets.all(20.0),
                    splashColor: Colors.blueAccent,
                    onPressed: () {
                      expanded = true;
                      setState(() {});
                      /*...*/
                    },
                    child: Text(
                      "Flat Button",
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                  Text(
                    'Icon button',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  IconButton(
                    icon: Icon(Icons.volume_up),
                    tooltip: 'Increase volume by 10',
                    onPressed: () {},
                    iconSize: 30,
                    enableFeedback: true,
                    constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height / 2),
                  ),
                  Text(
                    'Outline button',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  OutlineButton(
                    onPressed: () {
                      print('Received click');
                    },
                    borderSide: BorderSide(width: 5),
                    visualDensity: VisualDensity(horizontal: 3),
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    child: Text('Click Me',style: TextStyle(fontSize: 50),),
                  ),
                  RaisedButton(
                    child: const Text('Hello'),
                    color: Colors.red,
                    onPressed: null,
                  ),
                  Text(
                    'Button Bar',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  Container(
                    width: 150,
                    child: ButtonBar(
                      mainAxisSize: MainAxisSize.min,
                      buttonMinWidth: 150,
                      overflowDirection: VerticalDirection
                          .down, // this will take space as minimum as posible(to center)
                      children: <Widget>[
                        new RaisedButton(
                          child: new Text('Hello'),
                          onPressed: null,mouseCursor: ListTileCursor(),
                        ),
                        new RaisedButton(
                          child: new Text('Hi'),
                          onPressed: null,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'Button Bar',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  Container(height: 20,
                    child: DropdownButton<String>(
                      value: dropdownValue,
                      icon: Icon(Icons.arrow_downward),
                      iconSize: 24,isDense: true,
                      elevation: 16,
                      style: TextStyle(color: Colors.deepPurple),
                      underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
                      ),
                      onChanged: (String newValue) {
                      var a =  <int>[1,2,3,4]
                            .map<String>((int value) {
                          return value.toString();
                        }).toList();
                    double.parse( '1');
                        setState(() {
                          dropdownValue = newValue;
                        });
                      },
                      items: <String>['One', 'Two', 'Free', 'Four']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
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
