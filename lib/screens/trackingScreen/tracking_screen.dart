import 'dart:convert' show utf8;
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import '../../widgets/accelerometer_box.dart';
import '../../widgets/step_tracking.dart';
import '../../widgets/welcome_bar.dart';
import '../../widgets/accelerometer_databar.dart';
import '../../widgets/statistics_box.dart';
import '../../bluetooth.dart';

class trackingScreen extends StatefulWidget{
  const trackingScreen({Key? key}) : super(key: key);

  @override
  trackingScreenState createState() => trackingScreenState();
}

class trackingScreenState extends State<trackingScreen> {

  Stream<List<int>>? xStream;
  Stream<List<int>>? yStream;
  Stream<List<int>>? zStream;

  bool isReady = false;

  int _currentIndex = 0;
  int _stepsTaken = 0;
  int _timesFallen = 0;

  void initState(){
    super.initState();
    isReady = true;
    discoverServices();
  }

  discoverServices() async {
    List<BluetoothService>? services = await device?.discoverServices();

    services?.forEach((service) {
      if(service.uuid.toString() == "0000180a-0000-1000-8000-00805f9b34fb"){
        service.characteristics.forEach((characteristic)
        {
          if(characteristic.uuid.toString() == "00002a57-0000-1000-8000-00805f9b34fb")
          {
            print("Found xAxis Characteristic : " + characteristic.uuid.toString());
            characteristic.setNotifyValue(!characteristic.isNotifying);
            xAxis = characteristic;
            xStream = characteristic.value;
          }

          if(characteristic.uuid.toString() == "00002b73-0000-1000-8000-00805f9b34fb")
          {
            print("Found yAxis Characteristic : " + characteristic.uuid.toString());
            characteristic.setNotifyValue(!characteristic.isNotifying);
            yAxis = characteristic;
            yStream = characteristic.value;
          }

          if(characteristic.uuid.toString() == "00002c32-0000-1000-8000-00805f9b34fb")
          {
            print("Found zAxis Characteristic : " + characteristic.uuid.toString());
            characteristic.setNotifyValue(!characteristic.isNotifying);
            zAxis = characteristic;
            zStream = characteristic.value;
          }


          if(xStream != null && yStream != null && zStream != null)
          {
            setState(() {
              isReady = true;
            });
          }
        });
      }
    });
  }

  int _dataParser(List<int>? val){
    int num = ((val![3] * pow(2,24)) + (val[2] * pow(2,16)) + (val[1] * pow(2,8)) + val[0]).toInt();
    return num;
  }

  void _yzdataParser() async{
    yVal = await yAxis?.read();
    zVal = await zAxis?.read();
  }



  // int _ydataParser(Future<List<int>> val){
  //   int num = ((val[3] * pow(2,24)) + (val[2] * pow(2,16)) + (val[1] * pow(2,8)) + val[0]).toInt();
  //   return num;
  // }

  // Future<bool?> _onWillPop(){
  //   return showDialog(
  //     context: context,
  //     builder: (context) =>
  //         const AlertDialog(
  //           title: Text('Are you sure'),
  //         )
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return isReady;
      },
      child: Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title:  Image.asset('assets/images/BatteryLessIOTPurple.png',
          fit: BoxFit.contain,
          height: 110,
          width: 110,),
      ),
      extendBody: true,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.transparent,
        unselectedItemColor: Colors.white,
        selectedItemColor: Color(0xff8667f2),
        selectedLabelStyle: bottomNavBarTextStyle(),
        unselectedLabelStyle: bottomNavBarTextStyle(),
        elevation: 0,
        onTap: (value){
          setState(() => _currentIndex = value);
        },
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home_rounded),
          ),
          BottomNavigationBarItem(
              label: 'Statistics',
              icon: Icon(Icons.stacked_bar_chart_rounded)
          ),
          BottomNavigationBarItem(
              label: 'Contacts',
              icon: Icon(Icons.person_rounded)
          ),
        ],
      ),

      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFFFFFFF),
                  Color(0xffAC9BE6),
                ]
            )
        ),
        child: !isReady ? ListView(
          children: [
            WelcomeBar(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("BLUE TOOTH NOT CONNECTED")
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
              child: Row(
                children: [
                  statisticsBox(_stepsTaken,_timesFallen),
                ],
              ),
            )
          ],
        ) :
        Container(
          child: StreamBuilder<List<int>>(
            stream: xStream,
            builder: (BuildContext context,
                AsyncSnapshot<List<int>>snapshotx){

              if(snapshotx.connectionState == ConnectionState.active){
                double xData = _dataParser(snapshotx.data) / 100;
                _yzdataParser();
                double yData = _dataParser(yVal) / 100;
                double zData = _dataParser(zVal) / 100;

                return ListView(
                  children: [
                    WelcomeBar(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          accerometerData(xData, yData, zData),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                      child: Row(
                        children: [
                          statisticsBox(_stepsTaken,_timesFallen),
                        ],
                      ),
                    )
                  ],
                );

              } else {
                return Text('Check the stream');
              }
            }
          ),
        )
      ),
    )
    );
  }
}

// ================================== Bottom Navigation Label Styling
TextStyle bottomNavBarTextStyle(){
  return TextStyle(
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.bold,
    fontSize: 12,
    letterSpacing: 1.0
  );
}

// return Scaffold(
//   extendBody: true,
//   bottomNavigationBar: BottomNavigationBar(
//     currentIndex: _currentIndex,
//     type: BottomNavigationBarType.fixed,
//     backgroundColor: Colors.transparent,
//     unselectedItemColor: Colors.white,
//     selectedItemColor: Color(0xff8667f2),
//     selectedLabelStyle: bottomNavBarTextStyle(),
//     unselectedLabelStyle: bottomNavBarTextStyle(),
//     elevation: 0,
//     onTap: (value){
//       setState(() => _currentIndex = value);
//     }
//     ,
//     items: [
//       BottomNavigationBarItem(
//         label: 'Home',
//         icon: Icon(Icons.home_rounded),
//       ),
//       BottomNavigationBarItem(
//           label: 'Statistics',
//           icon: Icon(Icons.stacked_bar_chart_rounded)
//       ),
//       BottomNavigationBarItem(
//           label: 'Contacts',
//           icon: Icon(Icons.person_rounded)
//       ),
//     ],
//   ),
//   extendBodyBehindAppBar: true,
//   appBar: AppBar(
//     centerTitle: true,
//     backgroundColor: Colors.transparent,
//     elevation: 0,
//     title:  Image.asset('assets/images/BatteryLessIOTPurple.png',
//     fit: BoxFit.contain,
//     height: 110,
//     width: 110,),
//   ),
//   body: Container(
//     decoration: const BoxDecoration(
//       gradient: LinearGradient(
//         begin: Alignment.topLeft,
//         end: Alignment.bottomRight,
//         colors: [
//           Color(0xFFFFFFFF),
//           Color(0xffAC9BE6),
//         ]
//       )
//     ),
//     child: ListView(
//       children: [
//         WelcomeBar(),
//         Padding(
//          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
//          child: Row(
//            mainAxisAlignment: MainAxisAlignment.spaceBetween,
//            children: [
//              accelerometerBox(),
//              stepTracking()
//            ],
//          ),
//         ),
//         Padding(
//           padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
//           child: Row(
//               children: [
//                 statisticsBox(_stepsTaken,_timesFallen),
//               ],
//           ),
//         )
//       ],
//     ),
//   ),
// );
