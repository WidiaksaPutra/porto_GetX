import 'package:flutter/material.dart';
import 'package:mgp_mobile_app/model/hrdu/surat_perjanjian_kerja/detail_surat_perjanjian_kerja_model.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_surat_perjanjian_kerja/prelim_surat_perjanjian_kerja/body.dart';
import 'package:mgp_mobile_app/widget/theme/appbar_theme_color.dart';

class AnalisaPrelimSuratPerjanjianKerjaView extends StatelessWidget {
  const AnalisaPrelimSuratPerjanjianKerjaView({
    Key? key,
    required this.detailRegspk,
    required this.grandTotalPrelim,
  }) : super(key: key);
  final Future<DetailRegspk> detailRegspk;
  final String grandTotalPrelim;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Analisa Prelim"),
        flexibleSpace: const AppBarThemeColor(),
      ),
      body: Body(detailRegspk: detailRegspk, grandTotalPrelim: grandTotalPrelim),
    );
  }
}