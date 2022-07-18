import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_peluang/body.dart';
import 'package:mgp_mobile_app/widget/theme/appbar_theme_color.dart';

class DetailPeluangView extends StatelessWidget {
  const DetailPeluangView({
    Key? key,
    required this.noPeluang,
    required this.statusMenu,
  }) : super(key: key);
  final String noPeluang;
  final String statusMenu;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Peluang"),
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
      body: Body(noPeluang: noPeluang, statusMenu: statusMenu),
    );
  }
}