import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_penawaran/body.dart';
import 'package:mgp_mobile_app/widget/theme/appbar_theme_color.dart';

class DetailPenawaranView extends StatelessWidget {
  const DetailPenawaranView({
    Key? key,
    required this.noPenawaran,
    required this.baseline,
    required this.statusMenu,
  }) : super(key: key);
  final String noPenawaran;
  final String baseline;
  final String statusMenu;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Penawaran"),
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
      body: Body(noPenawaran: noPenawaran, baseline: baseline, statusMenu: statusMenu),
    );
  }
}