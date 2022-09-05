import 'package:flutter/material.dart';
import 'package:mgp_mobile_app/model/hrdu/peluang/analisa_single_peluang_fin.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_peluang/analisa_finishing/body.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_peluang/analisa_finishing/nama_finishing.dart';
import 'package:mgp_mobile_app/widget/theme/appbar_theme_color.dart';

class AnalisaFinishingView extends StatelessWidget {
  const AnalisaFinishingView({Key? key, required this.analisaSingleRegplgFinishing}) : super(key: key);
  final Future<AnalisaSingleRegplgFinishing> analisaSingleRegplgFinishing;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Analisa Finishing"),
        flexibleSpace: const AppBarThemeColor(),
      ),
      body: NamaBody(analisaSingleRegplgFinishing: analisaSingleRegplgFinishing),
    );
  }
}

class AnalisaFinishingView2 extends StatelessWidget {
  const AnalisaFinishingView2({Key? key, required this.analisaSingleRegplgFinishing, required this.namaFinishing}) : super(key: key);
  final Future<AnalisaSingleRegplgFinishing> analisaSingleRegplgFinishing;
  final String namaFinishing;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(namaFinishing),
        flexibleSpace: const AppBarThemeColor(),
      ),
      body: BodyFinihing(namaFinishing: namaFinishing, analisaSingleRegplgFinishing: analisaSingleRegplgFinishing),
    );
  }
}