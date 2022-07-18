import 'package:flutter/material.dart';
import 'package:mgp_mobile_app/model/hrdu/rab/analisa_single_rab.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_rab/analisa_biaya_overhead_kantor/body.dart';
import 'package:mgp_mobile_app/widget/theme/appbar_theme_color.dart';

class AnalisaBiayaOverheadKantorView extends StatelessWidget {
  const AnalisaBiayaOverheadKantorView({Key? key, required this.analisaSingleRegrab}) : super(key: key);
  final Future<AnalisaSingleRegrab> analisaSingleRegrab;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Analisa Biaya Overhead Kantor"),
        flexibleSpace: const AppBarThemeColor(),
      ),
      body: Body(analisaSingleRegrab: analisaSingleRegrab),
    );
  }
}