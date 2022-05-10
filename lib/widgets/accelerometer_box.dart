import 'package:flutter/material.dart';

import '../bluetooth.dart';

Widget accerometerData (double xData, double yData, double zData){
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
              '$xData',
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
              '$yData',
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
              '$zData',
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
}

//
// class accelerometerBox extends StatelessWidget {
//   const accelerometerBox({Key? key, this.xData}) : super(key: key);
//
//   final double? xData;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 150,
//       width: 140,
//       decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(10),
//           boxShadow: const [BoxShadow(
//               color: Colors.black54,
//               blurRadius: 25,
//               spreadRadius: 1,
//               offset: Offset(0.0, 10.0)
//           )
//           ]
//       ),
//       child: Column(
//         children:  [
//           const SizedBox(
//             height: 10,
//           ),
//           const Icon(
//             Icons.stacked_line_chart_outlined,
//             color: Color(0xff8667f2),
//             size: 30,
//           ),
//           const Text(
//             'ACCELEROMETER',
//             style: TextStyle(
//                 color: Color(0xff8667f2),
//                 fontFamily: 'Montserrat',
//                 fontWeight: FontWeight.bold,
//                 fontSize: 10,
//                 letterSpacing: 1.5
//             ),
//           ),
//           const SizedBox(
//             height: 13,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Text(
//                 'X:  ',
//                 style: TextStyle(
//                     color: Color(0xff8667f2),
//                     fontFamily: 'Montserrat',
//                     fontWeight: FontWeight.bold,
//                     fontSize: 14,
//                     letterSpacing: 1.5
//                 ),
//               ),
//               Text(
//                 '$xData',
//                 style: const TextStyle(
//                     color: Color(0xff8667f2),
//                     fontFamily: 'Montserrat',
//                     fontWeight: FontWeight.bold,
//                     fontSize: 14,
//                     letterSpacing: 1.5
//                 ),
//               )
//             ],
//           ),
//           const SizedBox(
//             height: 5,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Text(
//                 'Y:  ',
//                 style: TextStyle(
//                     color: Color(0xff8667f2),
//                     fontFamily: 'Montserrat',
//                     fontWeight: FontWeight.bold,
//                     fontSize: 14,
//                     letterSpacing: 1.5
//                 ),
//               ),
//               Text(
//                 '0',
//                 style: const TextStyle(
//                     color: Color(0xff8667f2),
//                     fontFamily: 'Montserrat',
//                     fontWeight: FontWeight.bold,
//                     fontSize: 14,
//                     letterSpacing: 1.5
//                 ),
//               )
//             ],
//           ),
//           const SizedBox(
//             height: 5,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Text(
//                 'Z:  ',
//                 style: TextStyle(
//                     color: Color(0xff8667f2),
//                     fontFamily: 'Montserrat',
//                     fontWeight: FontWeight.bold,
//                     fontSize: 14,
//                     letterSpacing: 1.5
//                 ),
//               ),
//               Text(
//                 '0',
//                 style: const TextStyle(
//                     color: Color(0xff8667f2),
//                     fontFamily: 'Montserrat',
//                     fontWeight: FontWeight.bold,
//                     fontSize: 14,
//                     letterSpacing: 1.5
//                 ),
//               )
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
