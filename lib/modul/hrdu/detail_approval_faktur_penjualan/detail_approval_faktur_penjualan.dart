import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_faktur_penjualan/body.dart';
import 'package:mgp_mobile_app/widget/theme/appbar_theme_color.dart';

class DetailFakturPenjualanView extends StatelessWidget {
  const DetailFakturPenjualanView({
    Key? key,
    required this.noFaktur,
    required this.statusMenu
  }) : super(key: key);
  final String noFaktur;
  final String statusMenu;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Faktur Penjualan"),
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
      body: Body(noFaktur: noFaktur, statusMenu: statusMenu),
    );
  }
}