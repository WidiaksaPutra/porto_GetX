import 'package:flutter/material.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_peluang/analisa_finishing/body.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_peluang/analisa_finishing/nama_finishing.dart';
import 'package:mgp_mobile_app/widget/theme/appbar_theme_color.dart';

class AnalisaFinishingView extends StatelessWidget {
  const AnalisaFinishingView({Key? key, required this.idBarangJadi}) : super(key: key);
  final String idBarangJadi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Analisa Finishing"),
        flexibleSpace: const AppBarThemeColor(),
      ),
      body: NamaBody(idBarangJadi: idBarangJadi),
    );
  }
}

class AnalisaFinishingView2 extends StatelessWidget {
  const AnalisaFinishingView2({Key? key, required this.namaFinishing, required this.idBarangJadi}) : super(key: key);
  final String namaFinishing, idBarangJadi;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(namaFinishing),
        flexibleSpace: const AppBarThemeColor(),
      ),
      body: BodyFinihing(namaFinishing: namaFinishing, idBarangJadi: idBarangJadi),
    );
  }
}