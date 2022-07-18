import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_rap/body.dart';
import 'package:mgp_mobile_app/widget/theme/appbar_theme_color.dart';

class DetailRencanaAnggaranProduksiView extends StatelessWidget {
  const DetailRencanaAnggaranProduksiView({
    Key? key,
    required this.noRap,
    required this.baseline,
    required this.statusMenu
  }) : super(key: key);
  final String noRap;
  final String baseline;
  final String statusMenu;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Rencana Anggaran Produksi"),
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
      body: Body(noRap: noRap, baseline: baseline, statusMenu: statusMenu),
    );
  }
}