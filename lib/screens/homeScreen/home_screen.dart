// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:team309/screens/trackingScreen/tracking_screen.dart';

import '../../bluetooth.dart';

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



class HomeScreen extends StatelessWidget{
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 25.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: const
            [Color(0xFFFFFFFF),
              Color(0xffAC9BE6),
              Color(0xff8667f2),
            ],
          )
        ),
        child: ListView(
          children: [
            Center(
              child: Image.asset('assets/images/BatteryLessIOTwithName.png',
              width: 300.0,
              height: 300.0,
              ),
            ),
            headlinesWidget(),
            connectButton(context)
          ],
        ),
      )
    );
  }
}

// ================================ HOMESCREEN HEADLINES WIDGET
Widget headlinesWidget(){
  return Container(
    margin: EdgeInsets.only(left: 48.0, top: 5.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:  [
        Text(
          'WELCOME!',
          textAlign: TextAlign.left,
          style: TextStyle(
            color: Color(0xFFFFFFFF),
            letterSpacing: 3,
            fontSize: 35.0,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 45.0),
          child: Text(
            'Connect to  continue.',
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Color(0xFFFFFFFF),
              letterSpacing: 3,
              fontSize: 40.0,
              fontFamily: 'Monstserrat'
            ),
          ),
        )
      ],
    ),
  );
}

// ================================ HOMESCREEN CONNECT BUTTON WIDGET
Widget connectButton(BuildContext context){
  return Container(
    margin: EdgeInsets.only(top: 45.0, left: 48.0),
    child: Row(
      children: [
        InkWell(
          onTap: () {
            print("Finding Devices");
            FlutterBlue.instance.scan().listen((scanResult) async {
              if(scanResult.device.name == "Nano 33 IoT"){
                print("Found the Device");
                device = scanResult.device;
                await device?.connect();
                FlutterBlue.instance.stopScan();
              }
            });
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) =>
                trackingScreen()));
            // Navigator.push(context,
            // MaterialPageRoute(builder: (context) => trackingScreen()));
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 36.0, vertical: 16.0),
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 15,
                  spreadRadius: 0,
                  offset: Offset(0.0, 32.0))
              ],
              borderRadius: new BorderRadius.circular(36.0),
              gradient: LinearGradient(
                colors: const [
                  Color(0xff8667f2),
                  Color(0xffAC9BE6)
                ],
                stops: const [0.2, 1]
              )
            ),
            child: Text(
              'CONNECT',
              style: TextStyle(
                fontFamily: 'monstserrat',
                fontWeight: FontWeight.bold,
                color: Color(0xffe0e7ff)
              ),
            ),
          ),
        )
      ],
    ),
  );
}
