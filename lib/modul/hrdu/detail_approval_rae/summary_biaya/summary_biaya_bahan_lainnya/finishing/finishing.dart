import 'package:flutter/material.dart';
import 'package:mgp_mobile_app/model/hrdu/rae/rekapitulasi.dart';
import 'package:mgp_mobile_app/widget/theme/appbar_theme_color.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_rae/summary_biaya/summary_biaya_bahan_lainnya/finishing/body.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_rae/summary_biaya/summary_biaya_bahan_lainnya/finishing/nama_finishing.dart';

class Finishing extends StatelessWidget {
  final Future<Rekapitulasi> futureRekapitulasi;
  const Finishing({Key? key, required this.futureRekapitulasi}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Finishing"),
        flexibleSpace: const AppBarThemeColor(),
      ),
      body: NamaBody(futureRekapitulasi: futureRekapitulasi),
    );
  }
}

class AnalisaFinishingView2 extends StatelessWidget {
  final Future<Rekapitulasi> futureRekapitulasi;
  final String namaFinishing;
  const AnalisaFinishingView2({Key? key, required this.futureRekapitulasi, required this.namaFinishing}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(namaFinishing),
        flexibleSpace: const AppBarThemeColor(),
      ),
      body: BodyFinihing(namaFinishing: namaFinishing, futureRekapitulasi: futureRekapitulasi),
    );
  }
}