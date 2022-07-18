import 'package:flutter/material.dart';
import 'package:mgp_mobile_app/model/hrdu/penawaran/detail_penawaran_model.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_penawaran/prelim_penawaran/body.dart';
import 'package:mgp_mobile_app/widget/theme/appbar_theme_color.dart';

class AnalisaPrelimPenawaranView extends StatelessWidget {
  const AnalisaPrelimPenawaranView({Key? key, required this.detailPenawaran, required this.grandTotalPrelim}) : super(key: key);
  final Future<DetailRegpnw> detailPenawaran;
  final String grandTotalPrelim;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Analisa Prelim"),
        flexibleSpace: const AppBarThemeColor(),
      ),
      body: Body(detailPenawaran: detailPenawaran, grandTotalPrelim: grandTotalPrelim),
    );
  }
}