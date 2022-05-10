import 'package:flutter/material.dart';
import 'package:team309/bluetooth.dart';
import 'accelerometer_databar.dart';

class WelcomeBar extends StatelessWidget{
  const WelcomeBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15.0),
      margin: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15.0),
      height: 150,
      decoration: BoxDecoration(
          color: const Color(0xff8667f2),
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: const [
            BoxShadow(
                color: Colors.black54,
                blurRadius: 25,
                spreadRadius: 5,
                offset: Offset(0.0, 10.0)
            )
          ]
      ),
      child: Row(
        children:
        [
          const CircleAvatar(
            radius: 50.0,
            backgroundImage: AssetImage('assets/images/Picture2.jpg'),
          ),
          Expanded(
            child: Container(
              //color: Colors.red,
              margin: EdgeInsets.only(left: 5.0, top: 25.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Hello, Steele!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                          fontSize: 20
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    const Text(
                      'Welcome back to the Battery-less IoT Hub',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontFamily: 'Montserrat',
                          fontSize: 10,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                    const SizedBox(
                      height: 17.5,
                    ),
                    InkWell(
                      onTap: () async {
                        await device?.disconnect();
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 36.0, vertical: 16.0),
                        decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 15,
                                  spreadRadius: 10,
                                  offset: Offset(0.0, 10.0))
                            ],
                            borderRadius: new BorderRadius.circular(36.0),
                            gradient: const LinearGradient(
                                colors: [
                                  Color(0xFFFFFFFF),
                                  Color(0xffAC9BE6)
                                ],
                                stops: [0.4, 1]
                            )
                        ),
                        child: const Text(
                          'DISCONNECT',
                          style: TextStyle(
                              fontFamily: 'monstserrat',
                              fontWeight: FontWeight.w900,
                              color: Color(0xff8667f2)
                          ),
                        ),
                      ),
                    )
                  ]
              ),
            ),
          )
        ],
      ),
    );
  }


}