// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:mgp_mobile_app/modul/hrdu/dashboard_hrdu/bar_chart_horizontal/bar_chart.dart';
// import 'package:mgp_mobile_app/modul/hrdu/dashboard_hrdu/bar_chart_vertical/index_bar_chart.dart';
// import 'package:mgp_mobile_app/widget/theme/appbar_theme_color.dart';

// class OnTapBarChartHorizontal extends StatelessWidget {
//   const OnTapBarChartHorizontal({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Bar Chat"),
//         leading: GestureDetector(
//           onTap: () {
//             Get.back();
//           },
//           child: const Icon(
//             Icons.arrow_back
//           ),
//         ),
//         flexibleSpace: const AppBarThemeColor(),
//       ),    
//       body: ListView(
//         scrollDirection: Axis.vertical,
//         physics: const BouncingScrollPhysics(),
//         children: [
//           ComponenBarChartHorizontal(),
//           const IndexBarChartColomn(),
//         ],
//       ),
//     );
//   }
// }