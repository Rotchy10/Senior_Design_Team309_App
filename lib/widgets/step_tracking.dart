import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class stepTracking extends StatefulWidget{
  const stepTracking({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => stepTrackingState();

}

class stepTrackingState extends State<stepTracking>{
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 200,
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
            Icons.directions_run_outlined,
            color: Color(0xff8667f2),
            size: 30,
          ),
          const Text(
            'STEPS',
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
          CircularPercentIndicator(
            radius: 70.0,
            lineWidth: 10.0,
            percent: 0.70,
            backgroundColor: Color(0xffAC9BE6),
            circularStrokeCap: CircularStrokeCap.round,
            center: const Text('70/100',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                fontSize: 10,
                color: Colors.black
              ),
            ),
            progressColor: Color(0xff8667f2),
          )
        ],
      ),
    );
  }

}