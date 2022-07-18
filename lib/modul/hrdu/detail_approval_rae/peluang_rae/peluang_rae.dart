import 'package:flutter/material.dart';
import 'package:mgp_mobile_app/widget/theme/appbar_theme_color.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_rae/peluang_rae/body.dart';

class DetailPeluangRencanaAnggaranEstimasiView extends StatelessWidget {
  const DetailPeluangRencanaAnggaranEstimasiView({Key? key, required this.noPeluang}) : super(key: key);
  final String noPeluang;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Peluang"),
        flexibleSpace: const AppBarThemeColor(),
      ),
      body: Body(noPeluang: noPeluang),
    );
  }
}