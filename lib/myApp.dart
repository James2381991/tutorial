import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app1/AlertDialogTutorial.dart';
import 'package:flutter_app1/BottomSheetTutorial.dart';
import 'package:flutter_app1/ButtonTutorial.dart';
import 'package:flutter_app1/CheckboxTutorial.dart';
import 'package:flutter_app1/ColumnTutorial.dart';
import 'package:flutter_app1/CustomColor.dart';
import 'package:flutter_app1/ExpandedPanelTutorial.dart';
import 'package:flutter_app1/GridViewTutorial.dart';
import 'package:flutter_app1/ImageTutorial.dart';
import 'package:flutter_app1/InkWellTutorial.dart';
import 'package:flutter_app1/ListViewTutorial.dart';
import 'package:flutter_app1/RadioTutorial.dart';
import 'package:flutter_app1/RowTutorial.dart';
import 'package:flutter_app1/StackTutorial.dart';
import 'package:flutter_app1/TextFieldTutorial.dart';
import 'package:flutter_app1/TextTutorial.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> arrTutorial = [
    'Text',
    'Inkwell',
    'Image',
    'Column',
    'Row',
    'Stack',
    'ListView',
    'GridView',
    'TextField',
    'Button',
    'Checkbox',
    'Radio & Slider & Switch','AlertDialog',
    'Bottom sheet','Expanded Panel'
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void Redirect(int index) {
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => TextTutorial(
                  title: arrTutorial[index],
                )),
      );
    } else if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => InkWellTutorial(
                  title: arrTutorial[index],
                )),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ImageTutorial(
                  title: arrTutorial[index],
                )),
      );
    } else if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ColumnTutorial(
                  title: arrTutorial[index],
                )),
      );
    } else if (index == 4) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => RowTutorial(
                  title: arrTutorial[index],
                )),
      );
    } else if (index == 5) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => StackTutorial(
                  title: arrTutorial[index],
                )),
      );
    } else if (index == 6) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ListViewTutorial(
                  title: arrTutorial[index],
                )),
      );
    } else if (index == 7) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => GridViewTutorial(
                  title: arrTutorial[index],
                )),
      );
    } else if (index == 8) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => TextFieldTutorial(
                  title: arrTutorial[index],
                )),
      );
    } else if (index == 9) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ButtonTutorial(
                  title: arrTutorial[index],
                )),
      );
    } else if (index == 10) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CheckBoxTutorial(
                  title: arrTutorial[index],
                )),
      );
    } else if (index == 11) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => RadioTutorial(
              title: arrTutorial[index],
            )),
      );
    } else if (index == 12) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => AlertDialogTutorial(
              title: arrTutorial[index],
            )),
      );
    }else if (index == 13) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => BottomSheetTutorial(
              title: arrTutorial[index],
            )),
      );
    }else if (index == 14) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ExpandedPanelTutorial(
              title: arrTutorial[index],
            )),
      );
    }
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
            child: ListView.builder(
                itemCount: arrTutorial.length,
                itemBuilder: (BuildContext ctxt, int index) {
                  return InkWell(
                    onTap: () {
                      Redirect(index);
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          arrTutorial[index],
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        Divider()
                      ],
                    ),
                  );
                }),
          ),
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
