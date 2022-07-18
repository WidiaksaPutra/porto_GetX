import 'package:flutter/material.dart';
import 'package:mgp_mobile_app/widget/theme/appbar_theme_color.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_rae/analisa_alat_bantu_on_site/body.dart';
import 'package:mgp_mobile_app/model/hrdu/rae/analisa_single_rae.dart';

class AnalisaAlatBantuOnSiteView extends StatelessWidget {
  const AnalisaAlatBantuOnSiteView({Key? key, required this.analisaSingleRegrae}) : super(key: key);
  final Future<AnalisaSingleRegrae> analisaSingleRegrae;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Analisa Alat Bantu On-Site"),
        flexibleSpace: const AppBarThemeColor(),
      ),
      body: Body(analisaSingleRegrae: analisaSingleRegrae),
    );
  }
}