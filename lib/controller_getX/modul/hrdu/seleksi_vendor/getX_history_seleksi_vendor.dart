import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu/api_seleksi_vendor/api_history_seleksi_vendor.dart';

class GetxHistorySeleksiVendor extends GetxController with SeleksiVendorHistoryClass{
  late var dataHistorySeleksiVendor = [].obs;
  late var dataLoading = false.obs;
  late var scrollLoading = false.obs;
  late ScrollController scrollController = ScrollController();

  fetchDataHistorySeleksiVendor() async{
    initializeDateFormatting();
    refreshHistorySeleksiVendor();
    await scrollDataHistorySeleksiVendor();
  }

  Future refreshHistorySeleksiVendor() async{
    dataListHistory.clear();
    dataHistorySeleksiVendor.clear();
    dataHistorySeleksiVendor.value = dataListHistory;
    loading = false;
    scrollLoading.value = loading;
    loadingData = false;
    dataLoading.value = loadingData;
    pages = 1;
    await fetchHistorySeleksiVendor();
    dataHistorySeleksiVendor.value = dataListHistory;
    dataLoading.value = loadingData;
  }

  searchHistory(dynamic value) async{
    dataListHistory.clear();
    dataHistorySeleksiVendor.clear();
    dataHistorySeleksiVendor.value = dataListHistory;
    loading = false;
    scrollLoading.value = loading;
    loadingData = false;
    dataLoading.value = loadingData;
    pages = 1;
    if(value.contains("/")){
      await fetchHistorySeleksiVendor(noSeleksiVendor: value);
    }
    else if(value.contains("PEN") || value.contains("Pen") || value.contains("pen") || value.contains("VER") || value.contains("Ver") || value.contains("ver")){
      await fetchHistorySeleksiVendor(statusHistory: value);
    }
    else{
      await fetchHistorySeleksiVendor(keperluan: value);
    }
    dataHistorySeleksiVendor.value = dataListHistory;
    dataLoading.value = loadingData;
  }

  scrollDataHistorySeleksiVendor(){
    scrollController.addListener(() async {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        if(scrollLoading.value != true){
          loading = true;
          scrollLoading.value = loading;
          await fetchHistorySeleksiVendor();
          loading = false;
        }
        dataHistorySeleksiVendor.value = dataListHistory;
        dataHistorySeleksiVendor.refresh();
        scrollLoading.value = loading;
      }
    });
  }
}