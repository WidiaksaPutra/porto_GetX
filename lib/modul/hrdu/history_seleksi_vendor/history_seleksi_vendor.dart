import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mgp_mobile_app/controller_getX/modul/hrdu/seleksi_vendor/getX_history_seleksi_vendor.dart';
import 'package:mgp_mobile_app/modul/hrdu/history_seleksi_vendor/body_basic.dart';
import 'package:mgp_mobile_app/modul/hrdu/homepage_hrdu/homepage_hrdu.dart';
import 'package:mgp_mobile_app/widget/theme/appbar_theme_color.dart';

class HistorySeleksiVendorView extends StatelessWidget {
  const HistorySeleksiVendorView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(GetxHistorySeleksiVendor()).fetchDataHistorySeleksiVendor();
    return Scaffold(
      appBar: AppBar(
        title: const Text("History Seleksi Vendor"),
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