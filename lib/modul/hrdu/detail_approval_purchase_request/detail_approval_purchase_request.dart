import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_purchase_request/body.dart';
import 'package:mgp_mobile_app/widget/theme/appbar_theme_color.dart';

class DetailPurchaseRequestView extends StatelessWidget {
  const DetailPurchaseRequestView({
    Key? key,
    required this.noPurchaseRequest,
    required this.statusMenu,
  }) : super(key: key);
  final String noPurchaseRequest;
  final String statusMenu;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Purchase Request"),
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
      body: Body(noPurchaseRequest: noPurchaseRequest, statusMenu: statusMenu),
    );
  }
}