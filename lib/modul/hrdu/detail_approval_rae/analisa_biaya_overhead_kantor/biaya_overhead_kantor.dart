import 'package:flutter/material.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_rae/analisa_biaya_overhead_kantor/body.dart';
import 'package:mgp_mobile_app/widget/theme/appbar_theme_color.dart';

class AnalisaBiayaOverheadKantorView extends StatelessWidget {
  const AnalisaBiayaOverheadKantorView({Key? key, required this.idRaeDetail, required this.totalAnalisaBahanBaku, required this.totalAnalisaPenunjanProduksi, required this.totalAnalisaFinishing, required this.totalAnalisaAlatBantuOnSite, required this.totalAnalisaLabourCostOnSite}) : super(key: key);
  final String idRaeDetail, totalAnalisaBahanBaku, totalAnalisaPenunjanProduksi, totalAnalisaFinishing, totalAnalisaAlatBantuOnSite, totalAnalisaLabourCostOnSite;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Analisa Biaya Overhead Kantor"),
        flexibleSpace: const AppBarThemeColor(),
      ),
      body: Body(idRaeDetail: idRaeDetail, totalAnalisaBahanBaku: totalAnalisaBahanBaku, totalAnalisaPenunjanProduksi: totalAnalisaPenunjanProduksi, totalAnalisaFinishing: totalAnalisaFinishing, totalAnalisaAlatBantuOnSite: totalAnalisaAlatBantuOnSite, totalAnalisaLabourCostOnSite: totalAnalisaLabourCostOnSite, ),
    );
  }
}