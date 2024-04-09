import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mgp_mobile_app/modul/hrdu/dashboard_hrdu/pie_chart/index_pie_chart.dart';
import 'package:mgp_mobile_app/widget/theme/appbar_theme_color.dart';

class OnTapPieChart extends StatelessWidget {
  const OnTapPieChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pie Chat"),
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back
          ),
        ),
        flexibleSpace: const AppBarThemeColor(),
      ),    
      body: ListView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        children: const [
          Padding(
            padding: EdgeInsets.only(top: 10, left: 10, right: 10),
            child: Text("Persentase PR Berdasarkan Keperluan",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Center(
                child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                child: IndexPieChartRow(),
              ),
            )
          ),
        ]
      ),
    );
  }
}