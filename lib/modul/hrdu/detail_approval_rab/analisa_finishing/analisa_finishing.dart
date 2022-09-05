import 'package:flutter/material.dart';
import 'package:mgp_mobile_app/model/hrdu/rab/analisa_single_rab.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_rab/analisa_finishing/body.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_rab/analisa_finishing/nama_finishing.dart';
import 'package:mgp_mobile_app/widget/theme/appbar_theme_color.dart';

class AnalisaFinishingView extends StatelessWidget {
  const AnalisaFinishingView({Key? key, required this.analisaSingleRegrab}) : super(key: key);
  final Future<AnalisaSingleRegrab> analisaSingleRegrab;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Analisa Finishing"),
        flexibleSpace: const AppBarThemeColor(),
      ),
      body: NamaBody(analisaSingleRegrab: analisaSingleRegrab),
    );
  }
}

class AnalisaFinishingView2 extends StatelessWidget {
  const AnalisaFinishingView2({Key? key, required this.analisaSingleRegrab, required this.namaFinishing}) : super(key: key);
  final Future<AnalisaSingleRegrab> analisaSingleRegrab;
  final String namaFinishing;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(namaFinishing),
        flexibleSpace: const AppBarThemeColor(),
      ),
      body: BodyFinihingRab(namaFinishing: namaFinishing, analisaSingleRegrab: analisaSingleRegrab),
    );
  }
}