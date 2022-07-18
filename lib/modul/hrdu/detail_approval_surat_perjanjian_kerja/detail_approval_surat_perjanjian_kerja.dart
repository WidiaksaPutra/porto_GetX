import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_surat_perjanjian_kerja/body.dart';
import 'package:mgp_mobile_app/widget/theme/appbar_theme_color.dart';

class DetailSuratPerjanjianKerjaView extends StatelessWidget {
  const DetailSuratPerjanjianKerjaView({
    Key? key,
    required this.noSpk,
    required this.baseline,
    required this.statusMenu,
  }) : super(key: key);
  final String noSpk;
  final String baseline;
  final String statusMenu;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Surat Perjanjian Kerja"),
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
      body: Body(noSpk: noSpk, baseline: baseline, statusMenu: statusMenu),
    );
  }
}