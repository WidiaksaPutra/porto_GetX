import 'package:flutter/material.dart';
import 'package:mgp_mobile_app/widget/theme/appbar_theme_color.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_rae/summary_biaya/summary_biaya_bahan_lainnya/labour_cost/body.dart';

class LabourCost extends StatelessWidget {
  final String idRae;
  const LabourCost({Key? key, required this.idRae}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Labour Cost"),
        flexibleSpace: const AppBarThemeColor(),
      ),
      body: Body(idRae: idRae),
    );
  }
}