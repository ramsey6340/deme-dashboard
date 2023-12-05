import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/user_active_point.dart';

class LineChartActiveUser extends StatelessWidget {
  const LineChartActiveUser({Key? key, required this.userActivePoints}) : super(key: key);

  final List<UserActivePoint> userActivePoints;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: LineChart(
          LineChartData(
              minX: 0,
              maxX: 12,
              minY: 0,
              maxY: 1000,
            titlesData: FlTitlesData(
              topTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: false,
                )
              ),
              rightTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: false,
                )
              ),
              leftTitles: AxisTitles(
                axisNameWidget: Text("Nombre d'utilisateurs active",),
                sideTitles: SideTitles(
                  showTitles: true,
                )
              ),
              bottomTitles: AxisTitles(
                axisNameSize: 50,
                axisNameWidget: Text("Mois",),
                sideTitles: SideTitles(
                  showTitles: true,
                  interval: 1,
                  getTitlesWidget: (value, meta) {
                    var date = value.toInt() < monthNames.length
                        ? monthNames[value.toInt()]
                        : "";
                    return SideTitleWidget(axisSide: meta.axisSide, child: Text("$date"));
                  },
                )
              )
            ),
              lineBarsData: [
          LineChartBarData(
            belowBarData: BarAreaData(applyCutOffY: false),
          spots: userActivePoints.map((point) => FlSpot(point.x, point.y)).toList(),
          isCurved: false,
          dotData: FlDotData(show: true),
        )])
      ),
    );
  }
}
