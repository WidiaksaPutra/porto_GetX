import 'dart:convert';

import 'package:mgp_mobile_app/controller_getX/default/default_searching_manual.dart';
import 'package:mgp_mobile_app/model/hrdu/purchase_order/purchase_order_model.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu/mgp_api_hrdu.dart';
import 'package:shared_preferences/shared_preferences.dart';

mixin PurchaseOrderApprovalClass{
  late String? tokens;
  late List dataListApproval = [];
  late int totalDataListApproval = 0;
  late int pages = 1;
  late bool loadingData = false;
  late bool loadingTotalData = false;
  late bool loading = false;

   Future<List<dynamic>> fetchApprovalPurchaseOrder({noPurchaseOrder, namaVendor, statusApproval}) async {
    try {
      if(loading == true || dataListApproval.isEmpty){
        await Future.delayed(const Duration(milliseconds: 500));
        SharedPreferences prefs = await SharedPreferences.getInstance();
        tokens = prefs.getString("token")!;
        int? perPage = 10;
        Map<String, String>? queryParams;
        if(noPurchaseOrder != null){
          queryParams = searchData3Atribut(pages: pages, perPage: perPage, keyData1: 'no_purchase_order', data1: noPurchaseOrder);
        }
        else if(namaVendor != null){
          queryParams = searchData3Atribut(pages: pages, perPage: perPage, keyData1: 'nama_vendor', data1: namaVendor);
        }
        else if(statusApproval != null){
          if(statusApproval.contains("Ver") || statusApproval.contains("ver") || statusApproval.contains("VER")){
            statusApproval = "VER";
            queryParams = searchData3Atribut(pages: pages, perPage: perPage, keyData1: 'status_approval', data1: statusApproval);
          }else if(statusApproval.contains("Pen") || statusApproval.contains("pen") || statusApproval.contains("PEN")){
            statusApproval = "PEN";
            queryParams = searchData3Atribut(pages: pages, perPage: perPage, keyData1: 'status_approval', data1: statusApproval);
          }
        }else{
          queryParams = searchDataBasic(pages: pages, perPage: perPage);
        }
        String? queryString = Uri(queryParameters: queryParams).query;
        var requestUrl = MGPAPI.baseUrlHrdu + '/approval_purchase_order/list/?' + queryString;
        final response =
          await MGPAPI.client.get(Uri.parse(requestUrl),
          headers: {
            'Authorization': 'Bearer $tokens',
          }
        );
        if (response.statusCode == 200) {
          final parsed = json.decode(response.body);
          Regpo seleksiPurchaseOrder = Regpo.fromJson(parsed);
          if(seleksiPurchaseOrder.dataCount!.toInt() != dataListApproval.length){
            dataListApproval.addAll(seleksiPurchaseOrder.data);
            pages++;
          }
          loadingData = true;
        } else {
          throw Exception('Failed to load data');
        }
      }
      return dataListApproval;
    } catch (e) {
      throw Exception('data error');
    }
  }

  Future<int> fetchApprovalCountPurchaseOrder() async {
    await Future.delayed(const Duration(milliseconds: 500));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokens = prefs.getString("token")!;
    int? perPage = 10;
    Map<String, String>? queryParams = {
      'page' : '1',
      'per_page' : perPage.toString(),
    };
    String? queryString = Uri(queryParameters: queryParams).query;
    var requestUrl = MGPAPI.baseUrlHrdu + '/approval_purchase_order/list/?' + queryString;
    final response = await MGPAPI.client.get(Uri.parse(requestUrl),
      headers: {
        'Authorization': 'Bearer $tokens',
      }
    );
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      Regpo purchaseOrderData = Regpo.fromJson(parsed);
      loadingTotalData = true;
      return totalDataListApproval = purchaseOrderData.dataCount!.toInt();
    } else {
      throw Exception('Failed to load data');
    }
  }

  // late String? tokens;
  // late List<dynamic> dataList = [];
  // late int pages = 1;
  // late bool loadingData = false;

  // Future<List<dynamic>> fetchApprovalPurchaseOrder({required int page, noPurchaseOrder, namaVendor, statusApproval}) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   tokens = prefs.getString("token")!;
  //   int? perPage = 10;
  //   Map<String, String>? queryParams;
  //   if(noPurchaseOrder == null && namaVendor == null && statusApproval == null || namaVendor == "null"){
  //     queryParams = {
  //       'page' : page.toString(),
  //       'per_page' : perPage.toString(),
  //     };
  //   }
  //   if(noPurchaseOrder != null){
  //      queryParams = {
  //       'page' : page.toString(),
  //       'per_page' : perPage.toString(),
  //       'no_purchase_order' : noPurchaseOrder.toString()
  //     };
  //   }
  //   if(namaVendor != null){
  //     queryParams = {
  //       'page' : page.toString(),
  //       'per_page' : perPage.toString(),
  //       'nama_vendor' : namaVendor.toString()
  //     };
  //   }
  //   if(statusApproval != null){
  //     if(statusApproval == "VERIFIED" || statusApproval == "Verified" || statusApproval == "verified" || statusApproval == "Ver" || statusApproval == "ver"){
  //       statusApproval = "VER";
  //     }else if(statusApproval == "PENDING" || statusApproval == "Pending" || statusApproval == "pending" || statusApproval == "Pen" || statusApproval == "pen"){
  //       statusApproval = "PEN";
  //     }
  //     queryParams = {
  //       'page' : page.toString(),
  //       'per_page' : perPage.toString(),
  //       'status_approval' : statusApproval.toString()
  //     };
  //   }
  //   String? queryString = Uri(queryParameters: queryParams).query;
  //   var requestUrl = MGPAPI.baseUrlHrdu + '/approval_purchase_order/list/?' + queryString;
  //   final response =
  //     await MGPAPI.client.get(Uri.parse(requestUrl),
  //     headers: {
  //       'Authorization': 'Bearer $tokens',
  //     }
  //   );
  //   if (response.statusCode == 200) {
  //     final parsed = json.decode(response.body);
  //     Regpo purchaseOrderData = Regpo.fromJson(parsed);
  //     dataList.addAll(purchaseOrderData.data);
  //     pages++;
  //     loadingData = true;
  //     return dataList;
  //   } else {
  //     throw Exception('Failed to load data');
  //   }
  // }

  // Future<int> fetchApprovalCountPurchaseOrder({required int page}) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   tokens = prefs.getString("token")!;
  //   int? perPage = 10;
  //   Map<String, String>? queryParams = {
  //     'page' : page.toString(),
  //     'per_page' : perPage.toString(),
  //   };
  //   String? queryString = Uri(queryParameters: queryParams).query;
  //   var requestUrl = MGPAPI.baseUrlHrdu + '' + queryString;
  //   final response =
  //     await MGPAPI.client.get(Uri.parse(requestUrl),
  //     headers: {
  //       'Authorization': 'Bearer $tokens',
  //     }
  //   );
  //   if (response.statusCode == 200) {
  //     final parsed = json.decode(response.body);
  //     Regpo purchaseOrderData = Regpo.fromJson(parsed);
  //     return purchaseOrderData.dataCount!.toInt();
  //   } else {
  //     throw Exception('Failed to load data');
  //   }
  // }
}