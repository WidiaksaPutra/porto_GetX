import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu/api_purchase_request/api_approval_purchase_request.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu/api_purchase_request/api_detail_purchase_request.dart';

class GetxApprovalPurchaseRequest extends GetxController with PurchaseRequestApprovalClass, PurchaseRequestDetail{
  late var dataApprovalPurchaseRequest = [].obs;
  late var dataLoading = false.obs;
  late var scrollLoading = false.obs;
  late var dataTotalPr = 0.obs;
  late var loadingTotalDataPr = false.obs;
  late var totalDataListApprovalPr = 0.obs;
  late ScrollController scrollController = ScrollController();

  fetchCountApprovalPurchaseRequest() async{
    await fetchApprovalCountPurchaseRequest();
    loadingTotalDataPr.value = loadingTotalData;
    totalDataListApprovalPr.value = totalDataListApproval;
  }

  fetchDataApprovalPurchaseRequest() async{
    await initializeDateFormatting();
    await refreshApprovalPurchaseRequest();
    await scrollDataApprovalPurchaseRequest();
  }

  totalListApprovalPurchaseRequest() async{
    await fetchApprovalCountPurchaseRequest();
    dataTotalPr.value = totalDataListApproval;
  }

  Future refreshApprovalPurchaseRequest() async{
    dataListApproval.clear();
    dataApprovalPurchaseRequest.clear();
    dataApprovalPurchaseRequest.value = dataListApproval;
    loading = false;
    scrollLoading.value = loading;
    loadingData = false;
    dataLoading.value = loadingData;
    pages = 1;
    await fetchApprovalPurchaseRequest();
    dataApprovalPurchaseRequest.value = dataListApproval;
    dataLoading.value = loadingData;
  }

  searchApproval(dynamic value) async{
    dataListApproval.clear();
    dataApprovalPurchaseRequest.clear();
    dataApprovalPurchaseRequest.value = dataListApproval;
    loading = false;
    scrollLoading.value = loading;
    loadingData = false;
    dataLoading.value = loadingData;
    pages = 1;
    if(value.contains("/")){
      await fetchApprovalPurchaseRequest(noPurchaseRequest: value);
    }
    else if(value.contains("PEN") || value.contains("Pen") || value.contains("pen") || value.contains("VER") || value.contains("Ver") || value.contains("ver")){
      await fetchApprovalPurchaseRequest(statusApproval: value);
    }
    else{
      await fetchApprovalPurchaseRequest(keperluan: value);
    }
    dataApprovalPurchaseRequest.value = dataListApproval;
    dataLoading.value = loadingData;
  }

  scrollDataApprovalPurchaseRequest(){
    scrollController.addListener(() async {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        if(scrollLoading.value != true){
          loading = true;
          scrollLoading.value = loading;
          await fetchApprovalPurchaseRequest();
          loading = false;
        }
        dataApprovalPurchaseRequest.value = dataListApproval;
        dataApprovalPurchaseRequest.refresh();
        scrollLoading.value = loading;
      }
    });
  }
}