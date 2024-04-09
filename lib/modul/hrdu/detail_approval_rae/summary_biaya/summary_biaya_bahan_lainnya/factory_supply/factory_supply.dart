import 'package:flutter/material.dart';
import 'package:mgp_mobile_app/model/hrdu/rae/rekapitulasi.dart';
import 'package:mgp_mobile_app/widget/theme/appbar_theme_color.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_rae/summary_biaya/summary_biaya_bahan_lainnya/factory_supply/body.dart';

class FactorySupply extends StatelessWidget {
  final String idRae;
  const FactorySupply({Key? key, required this.idRae}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Factory Supply"),
        flexibleSpace: const AppBarThemeColor(),
      ),
      body: Body(idRae: idRae),
    );
  }
}