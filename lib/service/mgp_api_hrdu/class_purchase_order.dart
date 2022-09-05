import 'dart:convert';

import 'package:mgp_mobile_app/model/hrdu/purchase_order/history_purchase_order_model.dart';
import 'package:mgp_mobile_app/model/hrdu/purchase_order/purchase_order_model.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu/mgp_api_hrdu.dart';
import 'package:shared_preferences/shared_preferences.dart';

mixin PurchaseOrderClass{
  late String? tokens;
  late List<dynamic> dataList = [];
  late int pages = 1;

  Future<List<dynamic>> fetchApprovalPurchaseOrder({required int page}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokens = prefs.getString("token")!;
    int? perPage = 10;
    Map<String, String>? queryParams = {
      'page' : page.toString(),
      'per_page' : perPage.toString(),
    };
    String? queryString = Uri(queryParameters: queryParams).query;
    var requestUrl = MGPAPI.baseURL + '/approval_purchase_order/list/?' + queryString;
    final response =
      await MGPAPI.client.get(Uri.parse(requestUrl),
      headers: {
        'Authorization': 'Bearer $tokens',
      }
    );
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      Regpo purchaseOrderData = Regpo.fromJson(parsed);
      dataList.addAll(purchaseOrderData.data);
      pages++;
      return dataList;
    } else {
      throw Exception('Failed to load data');
    }
  }
  
  Future<int> fetchApprovalCountPurchaseOrder({required int page}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokens = prefs.getString("token")!;
    int? perPage = 10;
    Map<String, String>? queryParams = {
      'page' : page.toString(),
      'per_page' : perPage.toString(),
    };
    String? queryString = Uri(queryParameters: queryParams).query;
    var requestUrl = MGPAPI.baseURL + '/approval_purchase_order/list/?' + queryString;
    final response =
      await MGPAPI.client.get(Uri.parse(requestUrl),
      headers: {
        'Authorization': 'Bearer $tokens',
      }
    );
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      Regpo purchaseOrderData = Regpo.fromJson(parsed);
      return purchaseOrderData.dataCount!.toInt();
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<dynamic>> fetchHistoryPurchaseOrder({required int page}) async {
    await Future.delayed(const Duration(milliseconds: 500));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokens = prefs.getString("token")!;
    int? perPage = 10;
    Map<String, String>? queryParams = {
      'page' : page.toString(),
      'per_page' : perPage.toString(),
    };
    String? queryString = Uri(queryParameters: queryParams).query;
    var requestUrl = MGPAPI.baseURL + '/approval_purchase_order/history/?' + queryString;
    final response =
      await MGPAPI.client.get(Uri.parse(requestUrl),
      headers: {
        'Authorization': 'Bearer $tokens',
      }
    );
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      HistoryRegpo purchaseOrderData = HistoryRegpo.fromJson(parsed);
      dataList.addAll(purchaseOrderData.data);
      pages++;
      return dataList;
    } else {
      throw Exception('Failed to load data');
    }
  }  
}