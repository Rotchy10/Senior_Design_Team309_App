
import 'dart:ui';

import 'package:flutter/material.dart';




Widget statisticsBox (int _totalSteps, int _timesFallen, ){
  return Container(
    width: 200,
    height: 270,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: const [BoxShadow(
          color: Colors.black54,
          blurRadius: 25,
          spreadRadius: 1,
          offset: Offset(0.0, 0)
        )
      ],
    ),
    child: Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Icon(
          Icons.stacked_bar_chart_rounded,
          color: Color(0xff8667f2),
          size: 30
        ),
        Text(
          'STATISTICS',
          style: TextStyle(
              color: Color(0xff8667f2),
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
              fontSize: 10,
              letterSpacing: 1.5
          ),
        ),
        SizedBox(
          height: 20,
        ),
        AverageSteps(_totalSteps),
        SizedBox(
          height: 10,
        ),
        numFallen(_timesFallen)
      ],
    ),
    //child: ,
  );
}

// ======================================== AVERAGE STEPS ======================
Widget AverageSteps(int _num){
  return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 11),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'AVERAGE STEPS',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 10,
                ),
              ),
              Text(
                'Last 30 Days',
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                    fontSize: 10
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: Text(
            '10,317',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
              color: Color(0xffAC9BE6),
              fontSize: 18,
            ),
          ),
        )
      ],
    );
}

// ======================================== AVERAGE STEPS ======================
Widget numFallen(int _num){
  return Row(
    children: [
      Padding(
        padding: EdgeInsets.only(left: 11),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'TIMES FALLEN   ',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 10,
              ),
            ),
            Text(
              'Last 7 Days',
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                  fontSize: 10
              ),
            )
          ],
        ),
      ),
      Expanded(
        child: Text(
          '1',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
            color: Color(0xffAC9BE6),
            fontSize: 17,
          ),
        ),
      )
    ],
  );
}