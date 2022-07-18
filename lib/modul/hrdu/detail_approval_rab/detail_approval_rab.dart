import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_rab/body.dart';
import 'package:mgp_mobile_app/widget/theme/appbar_theme_color.dart';

class DetailRencanaAnggaranBiayaView extends StatelessWidget {
  const DetailRencanaAnggaranBiayaView({
    Key? key,
    required this.noRab,
    required this.baseline,
    required this.statusMenu,
  }) : super(key: key);
  final String noRab;
  final String baseline;
  final String statusMenu;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Rencana Anggaran Biaya"),
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
      body: Body(noRab: noRab, baseline: baseline, statusMenu: statusMenu),
    );
  }
}