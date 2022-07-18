import 'package:flutter/material.dart';
import 'package:mgp_mobile_app/model/hrdu/rab/analisa_single_rab.dart';
import 'package:mgp_mobile_app/widget/theme/appbar_theme_color.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_rab/analisa_penunjang_produksi/body.dart';

class AnalisaPenunjangProduksiView extends StatelessWidget {
  const AnalisaPenunjangProduksiView({Key? key, required this.analisaSingleRegrab}) : super(key: key);
  final Future<AnalisaSingleRegrab> analisaSingleRegrab;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Analisa Penunjang Produksi"),
        flexibleSpace: const AppBarThemeColor(),
      ),
      body: Body(analisaSingleRegrab: analisaSingleRegrab),
    );
  }
}