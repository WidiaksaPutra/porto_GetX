import 'dart:convert';

import 'package:mgp_mobile_app/controller_getX/default/default_searching_manual.dart';
import 'package:mgp_mobile_app/model/hrdu/purchase_order/history_purchase_order_model.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu/mgp_api_hrdu.dart';
import 'package:shared_preferences/shared_preferences.dart';

mixin PurchaseOrderHistoryClass{
  late String? tokens;
  late List<dynamic> dataListHistory = [];
  late int pages = 1;
  late bool loadingData = false;
  late bool loading = false;

  Future<List<dynamic>> fetchHistoryPurchaseOrder({noPurchaseOrder, namaVendor, statusHistory}) async{
    try {
      if(loading == true || dataListHistory.isEmpty){
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
        else if(statusHistory != null){
          if(statusHistory.contains("Ver") || statusHistory.contains("ver") || statusHistory.contains("VER")){
            statusHistory = "VER";
            queryParams = searchData3Atribut(pages: pages, perPage: perPage, keyData1: 'status_approval', data1: statusHistory);
          }else if(statusHistory.contains("Pen") || statusHistory.contains("pen") || statusHistory.contains("PEN")){
            statusHistory = "PEN";
            queryParams = searchData3Atribut(pages: pages, perPage: perPage, keyData1: 'status_approval', data1: statusHistory);
          }
        }else{
          queryParams = searchDataBasic(pages: pages, perPage: perPage);
        }
        String? queryString = Uri(queryParameters: queryParams).query;
        var requestUrl = MGPAPI.baseUrlHrdu + '/approval_purchase_request/history/?' + queryString;
        final response = await MGPAPI.client.get(Uri.parse(requestUrl),
          headers: {
            'Authorization': 'Bearer $tokens',
          }
        );
        if (response.statusCode == 200) {
          final parsed = json.decode(response.body);
          HistoryRegpo purchaseOrderData = HistoryRegpo.fromJson(parsed);
          if(purchaseOrderData.dataCount!.toInt() != dataListHistory.length){
            dataListHistory.addAll(purchaseOrderData.data);
            pages++;
          }
          loadingData = true;
        }
      }
      return dataListHistory;
    } catch (e) {
      throw Exception('data error');
    }
  }
}