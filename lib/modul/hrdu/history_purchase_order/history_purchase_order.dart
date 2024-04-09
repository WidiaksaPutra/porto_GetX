import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mgp_mobile_app/controller_getX/modul/hrdu/purchase_order/getX_history_purchase_order.dart';
import 'package:mgp_mobile_app/modul/hrdu/history_purchase_order/body_basic.dart';
import 'package:mgp_mobile_app/modul/hrdu/homepage_hrdu/homepage_hrdu.dart';
import 'package:mgp_mobile_app/widget/theme/appbar_theme_color.dart';

class HistoryPurchaseOrderView extends StatelessWidget {
  const HistoryPurchaseOrderView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(GetxHistoryPurchaseOrder()).fetchDataHistoryPurchaseOrder();
    return Scaffold(
      appBar: AppBar(
        title: const Text("History Purchase Order"),
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
      body: const BodyBasic(),
    );
  }
}