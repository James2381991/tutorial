import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app1/CustomColor.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _counter = 0;
  int _currentIndex = 0;
  List<BottomNavigationBarItem> bottomWidget = [];
  int selectedCell = -1;
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  List<String> arrTitle = ['Favourite','Recent','Most'];
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
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.black, // Color for Android
        statusBarBrightness: Brightness.dark // Dark == white status bar -- for IOS.
    ));
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
        appBar: CustomWidget.appBarCustom(context, 'Home', true,false, () {
          Navigator.pop(context);
        }),
        endDrawer: Drawer(
          child: Container(
              child: Container(
            color: CustomColor.themeColor,
            width: 100,
            child: SafeArea(
              child: Column(
                children: [
                  SizedBox(height: 50,),
                  Container(
                    child: GestureDetector(onTap: (){
                      print('object');
                    },
                      child: Image.asset(
                        'assets/images/temp1.png',
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    alignment: Alignment.topRight,
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Text('jd'),
                ],
              ),
            ),
          )),
        ),
        // bottomNavigationBar: BottomNavigationBar(
        //   items: bottomWidget,
        //   currentIndex: _currentIndex,
        //   selectedItemColor: Colors.red,
        //   onTap: (index) {
        //     if (index == 3) {
        //       _currentIndex = 0;
        //       bottomWidget.removeAt(3);
        //     } else {
        //       _currentIndex = index;
        //     }
        //     setState(() {});
        //     print(index);
        //   },
        // ),
        body: SafeArea(
          child: Container(width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Positioned(child: Image.asset('assets/images/temp1.png',fit: BoxFit.cover,),top: 0,left: 0,bottom: 0,right: 0,),
                Expanded(
                  child: ListView.builder(
                    itemCount: arrTitle.length,
                    itemBuilder: (BuildContext ctxt, int index) {
                      return Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(arrTitle[index]),
                          Container(height: 100,
                            child: GridView.count(
                              crossAxisCount: 1, scrollDirection: Axis.horizontal,
                              children: List.generate(50, (index) {
                                return Container(padding: EdgeInsets.all(5),
                                  child: Image.asset(
                                    'assets/images/temp1.png',
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                );
                              }),
                            ),
                          ),
                        ],
                      );
                    }
                  ),
                ),
              ],
            )
            //   ListView(
            //   children: [
            //     InkWell(onTap: (){
            //       _counter = 1;
            //       setState(() {
            //
            //       });
            //     },
            //       child: Image.asset(
            //         'assets/images/temp1.png',
            //         width: 100,
            //         height: 100,
            //         fit: BoxFit.fill,
            //       ),
            //     ),
            //    if(_counter == 0) Image.asset(
            //       'assets/images/youtube.png',
            //       width: 100,
            //       height: 100,
            //       fit: BoxFit.fill,
            //     ),
            //     Image.asset(
            //       'assets/images/temp1.png',
            //       width: 100,
            //       height: 100,
            //       fit: BoxFit.fill,
            //     ),
            //   ],
            // ),
          ),
        ),
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
