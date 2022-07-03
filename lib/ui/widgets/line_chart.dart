import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/chart/chart_bloc.dart';

class MyChart extends StatelessWidget {

   Color lineColor;
  List<FlSpot> spots;
  late List<double> titles;

  MyChart(this.lineColor, this.spots) 
  {
    titles = spots.where((element) {return DateTime.fromMillisecondsSinceEpoch(element.x.toInt() * 1000,isUtc: true).hour == 0;}).toList().map((e) => e.x).toList();
  }

 

  @override
  Widget build(BuildContext context) {   
    return BlocBuilder<ChartBloc, ChartState>(builder: (context, state) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20.0),
          child: SizedBox(
            width: double.infinity,
            height: 360,
            child: LineChart(
              LineChartData(
                extraLinesData: ExtraLinesData(
                    verticalLines: titles.map((e) => VerticalLine(
                            dashArray: [20],
                            x: e,
                            color: const Color.fromARGB(255, 34, 163, 209),
                            strokeWidth: 1,
                            label: VerticalLineLabel(
                                style: const TextStyle(fontSize: 12, color: Colors.blue,) ,
                                alignment: Alignment.topCenter,
                                show: true,
                                labelResolver: (p0) {
                                  var label = DateTime.fromMillisecondsSinceEpoch(e.toInt() * 1000, isUtc: true);
                                  return '${label.month}-${label.day},${label.hour}:00';
                                }))).toList()),
                lineTouchData: lineTouchData,
                titlesData: titlesData(state.maxY),
                gridData: gridData,
                borderData: flBorderData,
                backgroundColor: Colors.black,
                minX: state.minX,
                maxX: state.maxX,
                minY: state.minY > 5000 ? (state.minY ~/ 500) * 500 : state.minY,
                maxY: state.maxY > 5000 ? (state.maxY ~/ 500) * 500 * 1.05 : state.maxY * 1.05,
                lineBarsData: [
                  LineChartBarData(
                      dotData: FlDotData(show: false),
                      isCurved: true,
                      barWidth: 1,
                      color: lineColor,
                      spots: spots,
                      belowBarData: BarAreaData(
                          show: true, color: lineColor.withAlpha(50)))
                ])),
          ),
        ),
      );
    });
  }

  LineTouchData get lineTouchData => LineTouchData(
      getTouchedSpotIndicator: (LineChartBarData barData, List<int> spotIndexes) {
        return spotIndexes.map((index) {
          return TouchedSpotIndicatorData(
            FlLine(
              color: Colors.white.withOpacity(0.8),
              strokeWidth: 2,
              dashArray: [3, 3],
            ),
            FlDotData(
              show: false,
              getDotPainter: (spot, percent, barData, index) =>
                FlDotCirclePainter(
                  radius: 8,
                  color: [
                    Colors.black,
                    Colors.black,
                  ][index],
                  strokeWidth: 2,
                  strokeColor: Colors.black,
                ),
            ),
          );
        }).toList();
      },
      handleBuiltInTouches: true,
      touchSpotThreshold: 2,
      touchTooltipData: LineTouchTooltipData(
        getTooltipItems: (touchedSpots) {
        return touchedSpots.map((e) => LineTooltipItem('${DateTime.fromMillisecondsSinceEpoch(e.x.toInt() * 1000, isUtc: true)}, \$${e.y} ', const TextStyle(color: Colors.white, fontSize: 12))).toList();
        
        },
        tooltipBgColor: Colors.green.withOpacity(0.8),
      ));

  FlTitlesData titlesData(double maxValue) => FlTitlesData(
      show: true,
      topTitles: AxisTitles(),
      rightTitles: AxisTitles(),
      leftTitles: AxisTitles(
          sideTitles: SideTitles(
            reservedSize: 35,
              showTitles: true,
              getTitlesWidget: (value, titleMeta) {
                if(value != maxValue)
                {
                   return Text(
                   value >= 10 ? value.round().toString() : value.toStringAsFixed(4),
                  style: const TextStyle(fontSize: 10, color: Colors.white),
                );

                }
                else
                {
                  return const Text('');
                }
               
              })),
      bottomTitles: AxisTitles());

  FlGridData get gridData => FlGridData(
        show: true,
        drawVerticalLine: false,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            dashArray: [15, 15],
            color: const Color.fromARGB(255, 90, 104, 116),
            strokeWidth: 1,
          );
        },
      );

  FlBorderData get flBorderData => FlBorderData(show: true);

  LineChartBarData get lineChartBarData => LineChartBarData(
      isCurved: true,
      barWidth: 1,
      color: lineColor,
      spots: spots,
      belowBarData: BarAreaData(show: true, color: lineColor.withAlpha(50)));
}
