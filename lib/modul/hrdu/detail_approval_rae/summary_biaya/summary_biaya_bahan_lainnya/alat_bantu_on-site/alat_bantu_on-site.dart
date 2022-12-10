import 'package:flutter/material.dart';
import 'package:mgp_mobile_app/model/hrdu/rae/rekapitulasi.dart';
import 'package:mgp_mobile_app/widget/theme/appbar_theme_color.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_rae/summary_biaya/summary_biaya_bahan_lainnya/alat_bantu_on-site/body.dart';

class AlatBantuOnSite extends StatelessWidget {
  final Future<Rekapitulasi> futureRekapitulasi;
  const AlatBantuOnSite({Key? key, required this.futureRekapitulasi}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Alat Bantu On-Site"),
        flexibleSpace: const AppBarThemeColor(),
      ),
      body: Body(futureRekapitulasi: futureRekapitulasi),
    );
  }
}