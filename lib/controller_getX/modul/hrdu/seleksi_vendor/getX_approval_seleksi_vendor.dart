import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu/api_seleksi_vendor/api_approval_seleksi_vendor.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu/api_seleksi_vendor/api_detail_seleksi_vendor.dart';

class GetxApprovalSeleksiVendor extends GetxController with SeleksiVendorApprovalClass, SeleksiVendorDetail{
  late var dataApprovalSeleksiVendor = [].obs;
  late var dataLoading = false.obs;
  late var scrollLoading = false.obs;
  late var dataTotalSv = 0.obs;
  late var loadingTotalDataSv = false.obs;
  late var totalDataListApprovalSv = 0.obs;
  late var hargaSatuan = 0.0.obs;
  late var totalHarga = 0.0.obs;
  late ScrollController scrollController = ScrollController();

  fetchCountApprovalSeleksiVendor() async{
    await fetchApprovalCountSeleksiVendor();
    loadingTotalDataSv.value = loadingTotalData;
    totalDataListApprovalSv.value = totalDataListApproval;
  }

  fetchDataApprovalSeleksiVendor() async{
    await initializeDateFormatting();
    await refreshApprovalSeleksiVendor();
    await scrollDataApprovalSeleksiVendor();
  }

  totalListApprovalSeleksiVendor() async{
    await fetchApprovalCountSeleksiVendor();
    dataTotalSv.value = totalDataListApproval;
  }

  Future refreshApprovalSeleksiVendor() async{
    dataListApproval.clear();
    dataApprovalSeleksiVendor.clear();
    dataApprovalSeleksiVendor.value = dataListApproval;
    loading = false;
    scrollLoading.value = loading;
    loadingData = false;
    dataLoading.value = loadingData;
    pages = 1;
    await fetchApprovalSeleksiVendor();
    dataApprovalSeleksiVendor.value = dataListApproval;
    dataLoading.value = loadingData;
  }

  searchApproval(dynamic value) async{
    dataListApproval.clear();
    dataApprovalSeleksiVendor.clear();
    dataApprovalSeleksiVendor.value = dataListApproval;
    loading = false;
    scrollLoading.value = loading;
    loadingData = false;
    dataLoading.value = loadingData;
    pages = 1;
    if(value.contains("/")){
      await fetchApprovalSeleksiVendor(noSeleksiVendor: value);
    }
    else if(value.contains("PEN") || value.contains("Pen") || value.contains("pen") || value.contains("VER") || value.contains("Ver") || value.contains("ver")){
      await fetchApprovalSeleksiVendor(statusApproval: value);
    }
    else{
      await fetchApprovalSeleksiVendor(keperluan: value);
    }
    dataApprovalSeleksiVendor.value = dataListApproval;
    // dataApprovalSeleksiVendorTotal();
    dataLoading.value = loadingData;
  }

  scrollDataApprovalSeleksiVendor(){
    scrollController.addListener(() async {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        if(scrollLoading.value != true){
          loading = true;
          scrollLoading.value = loading;
          await fetchApprovalSeleksiVendor();
          loading = false;
        }
        dataApprovalSeleksiVendor.value = dataListApproval;
        dataApprovalSeleksiVendor.refresh();
        dataApprovalSeleksiVendorTotal();
        scrollLoading.value = loading;
      }
    });
  }

  // num hargaSatuan = ;
  //                   num totalHarga = (double.parse() * ;

  dataApprovalSeleksiVendorTotal(){
    if(dataApprovalSeleksiVendor.isNotEmpty){
      print(dataApprovalSeleksiVendor);
      for(int dataIndex = 0; dataIndex < dataApprovalSeleksiVendor.length; dataIndex++){
        hargaSatuan.value = double.parse(dataApprovalSeleksiVendor[dataIndex].hargaKesepakatan.toString());
        totalHarga.value = double.parse(hargaSatuan.value.toString()) * double.parse(dataApprovalSeleksiVendor[dataIndex].qtyOrder.toString());
      }
      print(hargaSatuan.value);
      print(totalHarga.value);
    }
  }
}