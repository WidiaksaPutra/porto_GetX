import 'package:flutter/material.dart';
import 'package:mgp_mobile_app/model/hrdu/peluang/analisa_single_peluang_penunjang.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_peluang/analisa_penunjang_produksi/body.dart';
import 'package:mgp_mobile_app/widget/theme/appbar_theme_color.dart';

class AnalisaPenunjangProduksiView extends StatelessWidget {
  const AnalisaPenunjangProduksiView({Key? key, required this.analisaSingleRegplgPenunjang}) : super(key: key);
  final Future<AnalisaSingleRegplgPenunjang> analisaSingleRegplgPenunjang;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Analisa Penunjang Produksi"),
        flexibleSpace: const AppBarThemeColor(),
      ),
      body: Body(analisaSingleRegplgPenunjang: analisaSingleRegplgPenunjang),
    );
  }
}