import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_penerimaan_barang/body.dart';
import 'package:mgp_mobile_app/widget/theme/appbar_theme_color.dart';

class DetailPenerimaanBarangView extends StatelessWidget {
  const DetailPenerimaanBarangView({
    Key? key,
    required this.noPenerimaanBarang,
    required this.statusMenu,
  }) : super(key: key);
  final String noPenerimaanBarang;
  final String statusMenu;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Penerimaan Barang"),
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
      body: Body(noPenerimaanBarang: noPenerimaanBarang, statusMenu: statusMenu),
    );
  }
}