import 'package:flutter/material.dart';
import 'package:mgp_mobile_app/widget/theme/appbar_theme_color.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_rae/prelim_rae/body.dart';
import 'package:mgp_mobile_app/model/hrdu/rae/detail_rae_model.dart';

class AnalisaPrelimRencanaAnggaranEstimasiView extends StatelessWidget {
  const AnalisaPrelimRencanaAnggaranEstimasiView({Key? key, required this.detailRegrae, required this.grandTotalPrelim}) : super(key: key);
  final Future<DetailRegrae> detailRegrae;
  final String grandTotalPrelim;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Analisa Prelim"),
        flexibleSpace: const AppBarThemeColor(),
      ),
      body: Body(detailRegrae: detailRegrae, grandTotalPrelim: grandTotalPrelim),
    );
  }
}