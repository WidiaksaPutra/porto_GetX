import 'package:flutter/material.dart';
import 'package:mgp_mobile_app/model/hrdu/analisa_barang_jadi/detail_analisa_barang_jadi_model.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_analisa_barang_jadi/analisa_penunjang_produksi/body.dart';
import 'package:mgp_mobile_app/widget/theme/appbar_theme_color.dart';

class AnalisaPenunjangProduksiView extends StatelessWidget {
  const AnalisaPenunjangProduksiView({Key? key, required this.futureAnalisaBarangJadi}) : super(key: key);
  final Future<DetailRegabj> futureAnalisaBarangJadi;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Analisa Penunjang Produksi"),
        flexibleSpace: const AppBarThemeColor(),
      ),
      body: Body(futureAnalisaBarangJadi: futureAnalisaBarangJadi),
    );
  }
}