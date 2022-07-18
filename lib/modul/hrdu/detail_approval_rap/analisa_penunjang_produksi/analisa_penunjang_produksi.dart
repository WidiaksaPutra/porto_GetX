import 'package:flutter/material.dart';
import 'package:mgp_mobile_app/model/hrdu/rap/analisa_single_rap.dart';
import 'package:mgp_mobile_app/widget/theme/appbar_theme_color.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_rap/analisa_penunjang_produksi/body.dart';

class AnalisaPenunjangProduksiView extends StatelessWidget {
  const AnalisaPenunjangProduksiView({Key? key, required this.analisaSingleRegrap}) : super(key: key);
  final Future<AnalisaSingleRegrap> analisaSingleRegrap;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Analisa Penunjang Produksi"),
        flexibleSpace: const AppBarThemeColor(),
      ),
      body: Body(analisaSingleRegrap: analisaSingleRegrap),
    );
  }
}