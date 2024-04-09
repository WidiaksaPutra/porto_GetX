import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_purchase_request/body_has_data.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_purchase_request/body_gambar_item.dart';
import 'package:mgp_mobile_app/widget/theme/appbar_theme_color.dart';

class DetailPurchaseRequestView extends StatelessWidget {
  const DetailPurchaseRequestView({Key? key, required this.noPurchaseRequest, required this.statusMenu}) : super(key: key);
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
      body: BodyHasData(noPurchaseRequest: noPurchaseRequest, statusMenu: statusMenu),
    );
  }
}

class DetailGambarPurchaseRequestView extends StatelessWidget {
  const DetailGambarPurchaseRequestView({Key? key,required this.gambarIndex}) : super(key: key);
  final List<String>? gambarIndex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Gambar Purchase Request"),
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
      body: BodyGambarItem(gambarIndex: gambarIndex),
    );
  }
}