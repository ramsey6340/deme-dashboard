import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class Chart extends StatefulWidget {
  const Chart({
    Key? key,
  }) : super(key: key);

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  final double radius = 30.0;
  List<PieChartSectionData> paiChartSelectionData = [
    PieChartSectionData(
      color: kPrimaryColor,
      value: 25,
      showTitle: false,
      radius: 30,
    ),
    PieChartSectionData(
      color: Color(0xFF26E5FF),
      value: 20,
      showTitle: false,
      radius: 30,
    ),
    PieChartSectionData(
      color: Color(0xFFFFCF26),
      value: 10,
      showTitle: false,
      radius: 30,
    ),
    PieChartSectionData(
      color: Color(0xFFEE2727),
      value: 15,
      showTitle: false,
      radius: 16,
    ),
    PieChartSectionData(
      color: kPrimaryColor.withOpacity(0.1),
      value: 25,
      showTitle: false,
      radius: 13,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: PieChart(
        PieChartData(
          sectionsSpace: 0,
          centerSpaceRadius: 70,
          startDegreeOffset: -90,
          sections: paiChartSelectionData,
        ),
        swapAnimationDuration: Duration(milliseconds: 150), // Optional
        swapAnimationCurve: Curves.linear,
      ),
    );
  }
}


