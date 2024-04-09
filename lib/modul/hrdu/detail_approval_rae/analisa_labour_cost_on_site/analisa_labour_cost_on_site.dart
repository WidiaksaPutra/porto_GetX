import 'package:flutter/material.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_rae/analisa_labour_cost_on_site/body.dart';
import 'package:mgp_mobile_app/widget/theme/appbar_theme_color.dart';

class AnalisaLabourCostOnSiteView extends StatelessWidget {
  const AnalisaLabourCostOnSiteView({Key? key, required this.idRaeDetail}) : super(key: key);
  final String idRaeDetail;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Analisa Labour Cost On-Site"),
        flexibleSpace: const AppBarThemeColor(),
      ),
      body: Body(idRaeDetail: idRaeDetail),
    );
  }
}