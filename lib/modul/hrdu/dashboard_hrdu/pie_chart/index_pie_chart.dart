import 'package:flutter/material.dart';
import 'package:mgp_mobile_app/modul/hrdu/dashboard_hrdu/pie_chart/default_pie_chart.dart';
import 'package:mgp_mobile_app/modul/hrdu/dashboard_hrdu/pie_chart/pie_chart.dart';

class IndexPieChart extends StatefulWidget {
  const IndexPieChart({Key? key}) : super(key: key);

  @override
  State<IndexPieChart> createState() => _IndexPieChartState();
}

class _IndexPieChartState extends State<IndexPieChart> {
  late bool hiddenChart1, hiddenChart2, hiddenChart3, hiddenChart4, hiddenChart5, hiddenChart6;
  @override
  void initState() {
    super.initState();
    hiddenChart1 = true;
    hiddenChart2 = true;
    hiddenChart3 = true;
    hiddenChart4 = true;
    hiddenChart5 = true;
    hiddenChart6 = true;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ComponenPieChart(hiddenChart1: hiddenChart1, hiddenChart2: hiddenChart2, hiddenChart3: hiddenChart3,
        hiddenChart4: hiddenChart4, hiddenChart5: hiddenChart5, hiddenChart6: hiddenChart6, ratio: 1.0),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: (){
                setState((){
                  hiddenChart1 = !hiddenChart1;
                });
              },
              child: rowIndexPieDiagram(
                colors: chartData[0]['color'],
                text: chartData[0]['nameTitle'],
                hidePie: hiddenChart1,
                textValue: chartData[0]['valueData'].toString(),
              ),
            ),
            GestureDetector(
              onTap: (){
                setState((){
                  hiddenChart2 = !hiddenChart2;
                });
              },
              child: rowIndexPieDiagram(
                colors: chartData[1]['color'],
                text: chartData[1]['nameTitle'],
                hidePie: hiddenChart2, 
                textValue: chartData[1]['valueData'].toString()
              ),
            ),
            GestureDetector(
              onTap: (){
                setState((){
                  hiddenChart3 = !hiddenChart3;
                });
              },
              child: rowIndexPieDiagram(
                colors: chartData[2]['color'],
                text: chartData[2]['nameTitle'],
                hidePie: hiddenChart3,
                textValue: chartData[2]['valueData'].toString(),
              ),
            ),
            GestureDetector(
              onTap: (){
                setState((){
                  hiddenChart4 = !hiddenChart4;
                });
              },
              child: rowIndexPieDiagram(
                colors: chartData[3]['color'],
                text: chartData[3]['nameTitle'],
                hidePie: hiddenChart4,
                textValue: chartData[3]['valueData'].toString(),
              ),
            ),
            GestureDetector(
              onTap: (){
                setState((){
                  hiddenChart5 = !hiddenChart5;
                });
              },
              child: rowIndexPieDiagram(
                colors: chartData[4]['color'],
                text: chartData[4]['nameTitle'],
                hidePie: hiddenChart5,
                textValue: chartData[4]['valueData'].toString(),
              ),
            ),
            GestureDetector(
              onTap: (){
                setState((){
                  hiddenChart6 = !hiddenChart6;
                });
              },
              child: rowIndexPieDiagram(
                colors: chartData[5]['color'],
                text: chartData[5]['nameTitle'],
                hidePie: hiddenChart6,
                textValue: chartData[5]['valueData'].toString(),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget rowIndexPieDiagram({
    required Color colors, 
    required String text, 
    required bool hidePie,
    required String textValue,
  }){
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 4.0),
          child: SizedBox(
            height: 15,
            width: 15,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: colors,
              )
            ),
          ),
        ),
        Text("$text ($textValue)", style: (hidePie == true)
        ? const TextStyle(
            inherit: false, 
            color: Colors.black, 
            fontWeight: FontWeight.bold, 
            fontSize: 13,
          )
        : const TextStyle(
            inherit: false, 
            color: Colors.black, 
            fontWeight: FontWeight.bold, 
            fontSize: 13,
            decoration: TextDecoration.lineThrough,
            decorationColor: Colors.red,
          ),
        ),
      ],
    );
  }
}

