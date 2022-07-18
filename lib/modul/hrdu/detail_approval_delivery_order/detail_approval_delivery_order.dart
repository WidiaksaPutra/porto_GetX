import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_delivery_order/body.dart';
import 'package:mgp_mobile_app/widget/theme/appbar_theme_color.dart';

class DetailDeliveryOrderView extends StatelessWidget {
  const DetailDeliveryOrderView({
    Key? key,
    required this.noDeliveryOrder,
    required this.statusMenu,
  }) : super(key: key);
  final String noDeliveryOrder;
  final String statusMenu;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Delivery Order"),
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
      body: Body(noDeliveryOrder: noDeliveryOrder, statusMenu: statusMenu),
    );
  }
}