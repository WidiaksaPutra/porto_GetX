import 'package:flutter/material.dart';
import 'package:mgp_mobile_app/modul/hrdu/dashboard_hrdu/bar_chart_vertical/default_chart_vertical.dart';

class IndexBarChartColomn extends StatelessWidget {
  const IndexBarChartColomn({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        rowIndexBarDiagram(titleBottom[0], longTitleBottom[0]),
        rowIndexBarDiagram(titleBottom[1], longTitleBottom[1]),
        rowIndexBarDiagram(titleBottom[2], longTitleBottom[2]),
        rowIndexBarDiagram(titleBottom[3], longTitleBottom[3]),
        rowIndexBarDiagram(titleBottom[4], longTitleBottom[4]),
        rowIndexBarDiagram(titleBottom[5], longTitleBottom[5]),
        rowIndexBarDiagram(titleBottom[6], longTitleBottom[6]),
        rowIndexBarDiagram(titleBottom[7], longTitleBottom[7]),
        rowIndexBarDiagram(titleBottom[8], longTitleBottom[8]),
        rowIndexBarDiagram(titleBottom[9], longTitleBottom[9]),
        rowIndexBarDiagram(titleBottom[10], longTitleBottom[10]),
        rowIndexBarDiagram(titleBottom[11], longTitleBottom[11]),
        rowIndexBarDiagram(titleBottom[12], longTitleBottom[12]),
        rowIndexBarDiagram(titleBottom[13], longTitleBottom[13]),
      ],
    );
  }

  Widget rowIndexBarDiagram(String titleData, String textData){
    return Row(
      children: [
        Text("$titleData: ", style: const TextStyle(inherit: false, color: Colors.black, fontWeight: FontWeight.bold, fontSize: 8)),
        Text(textData, style: const TextStyle(inherit: false, color: Colors.black, fontSize: 8)),
      ],
    );
  }
}



class IndexBarChartRow extends StatelessWidget {
  const IndexBarChartRow({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            rowIndexBarDiagram(titleBottom[0], longTitleBottom[0]),
            const SizedBox(width: 20),
            rowIndexBarDiagram(titleBottom[1], longTitleBottom[1]),
            const SizedBox(width: 20),
            rowIndexBarDiagram(titleBottom[2], longTitleBottom[2]),
            const SizedBox(width: 20),
            rowIndexBarDiagram(titleBottom[3], longTitleBottom[3]),
            const SizedBox(width: 20),
            rowIndexBarDiagram(titleBottom[4], longTitleBottom[4]),
            const SizedBox(width: 20),
            rowIndexBarDiagram(titleBottom[5], longTitleBottom[5]),
            const SizedBox(width: 20),
            rowIndexBarDiagram(titleBottom[6], longTitleBottom[6]),
            const SizedBox(width: 20),
            rowIndexBarDiagram(titleBottom[7], longTitleBottom[7]),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            rowIndexBarDiagram(titleBottom[8], longTitleBottom[8]),
            const SizedBox(width: 20),
            rowIndexBarDiagram(titleBottom[9], longTitleBottom[9]),
            const SizedBox(width: 20),
            rowIndexBarDiagram(titleBottom[10], longTitleBottom[10]),
            const SizedBox(width: 20),
            rowIndexBarDiagram(titleBottom[11], longTitleBottom[11]),
            const SizedBox(width: 20),
            rowIndexBarDiagram(titleBottom[12], longTitleBottom[12]),
            const SizedBox(width: 20),
            rowIndexBarDiagram(titleBottom[13], longTitleBottom[13]),
          ],
        ),
      ],
    );
  }

  Widget rowIndexBarDiagram(String titleData, String textData){
    return Row(
      children: [
        Text("$titleData: ", style: const TextStyle(inherit: false, color: Colors.black, fontWeight: FontWeight.bold, fontSize: 10)),
        Text(textData, style: const TextStyle(inherit: false, color: Colors.black, fontSize: 10)),
      ],
    );
  }
}