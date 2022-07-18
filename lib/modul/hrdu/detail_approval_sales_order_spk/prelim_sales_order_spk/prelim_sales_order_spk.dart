import 'package:flutter/material.dart';
import 'package:mgp_mobile_app/model/hrdu/sales_order_spk/detail_sales_order_spk_model.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_sales_order_spk/prelim_sales_order_spk/body.dart';
import 'package:mgp_mobile_app/widget/theme/appbar_theme_color.dart';

class AnalisaPrelimSalesOrderSPKView extends StatelessWidget {
  const AnalisaPrelimSalesOrderSPKView({Key? key, required this.detailRegsospk, required this.grandTotalPrelim}) : super(key: key);
  final Future<DetailRegsospk> detailRegsospk;
  final String grandTotalPrelim;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Analisa Prelim"),
        flexibleSpace: const AppBarThemeColor(),
      ),
      body: Body(detailRegsospk: detailRegsospk, grandTotalPrelim: grandTotalPrelim)
    );
  }
}