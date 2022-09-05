import 'dart:convert';

import 'package:mgp_mobile_app/model/hrdu/sales_order_spk/history_sales_order_spk_model.dart';
import 'package:mgp_mobile_app/model/hrdu/sales_order_spk/sales_order_spk_model.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu/mgp_api_hrdu.dart';
import 'package:shared_preferences/shared_preferences.dart';

mixin SalesOrderSPKClass{
  late String? tokens;
  late List<dynamic> dataList = [];
  late int pages = 1;

  Future<List<dynamic>> fetchApprovalSalesOrderSPK({required int page}) async {
    await Future.delayed(const Duration(milliseconds: 500));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokens = prefs.getString("token")!;
    int? perPage = 10;
    Map<String, String>? queryParams = {
      'page' : page.toString(),
      'per_page' : perPage.toString(),
    };
    String? queryString = Uri(queryParameters: queryParams).query;
    var requestUrl = MGPAPI.baseURL + '/approval_sales_order_spk/list/?' + queryString;
    final response =
      await MGPAPI.client.get(Uri.parse(requestUrl),
      headers: {
        'Authorization': 'Bearer $tokens',
      }
    );

    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      Regsospk salesOrderSPKData = Regsospk.fromJson(parsed);
      dataList.addAll(salesOrderSPKData.data);
      pages++;
      return dataList;
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<int> fetchApprovalCountSalesOrderSPK({required int page}) async {
    await Future.delayed(const Duration(milliseconds: 500));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokens = prefs.getString("token")!;
    int? perPage = 10;
    Map<String, String>? queryParams = {
      'page' : page.toString(),
      'per_page' : perPage.toString(),
    };
    String? queryString = Uri(queryParameters: queryParams).query;
    var requestUrl = MGPAPI.baseURL + '/approval_sales_order_spk/list/?' + queryString;
    final response =
      await MGPAPI.client.get(Uri.parse(requestUrl),
      headers: {
        'Authorization': 'Bearer $tokens',
      }
    );

    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      Regsospk salesOrderSPKData = Regsospk.fromJson(parsed);
      return salesOrderSPKData.dataCount!.toInt();
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<List<dynamic>> fetchHistorySalesOrderSPK({required int page}) async {
    await Future.delayed(const Duration(milliseconds: 500));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokens = prefs.getString("token")!;
    int? perPage = 10;
    Map<String, String>? queryParams = {
      'page' : page.toString(),
      'per_page' : perPage.toString(),
    };
    String? queryString = Uri(queryParameters: queryParams).query;
    var requestUrl = MGPAPI.baseURL + '/approval_sales_order_spk/history/?' + queryString;
    final response =
      await MGPAPI.client.get(Uri.parse(requestUrl),
      headers: {
        'Authorization': 'Bearer $tokens',
      }
    );

    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      HistoryRegsospk salesOrderSPKData = HistoryRegsospk.fromJson(parsed);
      dataList.addAll(salesOrderSPKData.data);
      pages++;
      return dataList;
    } else {
      throw Exception('Failed to load album');
    }
  }
}