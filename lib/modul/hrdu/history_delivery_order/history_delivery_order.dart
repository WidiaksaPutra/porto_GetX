import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mgp_mobile_app/modul/hrdu/history_delivery_order/body.dart';
import 'package:mgp_mobile_app/modul/hrdu/homepage_hrdu/homepage_hrdu.dart';
import 'package:mgp_mobile_app/widget/theme/appbar_theme_color.dart';

class HistoryDeliveryOrderView extends StatelessWidget {
  const HistoryDeliveryOrderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("History Delivery Order"),
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