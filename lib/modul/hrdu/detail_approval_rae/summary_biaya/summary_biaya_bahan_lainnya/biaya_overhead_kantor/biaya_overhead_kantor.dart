import 'package:flutter/material.dart';
import 'package:mgp_mobile_app/model/hrdu/rae/rekapitulasi.dart';
import 'package:mgp_mobile_app/widget/theme/appbar_theme_color.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_rae/summary_biaya/summary_biaya_bahan_lainnya/biaya_overhead_kantor/body.dart';

class BiayaOverheadKantor extends StatelessWidget {
  final Future<Rekapitulasi> futureRekapitulasi;
  final List listSubTotalOverheadKantor, unitPrice;
  final num totalBiayaOverheadKantor;
  const BiayaOverheadKantor({Key? key, required this.futureRekapitulasi, required this.listSubTotalOverheadKantor, required this.totalBiayaOverheadKantor, required this.unitPrice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Biaya Overhead"),
        flexibleSpace: const AppBarThemeColor(),
      ),
      body: Body(futureRekapitulasi: futureRekapitulasi, listSubTotalOverheadKantor: listSubTotalOverheadKantor, totalBiayaOverheadKantor: totalBiayaOverheadKantor, unitPrice: unitPrice),
    );
  }
}