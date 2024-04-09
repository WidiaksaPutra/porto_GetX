import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mgp_mobile_app/modul/hrdu/dashboard_hrdu/pie_chart/default_pie_chart.dart';

class ComponenPieChart extends StatefulWidget {
  final bool hiddenChart1, hiddenChart2, hiddenChart3, hiddenChart4, hiddenChart5, hiddenChart6;
  final double ratio;
  const ComponenPieChart({Key? key, required this.hiddenChart1, required this.hiddenChart2, 
  required this.hiddenChart3, required this.hiddenChart4, required this.hiddenChart5,
  required this.hiddenChart6, required this.ratio}) : super(key: key);

  @override
  State<ComponenPieChart> createState() => PieChartSample3State();
}

class PieChartSample3State extends State<ComponenPieChart> {
  int touchedIndex = 0;
  
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: widget.ratio,
      child: PieChart(
        PieChartData(
          pieTouchData: PieTouchData(
            touchCallback: (FlTouchEvent event, pieTouchResponse) {
              setState(() {
                if (!event.isInterestedForInteractions ||
                  pieTouchResponse == null ||
                  pieTouchResponse.touchedSection == null) {
                  touchedIndex = -1;
                  return;
                }
                touchedIndex = pieTouchResponse.touchedSection!.touchedSectionIndex;
              });
            },
          ),
          borderData: FlBorderData(
            show: false,
          ),
          sectionsSpace: 2,
          centerSpaceRadius: 0,
          sections: showingSections(),
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections(){
    return List.generate(6, (i) {
      final isTouched = i == touchedIndex;
      switch (i) {
        case 0:
          return pieChartSectionData(
            colors: chartData[0]['color'],
            titlePersen: "${double.parse(chartData[0]['valueDataPersen'].toString()).round().toString()}%", 
            valuePersen: (widget.hiddenChart1 == true) ? double.parse(chartData[0]['valueData'].toString()) : 0.0,
            isTouched: isTouched,
          );
        case 1:
          return pieChartSectionData(
            colors: chartData[1]['color'],
            titlePersen: '${double.parse(chartData[1]['valueDataPersen'].toString()).round().toString()}%', 
            valuePersen: (widget.hiddenChart2 == true) ? double.parse(chartData[1]['valueData'].toString()) : 0.0,
            isTouched: isTouched,
          );
        case 2:
          return pieChartSectionData(
            colors: chartData[2]['color'],
            titlePersen: '${double.parse(chartData[2]['valueDataPersen'].toString()).round().toString()}%', 
            valuePersen: (widget.hiddenChart3 == true) ? double.parse(chartData[2]['valueData'].toString()) : 0.0,
            isTouched: isTouched,
          );
        case 3:
          return pieChartSectionData(
            colors: chartData[3]['color'],
            titlePersen: '${double.parse(chartData[3]['valueDataPersen'].toString()).round().toString()}%', 
            valuePersen: (widget.hiddenChart4 == true) ? double.parse(chartData[3]['valueData'].toString()) : 0.0,
            isTouched: isTouched,
          );
        case 4:
          return pieChartSectionData(
            colors: chartData[4]['color'],
            titlePersen: '${double.parse(chartData[4]['valueDataPersen'].toString()).round().toString()}%', 
            valuePersen: (widget.hiddenChart5 == true) ? double.parse(chartData[4]['valueData'].toString()) : 0.0,
            isTouched: isTouched,
          );
        case 5:
          return pieChartSectionData(
            colors: chartData[5]['color'],
            titlePersen: '${double.parse(chartData[5]['valueDataPersen'].toString()).round().toString()}%', 
            valuePersen: (widget.hiddenChart6 == true) ? double.parse(chartData[5]['valueData'].toString()) : 0.0,
            isTouched: isTouched,
          );
        default:
          throw Exception('error');
      }
    });
  }

  pieChartSectionData({
    required Color colors, 
    required double valuePersen, 
    required String titlePersen,
    required dynamic isTouched,
  }){
    final fontSize = isTouched ? 20.0 : 16.0;
    final radius = isTouched ? 110.0 : 100.0;
    // final widgetSize = isTouched ? 55.0 : 40.0;
    const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
    return PieChartSectionData(
      color: colors,
      value: valuePersen,
      title: titlePersen,
      radius: radius,
      titleStyle: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        color: const Color(0xffffffff),
        inherit: false,
        shadows: shadows,
      ),
      badgePositionPercentageOffset: .98,
    );
  }
}