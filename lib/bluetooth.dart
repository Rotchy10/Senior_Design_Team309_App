import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_blue/gen/flutterblue.pbjson.dart';


final FlutterBlue flutterBluetooth = FlutterBlue.instance;

int? valDisplay;
String valstr = '0';
//List<int>? val;
int ?valfinal;

Stream<List<int>>? theValue;

List<int>? yVal;
List<int>? zVal;

BluetoothCharacteristic? xAxis;
BluetoothCharacteristic? yAxis;
BluetoothCharacteristic? zAxis;

// var xData;
// var yData;
// var zData;

// BluetoothCharacteristic? TX;
// BluetoothCharacteristic? RX;
//Stream<List<int>>? listStream;
BluetoothDevice? device;
BluetoothDevice? state;
BluetoothDeviceState deviceState = BluetoothDeviceState.disconnected;










//
//
// void scanForDevices() async {
//   var scanSubscription = flutterBluetooth.scan().listen((scanResult) async {
//     if (scanResult.device.name == "Nano 33 IoT") {
//       print("found device");
// //Assigning bluetooth device
//       device = scanResult.device;
// //After that we stop the scanning for device
//       stopScanning();
//     }
//   });
// }
// void stopScanning() {
//   flutterBluetooth.stopScan();
// }
//
// void UARTwrite(String X){
//   if(deviceState == BluetoothDeviceState.connected){
//     TX?.write(utf8.encode(X));
//   }
// }
//
// void connectToDevice() async{
//   await device?.connect();
//   deviceState = BluetoothDeviceState.connected;
//
//   discoverServices();
// }
//
// void disconnectToDevice() async {
//   await device?.disconnect();
//   deviceState = BluetoothDeviceState.disconnected;
// }
//
// discoverServices() async {
//   List<BluetoothService>? services = await device?.discoverServices();
//
// //checking each services provided by device
//   services?.forEach((service) {
//     //name is on website documentation
//     if (service.uuid.toString() == "0000180a-0000-1000-8000-00805f9b34fb") {
//       service.characteristics.forEach((characteristic) async {
//         print("Here are the uuids");
//         print(characteristic.uuid.toString());
//         if (characteristic.uuid.toString() ==
//             "00002a57-0000-1000-8000-00805f9b34fb") {
// //Updating characteristic to perform write operation.
//           print("Inside read");
//           theValue = characteristic.value;
//           Uint8List intBytes = Uint8List.fromList(theValue.toList());
//           //print(utf8.decode());
//           // valfinal = ((val[3] * pow(2,24)) + (val[2] * pow(2,16)) + (val[1] * pow(2,8)) + val[0]).toInt();
//           // valstr = valfinal.toString();
//           // print((val[3] * pow(2,24)) + (val[2] * pow(2,16)) + (val[1] * pow(2,8)) + val[0]);
//           //var value = characteristic.read();
//           // RX = characteristic;
//           // List<int> value = RX?.read() as List<int>;
//           print("Read charateristic");
//           //Updating stream to perform read operation.
//           //listStream = characteristic.value;
//           //characteristic.setNotifyValue(!characteristic.isNotifying);
//         }
//       });
//     }
//   });
// }
//
//
//
//
//
//   //await RX?.setNotifyValue(true);
//   /*RX?.value.listen((value){
//     //Acclerometer display
//     //Store value in global variable to use elsewhere
//     print(value);
//     debugPrint(utf8.decode(value));
//   });
//
//       }
//       */
//
//
