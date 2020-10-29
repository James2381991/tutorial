import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app1/CustomColor.dart';
import 'package:flutter_app1/Home.dart';

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
  int _counter = 0;
  int _currentIndex = 0;
  List<BottomNavigationBarItem> bottomWidget = [];
  int selectedCell = -1;
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  TextEditingController txtName = TextEditingController();
  FocusNode fn = FocusNode();
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('initState');
    fn.addListener((){
      print(fn.hasFocus.toString());
    });

    bottomWidget = [
      BottomNavigationBarItem(
        icon: Icon(
          Icons.home,
        ),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.business),
        label: 'Business',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.school),
        label: 'School',
      ),
    ];
    bottomWidget.add(
      BottomNavigationBarItem(
        icon: Icon(Icons.school),
        label: 'School',
      ),
    );
  }

  Widget temp(index) {
    return InkWell(
      onTap: () {
        selectedCell = index;
        setState(() {});
        print(index);
      },
      child: Container(
        color: selectedCell == index ? CustomColor.themeColor : Colors.white,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('index$index'),
                SizedBox(
                  width: 10,
                ),
                Text('index$index'),
              ],
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
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
        key: _drawerKey,
        appBar: CustomWidget.appBarCustom(context, 'MyApp', true, true, () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //       builder: (context) => Home(
          //             title: 'home123',
          //           )),
          // );
          print(txtName.text);
        }),
        endDrawer: Container(
          alignment: Alignment.topRight,
          padding: EdgeInsets.only(top: 150),
          child: Container(
            width: 200,
            height: 200,
            child: Drawer(
              child: Container(
                  child: Container(
                color: CustomColor.themeColor,
                width: 50,
                child: Column(
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    Text('jd')
                  ],
                ),
              )),
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: bottomWidget,
          currentIndex: _currentIndex,
          selectedItemColor: Colors.red,
          onTap: (index) {
            if (index == 3) {
              _currentIndex = 0;
              bottomWidget.removeAt(3);
            } else {
              _currentIndex = index;
            }
            setState(() {});
            print(index);
          },
        ),
        body: GestureDetector(
          onTap: () {
            fn.unfocus();
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.amber,
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape
                            .circle, // BoxShape.circle or BoxShape.retangle
                        //color: const Color(0xFF66BB6A),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 5.0,
                          ),
                        ]),
                  ),
                ),
                Container(
                  child: Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(75)),
                      child: FadeInImage.assetNetwork(
                        placeholder: 'assets/images/back.png',
                        width: 150,
                        height: 150,
                        fit: BoxFit.cover,
                        image:
                            'https://i.picsum.photos/id/237/200/300.jpg?hmac=TmmQSbShHz9CdQm0NkEjx1Dyh_Y984R9LpNrpvH2D_U',
                      ),
                    ),
                  ),
                ),
                Container(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    onSubmitted: (a) {
                      print(a);
                      FocusScope.of(context).requestFocus(fn);
                    },onChanged: (a){
                      print(a);
                  },
                    maxLength: 10,
                    decoration: InputDecoration(
                        hintText: 'Enter Name',
                        labelText: "Animatable hint",
                        focusColor: Colors.red,
                        fillColor: Colors.red,
                        prefixIcon: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/back.png',
                              width: 20,
                              height: 20,
                            ),
                          ],
                        )),
                  ),
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  color: Colors.white,
                ),
                Container(
                  child: TextField(
                    cursorColor: Colors.red,
                    controller: txtName,
                    focusNode: fn,
                    onSubmitted: (a) {},
                    decoration: InputDecoration(
                        hintText: 'Enter Name',
                        focusColor: Colors.red,
                        fillColor: Colors.red,
                        prefixIcon: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/back.png',
                              width: 20,
                              height: 20,
                            ),
                          ],
                        )),
                  ),
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  color: Colors.white,
                ),
                Container(
                  height: 1000,
                  color: Colors.red,
                )
                // Expanded(
                //   child: ListView.builder(
                //       itemCount: 20,
                //       itemBuilder: (BuildContext ctxt, int index) {
                //         return temp(index);
                //       }),
                // ),
              ],
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