class IndexPieChartRow extends StatefulWidget {
  const IndexPieChartRow({Key? key}) : super(key: key);

  @override
  State<IndexPieChartRow> createState() => _IndexPieChartRowState();
}

class _IndexPieChartRowState extends State<IndexPieChartRow> {
  late bool hiddenChart1, hiddenChart2, hiddenChart3, hiddenChart4, hiddenChart5, hiddenChart6;
  @override
  void initState() {
    super.initState();
    hiddenChart1 = true;
    hiddenChart2 = true;
    hiddenChart3 = true;
    hiddenChart4 = true;
    hiddenChart5 = true;
    hiddenChart6 = true;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ComponenPieChart(hiddenChart1: hiddenChart1, hiddenChart2: hiddenChart2, hiddenChart3: hiddenChart3,
        hiddenChart4: hiddenChart4, hiddenChart5: hiddenChart5, hiddenChart6: hiddenChart6, ratio: 0.5),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: (){
                setState((){
                  hiddenChart1 = !hiddenChart1;
                });
              },
              child: rowIndexPieDiagram(
                colors: chartData[0]['color'],
                text: chartData[0]['nameTitle'],
                hidePie: hiddenChart1,
                textValue: chartData[0]['valueData'].toString(),
              ),
            ),
            GestureDetector(
              onTap: (){
                setState((){
                  hiddenChart2 = !hiddenChart2;
                });
              },
              child: rowIndexPieDiagram(
                colors: chartData[1]['color'],
                text: chartData[1]['nameTitle'],
                hidePie: hiddenChart2, 
                textValue: chartData[1]['valueData'].toString()
              ),
            ),
            GestureDetector(
              onTap: (){
                setState((){
                  hiddenChart3 = !hiddenChart3;
                });
              },
              child: rowIndexPieDiagram(
                colors: chartData[2]['color'],
                text: chartData[2]['nameTitle'],
                hidePie: hiddenChart3,
                textValue: chartData[2]['valueData'].toString(),
              ),
            ),
            GestureDetector(
              onTap: (){
                setState((){
                  hiddenChart4 = !hiddenChart4;
                });
              },
              child: rowIndexPieDiagram(
                colors: chartData[3]['color'],
                text: chartData[3]['nameTitle'],
                hidePie: hiddenChart4,
                textValue: chartData[3]['valueData'].toString(),
              ),
            ),
            GestureDetector(
              onTap: (){
                setState((){
                  hiddenChart5 = !hiddenChart5;
                });
              },
              child: rowIndexPieDiagram(
                colors: chartData[4]['color'],
                text: chartData[4]['nameTitle'],
                hidePie: hiddenChart5,
                textValue: chartData[4]['valueData'].toString(),
              ),
            ),
            GestureDetector(
              onTap: (){
                setState((){
                  hiddenChart6 = !hiddenChart6;
                });
              },
              child: rowIndexPieDiagram(
                colors: chartData[5]['color'],
                text: chartData[5]['nameTitle'],
                hidePie: hiddenChart6,
                textValue: chartData[5]['valueData'].toString(),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget rowIndexPieDiagram({
    required Color colors, 
    required String text, 
    required bool hidePie,
    required String textValue,
  }){
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 4.0),
          child: SizedBox(
            height: 15,
            width: 15,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: colors,
              )
            ),
          ),
        ),
        Text("$text ($textValue)", style: (hidePie == true)
        ? const TextStyle(
            inherit: false, 
            color: Colors.black, 
            fontWeight: FontWeight.bold, 
            fontSize: 13,
          )
        : const TextStyle(
            inherit: false, 
            color: Colors.black, 
            fontWeight: FontWeight.bold, 
            fontSize: 13,
            decoration: TextDecoration.lineThrough,
            decorationColor: Colors.red,
          ),
        ),
      ],
    );
  }
}