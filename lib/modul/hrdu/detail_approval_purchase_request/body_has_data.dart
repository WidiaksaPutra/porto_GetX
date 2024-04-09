import 'package:mgp_mobile_app/controller_getX/default/getX_default_visibility_detail.dart';
import 'package:mgp_mobile_app/controller_getX/modul/hrdu/purchase_request/getX_detail_approval_purchase_request.dart';
import 'package:flutter/material.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_purchase_request/body_bottom.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_purchase_request/body_card_detail.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_purchase_request/body_card_item.dart';
import 'package:mgp_mobile_app/modul/hrdu/detail_approval_purchase_request/body_catatan.dart';
import 'package:mgp_mobile_app/widget/component/componen_loading.dart';
import 'package:get/get.dart';
import 'package:mgp_mobile_app/widget/theme/size_config.dart';

class BodyHasData extends StatelessWidget{
  const BodyHasData({Key? key, required this.noPurchaseRequest, required this.statusMenu}) : super(key: key);
  final String noPurchaseRequest;
  final String statusMenu;

  @override
  Widget build(BuildContext context) {
    String status;
    Get.put(GetxDetailPurchaseRequest()).methodDetailPurchaseRequest(noPurchaseRequest);
    Get.put(DefaultVisibilityDetail()).defaultApprovalVisibilityDetail(statusMenu);
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: GetX<GetxDetailPurchaseRequest>(
              init: GetxDetailPurchaseRequest(),
              builder: (controllerData){
              if((controllerData.loading.value == false)){
                status = controllerData.dataDetailPurchaseRequest['behavior'].toString();
                Get.put(DefaultVisibilityDetail()).defaultButtonVisibilityDetail(status);
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    BodyCardDetail(controllerData: controllerData),
                    BodyCardItem(controllerData: controllerData),
                    BodyCatatan(controllerData: controllerData),
                    BodyBottom(controllerData: controllerData),
                  ],
                );
              }else{
                return const ComponenLoadingBasicData();
              }},
            ),
          ),
        ),
      ),
    );
  }
}