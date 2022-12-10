import 'package:flutter/material.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_peluang/analisa_bahan_baku/body.dart';
import 'package:mgp_mobile_app/widget/theme/appbar_theme_color.dart';

class AnalisaBahanBakuView extends StatelessWidget {
  const AnalisaBahanBakuView({Key? key, required this.idBarangJadi}) : super(key: key);
  final String idBarangJadi;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Analisa Bahan Baku"),
        flexibleSpace: const AppBarThemeColor(),
      ),
      body: Body(idBarangJadi: idBarangJadi),
    );
  }
}