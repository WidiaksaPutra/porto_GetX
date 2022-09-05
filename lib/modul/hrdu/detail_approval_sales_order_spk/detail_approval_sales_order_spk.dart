import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_sales_order_spk/body.dart';
import 'package:mgp_mobile_app/widget/theme/appbar_theme_color.dart';

class DetailSalesOrderSPKView extends StatelessWidget {
  const DetailSalesOrderSPKView({
    Key? key,
    required this.noSalesOrderSPK,
    required this.idSalesOrderSpk,
    required this.statusMenu,
  }) : super(key: key);
  final String noSalesOrderSPK;
  final String idSalesOrderSpk;
  final String statusMenu;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Sales Order SPK"),
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back
          ),
        ),
        flexibleSpace: const AppBarThemeColor(),
      ),
      body: Body(noSalesOrderSPK: noSalesOrderSPK, statusMenu: statusMenu, idSalesOrderSpk: idSalesOrderSpk,),
    );
  }
}