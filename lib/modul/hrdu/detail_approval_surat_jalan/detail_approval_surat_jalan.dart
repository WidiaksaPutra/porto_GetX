import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_surat_jalan/body.dart';
import 'package:mgp_mobile_app/widget/theme/appbar_theme_color.dart';

class DetailSuratJalanView extends StatelessWidget {
  const DetailSuratJalanView({
    Key? key,
    required this.noSuratJalan,
    required this.statusMenu,
  }) : super(key: key);
  final String noSuratJalan;
  final String statusMenu;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Surat Jalan"),
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
      body: Body(noSuratJalan: noSuratJalan, statusMenu: statusMenu),
    );
  }
}