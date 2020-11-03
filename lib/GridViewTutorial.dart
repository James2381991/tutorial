import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app1/CustomColor.dart';

class GridViewTutorial extends StatefulWidget {
  GridViewTutorial({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _GridViewTutorialState createState() => _GridViewTutorialState();
}

class _GridViewTutorialState extends State<GridViewTutorial> {
  var color = Colors.black;
  List<String> arrTutorial = [
    'Text',
    'Inkwell',
    'Image',
    'Column',
    'Row',
    'Stack',
    'ListView',
    'GridView',
    'Inkwell',
    'Image',
    'Column',
    'Row',
    'Stack',
    'ListView',
    'GridView',
    'Inkwell',
    'Image',
    'Column',
    'Row',
    'Stack',
    'ListView',
    'GridView',
    'Inkwell',
    'Image',
    'Column',
    'Row',
    'Stack',
    'ListView',
    'GridView',
    'Inkwell',
    'Image',
    'Column',
    'Row',
    'Stack',
    'ListView',
    'GridView',
    'Inkwell',
    'Image',
    'Column',
    'Row',
    'Stack',
    'ListView',
    'GridView',
    'Inkwell',
    'Image',
    'Column',
    'Row',
    'Stack',
    'ListView',
    'GridView',
    'Inkwell',
    'Image',
    'Column',
    'Row',
    'Stack',
    'ListView',
    'GridView'
  ];
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
          child: NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification scrollInfo) {
              if ((scrollInfo.metrics.pixels ==
                  scrollInfo.metrics.maxScrollExtent)) {
                // start loading data
                print('end');
              }
              return true;
            },
            child: GridView.builder(
              itemCount: arrTutorial.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemBuilder: (BuildContext context, int index) {
                return new Card(
                  child: new GridTile(
                    footer: new Text(arrTutorial[index]),
                    child: new Text(arrTutorial[
                        index]), //just for testing, will fill with image later
                  ),
                );
              },
            ),
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
