import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mgp_mobile_app/modul/hrdu/history_sales_order_spk/body.dart';
import 'package:mgp_mobile_app/modul/hrdu/homepage_hrdu/homepage_hrdu.dart';
import 'package:mgp_mobile_app/widget/theme/appbar_theme_color.dart';

class HistorySalesOrderSPKView extends StatefulWidget {
  const HistorySalesOrderSPKView({Key? key}) : super(key: key);

  @override
  _HistorySalesOrderSPKViewState createState() => _HistorySalesOrderSPKViewState();
}

class _HistorySalesOrderSPKViewState extends State<HistorySalesOrderSPKView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("History Sales Order SPK"),
        leading: GestureDetector(
          onTap: () {
            Get.to(const HomePageHRDU(
              selectedIndexPage: 1,
            ));
          },
          child: const Icon(
            Icons.arrow_back
          ),
        ),
        flexibleSpace: const AppBarThemeColor(),
      ),
      body: const BodyHistory(),
    );
  }
}