import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_mutasi_antar_gudang/body.dart';
import 'package:mgp_mobile_app/widget/theme/appbar_theme_color.dart';

class DetailMutasiAntarGudangView extends StatelessWidget {
  const DetailMutasiAntarGudangView({
    Key? key,
    required this.noMutasiAntarGudang,
    required this.statusMenu,
  }) : super(key: key);
  final String noMutasiAntarGudang;
  final String statusMenu;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Mutasi Antar Gudang"),
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
      body: Body(noMutasiAntarGudang: noMutasiAntarGudang, statusMenu: statusMenu),
    );
  }
}