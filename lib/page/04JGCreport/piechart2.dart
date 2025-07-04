import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class PieChart2 extends StatefulWidget {
  PieChart2(
      {Key? key,
      this.datainput1,
      this.datainput2,
      this.datainput3,
      this.datainput4,
      this.datainput5
      })
      : super(key: key);
  double? datainput1;
  double? datainput2;
  double? datainput3;
  double? datainput4;
  double? datainput5;
  @override
  PieChart2State createState() => PieChart2State();
}

enum LegendShape { circle, rectangle }

class PieChart2State extends State<PieChart2> {
  final legendLabels = <String, String>{
    "Flutter": "Flutter legend",
    "React": "React legend",
    // "Xamarin": "Xamarin legend",
    // "Ionic": "Ionic legend",
  };

  final colorList = <Color>[
    Colors.green,
    Colors.red.shade100,
    Colors.red.shade300,
    Colors.red.shade600,
    Colors.red.shade900,
    const Color(0xff6c5ce7),
  ];

  final gradientList = <List<Color>>[
    [
      const Color.fromRGBO(223, 250, 92, 1),
      const Color.fromRGBO(129, 250, 112, 1),
    ],
    [
      const Color.fromRGBO(129, 182, 205, 1),
      const Color.fromRGBO(91, 253, 199, 1),
    ],
    [
      const Color.fromRGBO(175, 63, 62, 1.0),
      const Color.fromRGBO(254, 154, 92, 1),
    ]
  ];
  final ChartType? _chartType = ChartType.disc;
  final bool _showCenterText = true;
  final double? _ringStrokeWidth = 32;
  final double? _chartLegendSpacing = 32;

  final bool _showLegendsInRow = false;
  final bool _showLegends = false;
  final bool _showLegendLabel = false;

  final bool _showChartValueBackground = true;
  final bool _showChartValues = true;
  final bool _showChartValuesInPercentage = false;
  final bool _showChartValuesOutside = false;

  final bool _showGradientColors = false;

  final LegendShape? _legendShape = LegendShape.circle;
  final LegendPosition? _legendPosition = LegendPosition.right;

  int key = 0;

