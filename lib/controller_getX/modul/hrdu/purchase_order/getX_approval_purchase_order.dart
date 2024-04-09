import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu/api_purchase_order/api_approval_purchase_order.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu/api_purchase_order/api_detail_purchase_order.dart';

class GetxApprovalPurchaseOrder extends GetxController with PurchaseOrderApprovalClass, PurchaseOrderDetail{
  late var dataApprovalPurchaseOrder = [].obs;
  late var dataLoading = false.obs;
  late var scrollLoading = false.obs;
  late var dataTotalPo = 0.obs;
  late var loadingTotalDataPo = false.obs;
  late var totalDataListApprovalPo = 0.obs;
  late ScrollController scrollController = ScrollController();

  fetchCountApprovalPurchaseOrder() async{
    await fetchApprovalCountPurchaseOrder();
    loadingTotalDataPo.value = loadingTotalData;
    totalDataListApprovalPo.value = totalDataListApproval;
  }

  fetchDataApprovalPurchaseOrder() async{
    await initializeDateFormatting();
    await refreshApprovalPurchaseOrder();
    await scrollDataApprovalPurchaseOrder();
  }

  totalListApprovalPurchaseOrder() async{
    await fetchApprovalCountPurchaseOrder();
    dataTotalPo.value = totalDataListApproval;
  }

  Future refreshApprovalPurchaseOrder() async{
    dataListApproval.clear();
    dataApprovalPurchaseOrder.clear();
    dataApprovalPurchaseOrder.value = dataListApproval;
    loading = false;
    scrollLoading.value = loading;
    loadingData = false;
    dataLoading.value = loadingData;
    pages = 1;
    await fetchApprovalPurchaseOrder();
    dataApprovalPurchaseOrder.value = dataListApproval;
    dataLoading.value = loadingData;
  }

  searchApproval(dynamic value) async{
    dataListApproval.clear();
    dataApprovalPurchaseOrder.clear();
    dataApprovalPurchaseOrder.value = dataListApproval;
    loading = false;
    scrollLoading.value = loading;
    loadingData = false;
    dataLoading.value = loadingData;
    pages = 1;
    if(value.contains("/")){
      await fetchApprovalPurchaseOrder(noPurchaseOrder: value);
    }
    else if(value.contains("PEN") || value.contains("Pen") || value.contains("pen") || value.contains("VER") || value.contains("Ver") || value.contains("ver")){
      await fetchApprovalPurchaseOrder(statusApproval: value);
    }
    else{
      await fetchApprovalPurchaseOrder(namaVendor: value);
    }
    dataApprovalPurchaseOrder.value = dataListApproval;
    dataLoading.value = loadingData;
  }

  scrollDataApprovalPurchaseOrder(){
    scrollController.addListener(() async {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        if(scrollLoading.value != true){
          loading = true;
          scrollLoading.value = loading;
          await fetchApprovalPurchaseOrder();
          loading = false;
        }
        dataApprovalPurchaseOrder.value = dataListApproval;
        dataApprovalPurchaseOrder.refresh();
        scrollLoading.value = loading;
      }
    });
  }
}