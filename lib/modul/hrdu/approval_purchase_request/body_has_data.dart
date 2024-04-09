import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mgp_mobile_app/controller_getX/modul/hrdu/purchase_request/getX_approval_purchase_request.dart';
import 'package:mgp_mobile_app/modul/hrdu/approval_purchase_request/body_data.dart';
import 'package:mgp_mobile_app/widget/component/componen_loading.dart';

class BodyHasData extends StatelessWidget {
  const BodyHasData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<GetxApprovalPurchaseRequest>(
      init: GetxApprovalPurchaseRequest(),
      builder: (contoller) => (contoller.dataLoading.value == true)
      ? Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return const BodyData();
            }
          )
        )
      : ComponenLoadingListData(data: contoller.dataApprovalPurchaseRequest, boolLoading: contoller.dataLoading.value),
    );
  }
}