import 'package:flutter/material.dart';
import 'package:flutter_app1/CustomColor.dart';

class TextFieldTutorial extends StatefulWidget {
  TextFieldTutorial({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  TextFieldTutorialState createState() => TextFieldTutorialState();
}

class TextFieldTutorialState extends State<TextFieldTutorial> {
  TextEditingController txtname = TextEditingController();
  FocusNode fn = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomWidget.appBarCustom(context, widget.title),resizeToAvoidBottomPadding: ,
        body: InkWell(
          onTap: () {
            print('screen tap');
            fn.unfocus();
          },
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(height: 60,
                        child: Card(
                            child: TextField(
                          controller: txtname,
                          cursorColor: Colors.red,
                          style: TextStyle(),
                          decoration: InputDecoration(
                            hintText: 'name',
                            prefixIcon: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Icon(Icons.margin),
                            ),
                            labelText: 'Name',
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.greenAccent, width: 1.0),
                            ),
                            errorText: valid(),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red, width: 1.0),
                            ),
                          ),
                          onChanged: (a) {
                            print(a);
                            setState(() {});
                          },
                          obscureText: true,
                          focusNode: fn,
                          onSubmitted: (a) {
                            print('end');
                          },
                          onTap: () {
                            print('start');
                          },
                        )),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        InkWell(
                            onTap: () {
                              print(txtname.text);
                              fn.nextFocus();
                            },
                            child: Text('click')),
                        Container(
                          padding: EdgeInsets.only(left: 50),
                          child: InkWell(
                              onTap: () {
                                print(txtname.text);
                              },
                              child: Text(
                                'click2',
                                style: TextStyle(color: Colors.red),
                              )),
                        ),
                      ],
                    )
                  ],
                )),
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

  String valid() {
    return txtname.text.length > 6 ? "" : 'error';
  }
}
