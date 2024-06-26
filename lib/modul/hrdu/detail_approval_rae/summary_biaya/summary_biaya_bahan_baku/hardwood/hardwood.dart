import 'package:flutter/material.dart';
import 'package:mgp_mobile_app/widget/theme/appbar_theme_color.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_rae/summary_biaya/summary_biaya_bahan_baku/hardwood/body.dart';

class Hardwood extends StatelessWidget {
  final String idRae;
  const Hardwood({Key? key, required this.idRae}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hardwood"),
        flexibleSpace: const AppBarThemeColor(),
      ),
      body: Body(idRae: idRae),
    );
  }
}