import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mgp_mobile_app/controller_getX/modul/hrdu/purchase_request/getX_approval_purchase_request.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu/api_purchase_request/api_detail_purchase_request.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu/api_purchase_request/api_post_purchase_request.dart';
import 'package:mgp_mobile_app/widget/component/alert_approval.dart';

class GetxDetailPurchaseRequest extends GetxController with PurchaseRequestDetail, PurchaseRequestPostClass{
  late var dataDetailPurchaseRequest = <String, dynamic>{}.obs;
  late var listDataDetailPurchaseRequest = [].obs;
  late var listDataApprovalPurchaseRequest = [].obs;
  late var loading = true.obs;
  late var isLoading = false.obs;

  methodDetailPurchaseRequest(String data) async{
    await initializeDateFormatting();
    await fetchDetailPurchaseRequest(noPurchaseRequest: data);
    dataDetailPurchaseRequest.value = {
      'behavior': futureDetailPr.behavior.toString(),
      'tglPr': futureDetailPr.detail.tglPurchaseRequest.toString(),
      'noPr': futureDetailPr.detail.noPurchaseRequest.toString(),
      'keperluan': futureDetailPr.detail.keperluan.toString(),
      'tglPemakaian': futureDetailPr.detail.tglPemakaian.toString(),
      'namaProyek': futureDetailPr.detail.namaProyek.toString(),
      'catatanPr': futureDetailPr.detail.catatanPurchaseRequest.toString(),
      'baseline': futureDetailPr.detail.baseline
    };
    listDataDetailPurchaseRequest.value = futureDetailPr.detail.detail;
    listDataApprovalPurchaseRequest.value = futureDetailPr.approval;
    loading.value = loadingData;
  }
  
  Future showAlertDialog(String title, String label, Color color, String noTransaksi, String status, String catatan, String approvalBaseline, BuildContext context) {
    return showDialog(
      context: context, 
      builder: (BuildContext context) {
        return AlertApproval(
          title: title,
          titleColor: color,
          contentApproval: label,
          labelButton: label,
          colorButton: color,
          onClicked: () async {
            Navigator.of(Get.overlayContext!, rootNavigator: true).pop();
            isLoading.value = true;
            final _postProses = await postPurchaseRequest(
              noTransaksi: noTransaksi,
              statusApproval: status,
              catatan: catatan,
              tglApproval: DateTime.now().toString(),
              approvalBaseline: approvalBaseline,
            );
            if (_postProses == "berhasil") {
              Get.put(GetxApprovalPurchaseRequest()).fetchDataApprovalPurchaseRequest();
              Get.back();
              isLoading.value = false;
            }
          }, isLoading: isLoading.value,
        );
      }
    );
  }
}  