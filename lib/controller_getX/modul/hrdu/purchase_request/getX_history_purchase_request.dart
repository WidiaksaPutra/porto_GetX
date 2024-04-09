import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu/api_purchase_request/api_history_purchase_request.dart';

class GetxHistoryPurchaseRequest extends GetxController with PurchaseRequestHistoryClass{
  late var dataHistoryPurchaseRequest = [].obs;
  late var dataLoading = false.obs;
  late var scrollLoading = false.obs;
  late ScrollController scrollController = ScrollController();

  fetchDataHistoryPurchaseRequest() async{
    initializeDateFormatting();
    refreshHistoryPurchaseRequest();
    await scrollDataHistoryPurchaseRequest();
  }

  Future refreshHistoryPurchaseRequest() async{
    dataListHistory.clear();
    dataHistoryPurchaseRequest.clear();
    dataHistoryPurchaseRequest.value = dataListHistory;
    loading = false;
    scrollLoading.value = loading;
    loadingData = false;
    dataLoading.value = loadingData;
    pages = 1;
    await fetchHistoryPurchaseRequest();
    dataHistoryPurchaseRequest.value = dataListHistory;
    dataLoading.value = loadingData;
  }

  searchHistory(dynamic value) async{
    dataListHistory.clear();
    dataHistoryPurchaseRequest.clear();
    dataHistoryPurchaseRequest.value = dataListHistory;
    loading = false;
    scrollLoading.value = loading;
    loadingData = false;
    dataLoading.value = loadingData;
    pages = 1;
    if(value.contains("/")){
      await fetchHistoryPurchaseRequest(noPurchaseRequest: value);
    }
    else if(value.contains("PEN") || value.contains("Pen") || value.contains("pen") || value.contains("VER") || value.contains("Ver") || value.contains("ver")){
      await fetchHistoryPurchaseRequest(statusHistory: value);
    }
    else{
      await fetchHistoryPurchaseRequest(keperluan: value);
    }
    dataHistoryPurchaseRequest.value = dataListHistory;
    dataLoading.value = loadingData;
  }

  scrollDataHistoryPurchaseRequest(){
    scrollController.addListener(() async {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        if(scrollLoading.value != true){
          loading = true;
          scrollLoading.value = loading;
          await fetchHistoryPurchaseRequest();
          loading = false;
        }
        dataHistoryPurchaseRequest.value = dataListHistory;
        dataHistoryPurchaseRequest.refresh();
        scrollLoading.value = loading;
      }
    });
  }
}