import 'package:flutter/material.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_rae/analisa_finishing/body.dart';
import 'package:mgp_mobile_app/model/hrdu/rae/analisa_single_rae.dart';
import 'package:mgp_mobile_app/widget/theme/appbar_theme_color.dart';

class AnalisaFinishingView extends StatelessWidget {
  const AnalisaFinishingView({Key? key, required this.analisaSingleRegrae}) : super(key: key);
  final Future<AnalisaSingleRegrae> analisaSingleRegrae;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Analisa Finishing"),
        flexibleSpace: const AppBarThemeColor(),
      ),
      body: Body(analisaSingleRegrae: analisaSingleRegrae),
    );
  }
}