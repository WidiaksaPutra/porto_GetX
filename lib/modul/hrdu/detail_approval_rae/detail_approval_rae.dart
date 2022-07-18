import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mgp_mobile_app/widget/theme/appbar_theme_color.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_rae/body.dart';

class DetailRencanaAnggaranEstimasiView extends StatelessWidget {
  const DetailRencanaAnggaranEstimasiView({
    Key? key,
    required this.noRae,
    required this.baseline,
    required this.statusMenu,
  }) : super(key: key);
  final String noRae;
  final String baseline;
  final String statusMenu;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Rencana Anggaran Estimasi"),
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
      body: Body(noRae: noRae, baseline: baseline, statusMenu: statusMenu),
    );
  }
}