import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_purchase_order/body.dart';
import 'package:mgp_mobile_app/widget/theme/appbar_theme_color.dart';

class DetailPurchaseOrderView extends StatelessWidget {
  const DetailPurchaseOrderView({
    Key? key,
    required this.noPurchaseOrder,
    required this.statusMenu,
  }) : super(key: key);
  final String noPurchaseOrder;
  final String statusMenu;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Purchase Order"),
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
      body: Body(noPurchaseOrder: noPurchaseOrder, statusMenu: statusMenu),
    );
  }
}