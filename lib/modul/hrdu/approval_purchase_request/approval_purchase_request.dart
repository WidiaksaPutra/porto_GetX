import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mgp_mobile_app/controller_getX/modul/hrdu/purchase_request/getX_approval_purchase_request.dart';
import 'package:mgp_mobile_app/modul/hrdu/approval_purchase_request/body_basic.dart';
import 'package:mgp_mobile_app/modul/hrdu/homepage_hrdu/homepage_hrdu.dart';
import 'package:mgp_mobile_app/widget/theme/appbar_theme_color.dart';

class PurchaseRequestView extends StatelessWidget {
  const PurchaseRequestView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(GetxApprovalPurchaseRequest()).fetchDataApprovalPurchaseRequest();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Approval Purchase Request"),
        leading: GestureDetector(
          onTap: () {
            Get.to(const HomePageHRDU(
              selectedIndexPage: 1,
            ));
          },
          child: const Icon(
            Icons.arrow_back
          ),
        ),
        flexibleSpace: const AppBarThemeColor(),
      ),
      body: const BodyBasic(),
    );
  }
}