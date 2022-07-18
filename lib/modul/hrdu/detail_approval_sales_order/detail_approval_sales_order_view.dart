import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_sales_order/body.dart';
import 'package:mgp_mobile_app/widget/theme/appbar_theme_color.dart';

class DetailSalesOrderView extends StatelessWidget {
  const DetailSalesOrderView({
    Key? key,
    required this.noSalesOrder,
    required this.statusMenu,
  }) : super(key: key);
  final String noSalesOrder;
  final String statusMenu;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Sales Order"),
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
      body: Body(noSalesOrder: noSalesOrder, statusMenu: statusMenu),
    );
  }
}