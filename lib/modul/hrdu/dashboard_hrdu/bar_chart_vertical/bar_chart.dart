import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mgp_mobile_app/modul/hrdu/dashboard_hrdu/bar_chart_vertical/default_chart_vertical.dart';

class ComponenBarChartVertical extends StatefulWidget {
  final bool hiddenValue;
  final List dataObjek;
  const ComponenBarChartVertical({Key? key, required this.hiddenValue, required this.dataObjek}) : super(key: key);

  @override
  State<ComponenBarChartVertical> createState() => _ComponenBarChartVertical();
}

class _ComponenBarChartVertical extends State<ComponenBarChartVertical>{
  BarChartGroupData generateBarGroup(
    int x,
    LinearGradient gradien,
    double value,
  ) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: value,
          gradient: gradien,
          width: 15,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(5),
            topRight: Radius.circular(5),
          )
        ),
      ],
      showingTooltipIndicators: (widget.hiddenValue == true)
      ? touchedGroupIndex == x ? [0] : []
      : [0],
    );
  }

  int touchedGroupIndex = -1;
  int touchedGroupIndex2 = -1;
  final formatCurrency = NumberFormat.currency(
    locale: 'ID',
    decimalDigits: 0,
    symbol: "Rp"
  );
  @override
  // 8657977427.64
  Widget build(BuildContext context) {
    List data = [];
    data.addAll(widget.dataObjek);
    late List titleLeftNumberFormat = [];
    NumberFormat numberFormat = NumberFormat.compact(locale: "in", explicitSign: false);
    for(int index = 0; index < data.length; index++){
      data[index] = double.parse(data[index].toString()).round();
      titleLeftNumberFormat.add(numberFormat.format(double.parse(data[index].toString())).toString());
    }
    
    final dataList = [
      _BarData(data[0]),
      _BarData(data[1]),
      _BarData(data[2]),
      _BarData(data[3]),
      _BarData(data[4]),
      _BarData(data[5]),
      _BarData(data[6]),
      _BarData(data[7]),
      _BarData(data[8]),
      _BarData(data[9]),
      _BarData(data[10]),
      _BarData(data[11]),
      _BarData(data[12]),
      _BarData(data[13]),
    ];
    int hasilVerticalBar = 0;
    num bigTitleLeft = data.reduce((value, element) => value > element ? value : element);
    int lengthBigTitleLeft = bigTitleLeft.toString().length;
    String formatToStringBigNumber = numberFormat.format(double.parse(bigTitleLeft.toString()).round()).toString();
    List<String> splitToStringBigNumber = formatToStringBigNumber.split(RegExp(r"[a-zA-Z]*$",caseSensitive: false));
    List<String> splitToStringBigNumber2 =  splitToStringBigNumber[0].split(',');
    splitToStringBigNumber.clear();
    int parsingBigNumber = double.parse(splitToStringBigNumber2[0]).round();
    splitToStringBigNumber2.clear();
    List<String> splitToStringBigNumber3 = formatToStringBigNumber.split(RegExp(r"^[0-9,]*",caseSensitive: false));
    List arrHasilVerticalBar = ['0,00'];
    late int numberMin;
    if(parsingBigNumber.toString().length == 1 && (parsingBigNumber == 0 || parsingBigNumber == 1)){
      arrHasilVerticalBar = ['0,10', '0,20', '0,30', '0,40', '0,50', '0,60', '0,70', '0,80', '0,90', '1,00'];
    }else{
      (parsingBigNumber.toString().length == 2) ? numberMin = 10 
      : (parsingBigNumber.toString().length == 1) ? numberMin = 1 
      : numberMin = 100;
      for(int i = 0; i < 10; i++){
        hasilVerticalBar = hasilVerticalBar + numberMin;
        if(hasilVerticalBar <= parsingBigNumber){
          arrHasilVerticalBar.add('$hasilVerticalBar${splitToStringBigNumber3[1]}');
        }else{
          arrHasilVerticalBar.add('$hasilVerticalBar${splitToStringBigNumber3[1]}');
          break;
        }
      }
    }
    String minTitleLeftS = 1.toStringAsFixed(lengthBigTitleLeft-parsingBigNumber.toString().length);
    num minTitleLeft = num.parse(minTitleLeftS.replaceAll('.','').toString());
    return Padding(
      padding: const EdgeInsets.all(24),
      child: AspectRatio(
        aspectRatio: 1.5,
        child: BarChart(
          BarChartData(
            alignment: BarChartAlignment.spaceBetween,
            titlesData: FlTitlesData(
              show: true,
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  interval: 1,
                  reservedSize: 30,
                  getTitlesWidget: (double value, TitleMeta meta) {
                    return Text(
                      arrHasilVerticalBar[value.toInt()].toString(), 
                      style: const TextStyle(
                        inherit: false, 
                        color:Colors.black, 
                        fontSize: 8,
                        fontWeight: FontWeight.bold
                      )
                    );
                  },
                ),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 40,
                  interval: 1,
                  getTitlesWidget: (double value, TitleMeta meta) {
                    return SideTitleWidget( 
                      axisSide: meta.axisSide,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            titleBottom[value.toInt()], 
                            style: const TextStyle(
                              inherit: false,
                              color:Colors.black, 
                              fontSize: 8,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          textWidget((touchedGroupIndex2 == value.toInt()), value.toInt()),
                        ],
                      ),
                    );
                  },
                ),
              ),
              // leftTitles: const AxisTitles(),
              rightTitles: const AxisTitles(),
              topTitles: const AxisTitles(),
            ),
            gridData: FlGridData(
              show: true,
              drawVerticalLine: true,
              horizontalInterval: 1,
              verticalInterval: 1,
              getDrawingHorizontalLine: (value){
                return const FlLine(
                  color: Colors.grey,
                  strokeWidth: 1,
                );
              },
              getDrawingVerticalLine: (value){
                return const FlLine(
                  color: Colors.grey,
                  strokeWidth: 1,
                );
              }
            ),
            borderData: FlBorderData(
              show: true,
              border: Border.all(color: const Color(0xff37434d), width: 1),
            ),
            barGroups: dataList.asMap().entries.map((e) {
              final index = e.key;
              final data = e.value;
              double hasilBarData = ((data.value/minTitleLeft)/numberMin);
              return generateBarGroup(
                index,
                data.gradien,
                hasilBarData
              );
            }).toList(),
            maxY: double.parse((arrHasilVerticalBar.length-1).toString()),
            barTouchData: (widget.hiddenValue == true)
            ? BarTouchData(
                enabled: true,
                handleBuiltInTouches: false,
                touchTooltipData: BarTouchTooltipData(
                  tooltipBgColor: Colors.transparent,
                  tooltipMargin: 0,
                  getTooltipItem: (
                    BarChartGroupData group,
                    int groupIndex,
                    BarChartRodData rod,
                    int rodIndex,
                  ) {
                    // print(titleLeftNumberFormat[0]);
                    return BarTooltipItem(
                      titleLeftNumberFormat[groupIndex].toString(),
                      const TextStyle(
                        inherit: false,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 8,
                      ),
                    );
                  },
                ),
                touchCallback: (event, response) {
                  if (event.isInterestedForInteractions &&
                      response != null &&
                      response.spot != null) {
                    setState(() {
                      touchedGroupIndex = response.spot!.touchedBarGroupIndex;
                      touchedGroupIndex2 = response.spot!.touchedBarGroupIndex;
                    });
                  } else {
                    setState(() {
                      touchedGroupIndex = -1;
                      touchedGroupIndex2 = -1;
                    });
                  }
                },
              )
            : BarTouchData(
                enabled: false,
                // handleBuiltInTouches: false,
                touchTooltipData: BarTouchTooltipData(
                  tooltipBgColor: Colors.transparent,
                  tooltipPadding: EdgeInsets.zero,
                  tooltipMargin: 5,
                  getTooltipItem: (
                    BarChartGroupData group,
                    int groupIndex,
                    BarChartRodData rod,
                    int rodIndex,
                  ) {
                    // print(titleLeftNumberFormat[0]);
                    return BarTooltipItem(
                      titleLeftNumberFormat[groupIndex].toString(),
                      const TextStyle(
                        inherit: false,
                        color: Colors.black,
                        fontSize: 8,
                      ),
                    );
                  },
                ),
                touchCallback: (event, response) {
                  if (event.isInterestedForInteractions &&
                      response != null &&
                      response.spot != null) {
                    setState(() {
                      touchedGroupIndex2 = response.spot!.touchedBarGroupIndex;
                    });
                  } else {
                    setState(() {
                      touchedGroupIndex2 = -1;
                    });
                  }
                },
              ),
          ),
        ),
      ),
    );
  }
}

class _BarData {
  late LinearGradient gradien;
  final int value;
  _BarData(this.value){
    gradien = const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: <Color>[
        Color(0xff02d39a),
        Color(0xff23b6e6),
      ],
    );
  }
}

Widget textWidget(bool isSelected, int index){
  return Text(
    (isSelected) ? longTitleBottom[index] : "", 
    style: const TextStyle(
      inherit: false,
      color:Colors.black, 
      fontSize: 8,
      fontWeight: FontWeight.bold
    ),
  );
}