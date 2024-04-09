import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mgp_mobile_app/modul/hrdu/dashboard_hrdu/dummy_data.dart';

// ignore: must_be_immutable
class ComponenLineChart extends StatefulWidget {
  final dynamic dataLine;
  final String tahun;
  const ComponenLineChart({Key? key, required this.dataLine, required this.tahun}) : super(key: key);

  @override
  State<ComponenLineChart> createState() => _ComponenLineChartState();
}

class _ComponenLineChartState extends State<ComponenLineChart> {
  
  @override
  Widget build(BuildContext context) {
    NumberFormat numberFormat = NumberFormat.compact(locale: "in", explicitSign: false);    
    List dataHorizontalTotal = [];
    List dataHorizontalSatuan = [];
    List dataHorizontalBarLine = [];
    int hasilVerticalLine = 0;
    // List<String> splitFormatDataBarLine = [];
    for(var bulan in parsingBulan){
      bool x = false; 
      for(var data in widget.dataLine){
        if(data.bulanMutasi != null &&
        data.bulanMutasi != 0 && 
        data.tahunMutasi == widget.tahun){
          if(bulan['tgl'] == data.bulanMutasi){
            x = true;
            dataHorizontalTotal.add(data.total);
            String formatDataBarLines = numberFormat.format(double.parse(data.total.toString()).round()).toString();
            List<String> splitToStringDataBarLines = formatDataBarLines.split(RegExp(r"^[0-9,]*",caseSensitive: false));
            dataHorizontalSatuan.add(splitToStringDataBarLines[1]);
            break;
          }
        }
      }
      if(x == false){
        dataHorizontalTotal.add(0);
        dataHorizontalSatuan.add("");
      }
    }
    num bigDataBarLine = dataHorizontalTotal.reduce((value, element) => value > element ? value : element);
    String formatBigDataBarLine = numberFormat.format(double.parse(bigDataBarLine.toString()).round()).toString();
    List<String> splitToStringBigDataBarLine = formatBigDataBarLine.split(RegExp(r"^[0-9,]*",caseSensitive: false));
    
    List<String> splitToStringBigNumber = formatBigDataBarLine.split(RegExp(r"[a-zA-Z]*$",caseSensitive: false));
    List<String> splitToStringBigNumber2 =  splitToStringBigNumber[0].split(',');
    splitToStringBigNumber.clear();
    int parsingBigNumber = double.parse(splitToStringBigNumber2[0]).round();
    splitToStringBigNumber2.clear();
    List arrHasilVerticalLine = ['0,00'];
    late int numberMin;
    if(parsingBigNumber.toString().length == 1 && (parsingBigNumber == 0 || parsingBigNumber == 1)){
      arrHasilVerticalLine = ['0,10', '0,20', '0,30', '0,40', '0,50', '0,60', '0,70', '0,80', '0,90', '1,00'];
    }else{
      (parsingBigNumber.toString().length == 2) ? numberMin = 10 
      : (parsingBigNumber.toString().length == 1) ? numberMin = 1 
      : numberMin = 100;
      for(int i = 0; i < 10; i++){
        hasilVerticalLine = hasilVerticalLine + numberMin;
        if(hasilVerticalLine <= parsingBigNumber){
          arrHasilVerticalLine.add('$hasilVerticalLine${splitToStringBigDataBarLine[1]}');
        }else{
          arrHasilVerticalLine.add('$hasilVerticalLine${splitToStringBigDataBarLine[1]}');
          break;
        }
      }
    }
    for(int index = 0; index < dataHorizontalTotal.length; index++){
      String formatDataBarLine = numberFormat.format(double.parse(dataHorizontalTotal[index].toString()).round()).toString();
      dataHorizontalBarLine.add(formatDataBarLine);
      if(dataHorizontalSatuan[index] != splitToStringBigDataBarLine[1]){
        List<String> splitFormatDataBarLine = formatDataBarLine.split(RegExp(r"[a-zA-Z,'']*$",caseSensitive: false));
        if((splitFormatDataBarLine[0].length-1) == 3){
          dataHorizontalTotal[index] = double.parse(splitFormatDataBarLine[0].toString()) / 1000;
        }else if((splitFormatDataBarLine[0].length-1) == 2){
          dataHorizontalTotal[index] = double.parse(splitFormatDataBarLine[0].toString()) / 100;
        }else{
          dataHorizontalTotal[index] = double.parse(splitFormatDataBarLine[0].toString());
        }
      }
      else{
        List<String> splitFormatDataBarLine = formatDataBarLine.split(RegExp(r"[a-zA-Z,'']*$",caseSensitive: false));
        List<String> splitFormatDataBarLine2 = splitFormatDataBarLine[0].split(RegExp(r",",caseSensitive: false));
        if(splitFormatDataBarLine2.length > 1){
          String splitT = "${splitFormatDataBarLine2[0]}.${splitFormatDataBarLine2[1]}";
          dataHorizontalTotal[index] = double.parse(splitT.toString());
        }else{
          dataHorizontalTotal[index] = double.parse(splitFormatDataBarLine2[0].toString());
        }
      }
    }
    
    getTitleData() => FlTitlesData(
      show: true,
      rightTitles: const AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      topTitles: const AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),

      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 30,
          interval: 1,
          getTitlesWidget: (double value, TitleMeta meta) {
            return SideTitleWidget(
              axisSide: meta.axisSide,
              child: Text("${parsingBulan[value.toInt()]['shortBulan']}",
                style: const TextStyle(
                  inherit: false, 
                  color:Colors.black, 
                  fontSize: 8,
                  fontWeight: FontWeight.bold
                ),
              ),
            );
          },
        ),
      ),

      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          interval: 1,
          reservedSize: 42,
          getTitlesWidget: (double value, TitleMeta meta) {
            return Text(arrHasilVerticalLine[value.toInt()].toString(),
              style: const TextStyle(
                inherit: false, 
                color:Colors.black, 
                fontSize: 8,
                fontWeight: FontWeight.bold
              ),
            );
          },
        ),
      ),
    );
    
    return LineChart(
      LineChartData(
        titlesData: getTitleData(),
        maxX: double.parse((parsingBulan.length-1).toString()),
        minX: 0,
        maxY: double.parse((arrHasilVerticalLine.length-1).toString()),
        minY: 0,
        lineTouchData: LineTouchData(
          touchTooltipData: LineTouchTooltipData(
          tooltipBgColor:const Color(0xff02d39a),
          getTooltipItems: (touchedSpots) {
            return touchedSpots.map((LineBarSpot touchedSpot) {
              const textStyle = TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                inherit: false,
                fontSize: 15,
              );
              return LineTooltipItem(dataHorizontalBarLine[touchedSpot.spotIndex].toString(), textStyle);
            }).toList();
          },
        )),
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
        lineBarsData: [
          LineChartBarData(
            preventCurveOverShooting: true,
            spots: [
              for(int index = 0; index < dataHorizontalTotal.length; index++)...[
                if(parsingBigNumber.toString().split('.')[0].length == 3)...[
                  FlSpot(double.parse(index.toString()), double.parse(double.parse(dataHorizontalTotal[index].toString()).toString().split('.')[0].toString()) / 100),
                ]else if(parsingBigNumber.toString().split('.')[0].length == 2)...[
                  FlSpot(double.parse(index.toString()), double.parse(double.parse(dataHorizontalTotal[index].toString()).toString().split('.')[0].toString()) / 10),
                ]else...[
                  FlSpot(double.parse(index.toString()), double.parse(double.parse(dataHorizontalTotal[index].toString()).toString().split('.')[0].toString())),
                ]
              ]
            ],
            isCurved: true,
            gradient: const LinearGradient(
              colors: <Color>[
                Color(0xff23b6e6),
                Color(0xff02d39a),  
              ]
            ),
            barWidth: 5,
            isStrokeCapRound: true,
            dotData: FlDotData(
              show: true,
              getDotPainter: (spot, percent, barData, index) {
                return FlDotCirclePainter(
                  radius: 5,
                  color: Colors.black,
                  strokeWidth: 2,
                  strokeColor: Colors.white,
                );
              },
            ),
            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(
                colors: <Color>[
                  const Color(0xff23b6e6),
                  const Color(0xff02d39a),  
                ].map((color) => color.withOpacity(0.3)).toList()
              ),
            )
          )
        ]
      )
    );
  }
}