  @override
  Widget build(BuildContext context) {
    double _datainput1 = widget.datainput1 ?? 0;
    double _datainput2 = widget.datainput2 ?? 0;
    double _datainput3 = widget.datainput3 ?? 0;
    double _datainput4 = widget.datainput4 ?? 0;
    double _datainput5 = widget.datainput5 ?? 0;
    final dataMap = <String, double>{
      "OK": _datainput1,
      "WNG": _datainput2,
      "NG": _datainput3,
      "AENG": _datainput4,
      "QASS NG": _datainput5,
    };
    final chart = PieChart(
      key: ValueKey(key),
      dataMap: dataMap,
      animationDuration: const Duration(milliseconds: 800),
      chartLegendSpacing: _chartLegendSpacing!,
      // chartRadius: math.min(MediaQuery.of(context).size.width / 3.2, 300),
      chartRadius: 200,
      colorList: colorList,
      initialAngleInDegree: -180,
      chartType: _chartType!,
      // centerText: _showCenterText ? "HYBRID" : null,
      legendLabels: _showLegendLabel ? legendLabels : {},
      legendOptions: LegendOptions(
        showLegendsInRow: _showLegendsInRow,
        legendPosition: _legendPosition!,
        showLegends: _showLegends,
        legendShape: _legendShape == LegendShape.circle
            ? BoxShape.circle
            : BoxShape.rectangle,
        legendTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      chartValuesOptions: ChartValuesOptions(
        showChartValueBackground: _showChartValueBackground,
        showChartValues: _showChartValues,
        showChartValuesInPercentage: _showChartValuesInPercentage,
        showChartValuesOutside: _showChartValuesOutside,
      ),
      ringStrokeWidth: _ringStrokeWidth!,
      emptyColor: Colors.grey,
      gradientList: _showGradientColors ? gradientList : null,
      emptyColorGradient: const [
        Color(0xff6c5ce7),
        Colors.blue,
      ],
      baseChartColor: Colors.transparent,
    );
    // final settings = SingleChildScrollView(
    //   child: Card(
    //     margin: const EdgeInsets.all(12),
    //     child: Column(
    //       children: [
    //         SwitchListTile(
    //           value: _showGradientColors,
    //           title: const Text("Show Gradient Colors"),
    //           onChanged: (val) {
    //             setState(() {
    //               _showGradientColors = val;
    //             });
    //           },
    //         ),
    //         ListTile(
    //           title: Text(
    //             'Pie Chart Options'.toUpperCase(),
    //             style: Theme.of(context).textTheme.overline!.copyWith(
    //                   fontSize: 12,
    //                   fontWeight: FontWeight.bold,
    //                 ),
    //           ),
    //         ),
    //         ListTile(
    //           title: const Text("chartType"),
    //           trailing: Padding(
    //             padding: const EdgeInsets.symmetric(horizontal: 16.0),
    //             child: DropdownButton<ChartType>(
    //               value: _chartType,
    //               items: const [
    //                 DropdownMenuItem(
    //                   value: ChartType.disc,
    //                   child: Text("disc"),
    //                 ),
    //                 DropdownMenuItem(
    //                   value: ChartType.ring,
    //                   child: Text("ring"),
    //                 ),
    //               ],
    //               onChanged: (val) {
    //                 setState(() {
    //                   _chartType = val;
    //                 });
    //               },
    //             ),
    //           ),
    //         ),
    //         ListTile(
    //           title: const Text("ringStrokeWidth"),
    //           trailing: Padding(
    //             padding: const EdgeInsets.symmetric(horizontal: 16.0),
    //             child: DropdownButton<double>(
    //               value: _ringStrokeWidth,
    //               disabledHint: const Text("select chartType.ring"),
    //               items: const [
    //                 DropdownMenuItem(
    //                   value: 16,
    //                   child: Text("16"),
    //                 ),
    //                 DropdownMenuItem(
    //                   value: 32,
    //                   child: Text("32"),
    //                 ),
    //                 DropdownMenuItem(
    //                   value: 48,
    //                   child: Text("48"),
    //                 ),
    //               ],
    //               onChanged: (_chartType == ChartType.ring)
    //                   ? (val) {
    //                       setState(() {
    //                         _ringStrokeWidth = val;
    //                       });
    //                     }
    //                   : null,
    //             ),
    //           ),
    //         ),
    //         SwitchListTile(
    //           value: _showCenterText,
    //           title: const Text("showCenterText"),
    //           onChanged: (val) {
    //             setState(() {
    //               _showCenterText = val;
    //             });
    //           },
    //         ),
    //         ListTile(
    //           title: const Text("chartLegendSpacing"),
    //           trailing: Padding(
    //             padding: const EdgeInsets.symmetric(horizontal: 16.0),
    //             child: DropdownButton<double>(
    //               value: _chartLegendSpacing,
    //               disabledHint: const Text("select chartType.ring"),
    //               items: const [
    //                 DropdownMenuItem(
    //                   value: 16,
    //                   child: Text("16"),
    //                 ),
    //                 DropdownMenuItem(
    //                   value: 32,
    //                   child: Text("32"),
    //                 ),
    //                 DropdownMenuItem(
    //                   value: 48,
    //                   child: Text("48"),
    //                 ),
    //                 DropdownMenuItem(
    //                   value: 64,
    //                   child: Text("64"),
    //                 ),
    //               ],
    //               onChanged: (val) {
    //                 setState(() {
    //                   _chartLegendSpacing = val;
    //                 });
    //               },
    //             ),
    //           ),
    //         ),
    //         ListTile(
    //           title: Text(
    //             'Legend Options'.toUpperCase(),
    //             style: Theme.of(context).textTheme.overline!.copyWith(
    //                   fontSize: 12,
    //                   fontWeight: FontWeight.bold,
    //                 ),
    //           ),
    //         ),
    //         SwitchListTile(
    //           value: _showLegends,
    //           title: const Text("showLegends"),
    //           onChanged: (val) {
    //             setState(() {
    //               _showLegends = val;
    //             });
    //           },
    //         ),
    //         SwitchListTile(
    //           value: _showLegendsInRow,
    //           title: const Text("showLegendsInRow"),
    //           onChanged: (val) {
    //             setState(() {
    //               _showLegendsInRow = val;
    //             });
    //           },
    //         ),
    //         SwitchListTile(
    //           value: _showLegendLabel,
    //           title: const Text("showLegendLabels"),
    //           onChanged: (val) {
    //             setState(() {
    //               _showLegendLabel = val;
    //             });
    //           },
    //         ),
    //         ListTile(
    //           title: const Text("legendShape"),
    //           trailing: Padding(
    //             padding: const EdgeInsets.symmetric(horizontal: 16.0),
    //             child: DropdownButton<LegendShape>(
    //               value: _legendShape,
    //               items: const [
    //                 DropdownMenuItem(
    //                   value: LegendShape.circle,
    //                   child: Text("BoxShape.circle"),
    //                 ),
    //                 DropdownMenuItem(
    //                   value: LegendShape.rectangle,
    //                   child: Text("BoxShape.rectangle"),
    //                 ),
    //               ],
    //               onChanged: (val) {
    //                 setState(() {
    //                   _legendShape = val;
    //                 });
    //               },
    //             ),
    //           ),
    //         ),
    //         ListTile(
    //           title: const Text("legendPosition"),
    //           trailing: Padding(
    //             padding: const EdgeInsets.symmetric(horizontal: 16.0),
    //             child: DropdownButton<LegendPosition>(
    //               value: _legendPosition,
    //               items: const [
    //                 DropdownMenuItem(
    //                   value: LegendPosition.left,
    //                   child: Text("left"),
    //                 ),
    //                 DropdownMenuItem(
    //                   value: LegendPosition.right,
    //                   child: Text("right"),
    //                 ),
    //                 DropdownMenuItem(
    //                   value: LegendPosition.top,
    //                   child: Text("top"),
    //                 ),
    //                 DropdownMenuItem(
    //                   value: LegendPosition.bottom,
    //                   child: Text("bottom"),
    //                 ),
    //               ],
    //               onChanged: (val) {
    //                 setState(() {
    //                   _legendPosition = val;
    //                 });
    //               },
    //             ),
    //           ),
    //         ),
    //         ListTile(
    //           title: Text(
    //             'Chart values Options'.toUpperCase(),
    //             style: Theme.of(context).textTheme.overline!.copyWith(
    //                   fontSize: 12,
    //                   fontWeight: FontWeight.bold,
    //                 ),
    //           ),
    //         ),
    //         SwitchListTile(
    //           value: _showChartValueBackground,
    //           title: const Text("showChartValueBackground"),
    //           onChanged: (val) {
    //             setState(() {
    //               _showChartValueBackground = val;
    //             });
    //           },
    //         ),
    //         SwitchListTile(
    //           value: _showChartValues,
    //           title: const Text("showChartValues"),
    //           onChanged: (val) {
    //             setState(() {
    //               _showChartValues = val;
    //             });
    //           },
    //         ),
    //         SwitchListTile(
    //           value: _showChartValuesInPercentage,
    //           title: const Text("showChartValuesInPercentage"),
    //           onChanged: (val) {
    //             setState(() {
    //               _showChartValuesInPercentage = val;
    //             });
    //           },
    //         ),
    //         SwitchListTile(
    //           value: _showChartValuesOutside,
    //           title: const Text("showChartValuesOutside"),
    //           onChanged: (val) {
    //             setState(() {
    //               _showChartValuesOutside = val;
    //             });
    //           },
    //         ),
    //       ],
    //     ),
    //   ),
    // );
    return
        // Scaffold(
        // appBar: AppBar(
        //   title: const Text("Pie Chart @apgapg"),
        //   actions: [
        //     ElevatedButton(
        //       onPressed: () {
        //         setState(() {
        //           key = key + 1;
        //         });
        //       },
        //       child: Text("Reload".toUpperCase()),
        //     ),
        //   ],
        // ),
        // body:
        LayoutBuilder(
      builder: (_, constraints) {
        if (constraints.maxWidth >= 200) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 3,
                fit: FlexFit.tight,
                child: chart,
              ),
              // Flexible(
              //   flex: 2,
              //   fit: FlexFit.tight,
              //   child: settings,
              // )
            ],
          );
        } else {
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 32,
                  ),
                  child: chart,
                ),
                // settings,
              ],
            ),
          );
        }
      },
    );
    // );
  }
}

// class PieChart22 extends StatelessWidget {
//   PieChart22({Key? key}) : super(key: key);

//   final dataMap = <String, double>{
//     "Flutter": 5,
//   };

//   final colorList = <Color>[
//     Colors.greenAccent,
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return
//         // Scaffold(
//         // appBar: AppBar(
//         //   title: const Text("Pie Chart 1"),
//         // ),
//         // body:
//         Container(
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       child: PieChart(
//         dataMap: dataMap,
//         chartType: ChartType.ring,
//         baseChartColor: Colors.grey[50]!.withOpacity(0.15),
//         colorList: colorList,
//         chartValuesOptions: const ChartValuesOptions(
//           showChartValuesInPercentage: true,
//         ),
//         totalValue: 20,
//       ),
//     );
//     // );
//   }
// }
