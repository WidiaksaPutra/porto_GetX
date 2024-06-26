import 'dart:convert';

import 'package:mgp_mobile_app/model/hrdu/sales_order/history_sales_order_model.dart';
import 'package:mgp_mobile_app/model/hrdu/sales_order/sales_order_model.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu/mgp_api_hrdu.dart';
import 'package:shared_preferences/shared_preferences.dart';

mixin SalesOrderClass{
  late String? tokens;
  late List<dynamic> dataList = [];
  late int pages = 1;

  Future<List<dynamic>> fetchApprovalSalesOrder({required int page}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokens = prefs.getString("token")!;
    int? perPage = 10;
    Map<String, String>? queryParams = {
      'page' : page.toString(),
      'per_page' : perPage.toString(),
    };
    String? queryString = Uri(queryParameters: queryParams).query;
    var requestUrl = MGPAPI.baseUrlHrdu + '/approval_sales_order/list/?' + queryString;
    final response =
      await MGPAPI.client.get(Uri.parse(requestUrl),
      headers: {
        'Authorization': 'Bearer $tokens',
      }
    );

    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      Regso salesOrderData = Regso.fromJson(parsed);
      dataList.addAll(salesOrderData.data);
      pages++;
      return dataList;
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<int> fetchApprovalCountSalesOrder({required int page}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokens = prefs.getString("token")!;
    int? perPage = 10;
    Map<String, String>? queryParams = {
      'page' : page.toString(),
      'per_page' : perPage.toString(),
    };
    String? queryString = Uri(queryParameters: queryParams).query;
    var requestUrl = MGPAPI.baseUrlHrdu + '/approval_sales_order/list/?' + queryString;
    final response =
      await MGPAPI.client.get(Uri.parse(requestUrl),
      headers: {
        'Authorization': 'Bearer $tokens',
      }
    );

    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      Regso salesOrderData = Regso.fromJson(parsed);
      return salesOrderData.dataCount!.toInt();
    } else {
      throw Exception('Failed to load album');
    }
  }
  
  Future<List<dynamic>> fetchHistorySalesOrder({required int page}) async {
    await Future.delayed(const Duration(milliseconds: 500));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokens = prefs.getString("token")!;
    int? perPage = 10;
    Map<String, String>? queryParams = {
      'page' : page.toString(),
      'per_page' : perPage.toString(),
    };
    String? queryString = Uri(queryParameters: queryParams).query;
    var requestUrl = MGPAPI.baseUrlHrdu + '/approval_sales_order/history/?' + queryString;
    final response =
      await MGPAPI.client.get(Uri.parse(requestUrl),
      headers: {
        'Authorization': 'Bearer $tokens',
      }
    ).timeout(const Duration(seconds: 10));
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      HistoryRegso historySalesOrderData = HistoryRegso.fromJson(parsed);
      dataList.addAll(historySalesOrderData.data);
      pages++;
      return dataList;
    } else {
      throw Exception('Failed to load data');
    }
  }
}