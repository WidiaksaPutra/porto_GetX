import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu/api_purchase_order/api_history_purchase_order.dart';

class GetxHistoryPurchaseOrder extends GetxController with PurchaseOrderHistoryClass{
  late var dataHistoryPurchaseOrder = [].obs;
  late var dataLoading = false.obs;
  late var scrollLoading = false.obs;
  late ScrollController scrollController = ScrollController();

  fetchDataHistoryPurchaseOrder() async{
    initializeDateFormatting();
    refreshHistoryPurchaseOrder();
    await scrollDataHistoryPurchaseOrder();
  }

  Future refreshHistoryPurchaseOrder() async{
    dataListHistory.clear();
    dataHistoryPurchaseOrder.clear();
    dataHistoryPurchaseOrder.value = dataListHistory;
    loading = false;
    scrollLoading.value = loading;
    loadingData = false;
    dataLoading.value = loadingData;
    pages = 1;
    await fetchHistoryPurchaseOrder();
    dataHistoryPurchaseOrder.value = dataListHistory;
    dataLoading.value = loadingData;
  }

  searchHistory(dynamic value) async{
    dataListHistory.clear();
    dataHistoryPurchaseOrder.clear();
    dataHistoryPurchaseOrder.value = dataListHistory;
    loading = false;
    scrollLoading.value = loading;
    loadingData = false;
    dataLoading.value = loadingData;
    pages = 1;
    if(value.contains("/")){
      await fetchHistoryPurchaseOrder(noPurchaseOrder: value);
    }
    else if(value.contains("PEN") || value.contains("Pen") || value.contains("pen") || value.contains("VER") || value.contains("Ver") || value.contains("ver")){
      await fetchHistoryPurchaseOrder(statusHistory: value);
    }
    else{
      await fetchHistoryPurchaseOrder(namaVendor: value);
    }
    dataHistoryPurchaseOrder.value = dataListHistory;
    dataLoading.value = loadingData;
  }

  scrollDataHistoryPurchaseOrder(){
    scrollController.addListener(() async {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        if(scrollLoading.value != true){
          loading = true;
          scrollLoading.value = loading;
          await fetchHistoryPurchaseOrder();
          loading = false;
        }
        dataHistoryPurchaseOrder.value = dataListHistory;
        dataHistoryPurchaseOrder.refresh();
        scrollLoading.value = loading;
      }
    });
  }
}