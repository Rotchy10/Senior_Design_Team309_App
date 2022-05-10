
import 'dart:ui';

import 'dart:async';
import 'package:flutter/material.dart';
//import 'package:team309/bluetooth.dart';
import 'package:team309/screens/trackingScreen/tracking_screen.dart';
import 'screens/homeScreen/home_screen.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'screens/trackingScreen/tracking_screen.dart';

void main() {
  runApp(const FlutterBlueApp());
}
//Reruns main method wen something changes
class FlutterBlueApp extends StatelessWidget {
  const FlutterBlueApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamBuilder<BluetoothState>(
        stream: FlutterBlue.instance.state,
        initialData: BluetoothState.unknown,
        builder: (c, snapshot){
          final state = snapshot.data;
          if (state == BluetoothState.on){
            return HomeScreen();
          }
          return BluetoothOffScreen(state: state);
        }),
    );
  }
}

class BluetoothOffScreen extends StatelessWidget {
  const BluetoothOffScreen({Key? key, this.state}) : super(key: key);

  final BluetoothState? state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const <Widget>[
            Icon(
              Icons.bluetooth_disabled,
              size: 200.0,
              color: Colors.white54,
            ),
            Text(
              'Bluetooth Adapter is OFF; please try turning on the bluetooh you noob',
            ),
          ],
        ),
      ),
    );
  }
}



//Intializes UI and Bluetooth
// class MyAppState extends State<MyApp> {
//   @override
//   void initState() {
//     super.initState();
//     FlutterBlue.instance.state.listen((state){
//       if(state == BluetoothState.off) {
//       }else if (state == BluetoothState.on){
//         scanForDevices();
//       }
//     });
//   }
//   @override
//   Widget build(BuildContext context){
//     return MaterialApp(
//         home: Center(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: <Widget>[
//               const SizedBox(height: 30),
//               const Text('Counter Value: ', textAlign: TextAlign.center,),
//               Text(valstr),
//               Spacer(),
//               TextButton(
//                 style: TextButton.styleFrom(
//                   primary: Colors.white,
//                   textStyle: const TextStyle(fontSize: 20),
//                 ),
//                 onPressed: () {connectToDevice();},
//                 child: const Text('Enabled', textDirection: TextDirection.ltr),
//               ),
//               TextButton(
//                 style: TextButton.styleFrom(
//                   primary: Colors.blue,
//                   textStyle: const TextStyle(fontSize: 20),
//                 ),
//                 onPressed: () {disconnectToDevice();setState(() {valstr = valDisplay.toString();});},
//                 child: const Text('Disconnect', textDirection: TextDirection.ltr),
//               ),
//               const SizedBox(height: 30),
//             ],
//           ),
//         )
//     );
//   }
// }




// void main() {
//   runApp(Team309App());
// }
//
// class Team309App extends StatefulWidget{
//   const Team309App({Key? key}) : super(key: key);
//
//   @override
//   State<StatefulWidget> createState() {
//     return Team309AppState();
//   }
// }
//
// class Team309AppState extends State<Team309App>{
//
//   @override
//   void initState(){
//     super.initState();
//     FlutterBlue.instance.state.listen((state){
//       if (state == BluetoothState.off){}
//       else if (state == BluetoothState.on){
//         scanForDevices();
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: HomeScreen(),
//     );
//   }
// }




// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//
//     const String _title = "Team 12312312";
//
//     return MaterialApp(
//       title: _title,
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const HomeScreen(),
//     );
//   }
// }





/*
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    const String _title = "Team 12312312";

    return MaterialApp(
      title: _title,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: _title),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const   MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(
            () {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
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
      // appBar: AppBar(
      //   // Here we take the value from the MyHomePage object that was created by
      //   // the App.build method, and use it to set our appbar title.
      //   title: Text(widget.title),
      // ),
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0xffffffff),
                      Color(0xff000000),],
            ),
          ),
        ),
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        // child: Column(
        //   // Column is also a layout widget. It takes a list of children and
        //   // arranges them vertically. By default, it sizes itself to fit its
        //   // children horizontally, and tries to be as tall as its parent.
        //   //
        //   // Invoke "debug painting" (press "p" in the console, choose the
        //   // "Toggle Debug Paint" action from the Flutter Inspector in Android
        //   // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
        //   // to see the wireframe for each widget.
        //   //
        //   // Column has various properties to control how it sizes itself and
        //   // how it positions its children. Here we use mainAxisAlignment to
        //   // center the children vertically; the main axis here is the vertical
        //   // axis because Columns are vertical (the cross axis would be
        //   // horizontal).
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: <Widget>[
        //     const Text(
        //       'You have pushed the button this many times:',
        //     ),
        //     Text(
        //       '$_counter',
        //       style: Theme.of(context).textTheme.headline4,
        //     ),
        //   ],
        // ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
*/
