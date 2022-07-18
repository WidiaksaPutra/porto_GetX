import 'package:flutter/material.dart';
import 'package:mgp_mobile_app/model/hrdu/rab/detail_rab_model.dart';
import 'package:mgp_mobile_app/widget/theme/appbar_theme_color.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_rab/prelim_rab/body.dart';

class AnalisaPrelimRencanaAnggaranBiayaView extends StatelessWidget {
  const AnalisaPrelimRencanaAnggaranBiayaView({Key? key, required this.detailRegrab, required this.grandTotalPrelim}) : super(key: key);
  final Future<DetailRegrab> detailRegrab;
  final String grandTotalPrelim;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Analisa Prelim"),
        flexibleSpace: const AppBarThemeColor(),
      ),
      body: Body(detailRegrab: detailRegrab, grandTotalPrelim: grandTotalPrelim),
    );
  }
}