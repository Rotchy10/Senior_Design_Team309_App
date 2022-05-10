import 'dart:ui';

import 'package:flutter/material.dart';

class accelerometerBox extends StatefulWidget{
  const accelerometerBox({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => accelerometerBoxState();

}

class accelerometerBoxState extends State<accelerometerBox>{

  final double _x = 1.0;
  final double _y = 1.0;
  final double _z = 1.0;

  // void _incrementCounter(){
  //   setState(
  //           () {
  //             _x++;
  //             _y++;
  //             _z++;
  //           });
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 140,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
          boxShadow: const [BoxShadow(
              color: Colors.black54,
              blurRadius: 25,
              spreadRadius: 1,
              offset: Offset(0.0, 10.0)
          )
        ]
      ),
      child: Column(
        children:  [
          const SizedBox(
            height: 10,
          ),
          const Icon(
            Icons.stacked_line_chart_outlined,
            color: Color(0xff8667f2),
            size: 30,
          ),
          const Text(
            'ACCELEROMETER',
            style: TextStyle(
              color: Color(0xff8667f2),
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
              fontSize: 10,
              letterSpacing: 1.5
            ),
          ),
          const SizedBox(
            height: 13,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'X:  ',
                style: TextStyle(
                    color: Color(0xff8667f2),
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    letterSpacing: 1.5
                ),
              ),
              Text(
                '$_x',
                style: const TextStyle(
                    color: Color(0xff8667f2),
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    letterSpacing: 1.5
                ),
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Y:  ',
                style: TextStyle(
                    color: Color(0xff8667f2),
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    letterSpacing: 1.5
                ),
              ),
              Text(
                '$_y',
                style: const TextStyle(
                    color: Color(0xff8667f2),
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    letterSpacing: 1.5
                ),
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Z:  ',
                style: TextStyle(
                    color: Color(0xff8667f2),
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    letterSpacing: 1.5
                ),
              ),
              Text(
                '$_z',
                style: const TextStyle(
                    color: Color(0xff8667f2),
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    letterSpacing: 1.5
                ),
              )
            ],
          )
        ],
      ),
    );
    /*
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 30.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(top: 10),
              height: 100,
              width: 110,
              decoration: BoxDecoration(
                color: Color(0xffffffff),
                borderRadius: BorderRadius.circular(10.0),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black54,
                        blurRadius: 20,
                        spreadRadius: 0,
                        offset: Offset(0.0, 10.0)
                    )
                  ]
              ),
              child: Text(
                '$_x',
                textAlign: TextAlign.center,
                style: const TextStyle(
                    letterSpacing: 2,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    color: Color(0xff8667f2)
                ),
              ),
            ),
            GestureDetector(
              onTap: _incrementCounter,
              child: Container(
                padding: EdgeInsets.only(top: 10),
                height: 100,
                width: 110,
                decoration: BoxDecoration(
                    color: Color(0xffffffff),
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black54,
                          blurRadius: 20,
                          spreadRadius: 0,
                          offset: Offset(0.0, 10.0)
                      )
                    ]
                ),
                child:  Text(
                  '$_y',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      letterSpacing: 2,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      color: Color(0xff8667f2)
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              height: 100,
              width: 110,
              decoration: BoxDecoration(
                  color: Color(0xffffffff),
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black54,
                        blurRadius: 20,
                        spreadRadius: 0,
                        offset: Offset(0.0, 10.0)
                    )
                  ]
              ),
              child: Text(
                '$_z',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  letterSpacing: 2,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                  color: Color(0xff8667f2)
                ),
              ),
            )
          ],
        ),


      );

     */
  }

}