import 'dart:convert';

import 'package:mgp_mobile_app/model/hrdu/rab/history_rab_model.dart';
import 'package:mgp_mobile_app/model/hrdu/rab/rab_model.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu/mgp_api_hrdu.dart';
import 'package:shared_preferences/shared_preferences.dart';

mixin RABClass{
  late String? tokens;
  late List<dynamic> dataList = [];
  late int pages = 1;

  Future<List<dynamic>> fetchApprovalRAB({required int page}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokens = prefs.getString("token")!;
    int? perPage = 10;
    Map<String, String>? queryParams = {
      'page' : page.toString(),
      'per_page' : perPage.toString(),
    };
    String? queryString = Uri(queryParameters: queryParams).query;
    var requestUrl = MGPAPI.baseURL + '/approval_rab/list/?' + queryString;
    final response =
      await MGPAPI.client.get(Uri.parse(requestUrl),
      headers: {
        'Authorization': 'Bearer $tokens',
      }
    );
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      Regrab rabData = Regrab.fromJson(parsed);
      dataList.addAll(rabData.data);
      pages++;
      return dataList;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<int> fetchApprovalCountRAB({required int page}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokens = prefs.getString("token")!;
    int? perPage = 10;
    Map<String, String>? queryParams = {
      'page' : page.toString(),
      'per_page' : perPage.toString(),
    };
    String? queryString = Uri(queryParameters: queryParams).query;
    var requestUrl = MGPAPI.baseURL + '/approval_rab/list/?' + queryString;
    final response =
      await MGPAPI.client.get(Uri.parse(requestUrl),
      headers: {
        'Authorization': 'Bearer $tokens',
      }
    );
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      Regrab rabData = Regrab.fromJson(parsed);
      return rabData.dataCount!.toInt();
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<dynamic>> fetchHistoryRAB({required int page}) async {
    await Future.delayed(const Duration(milliseconds: 500));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokens = prefs.getString("token")!;
    int? perPage = 10;
    Map<String, String>? queryParams = {
      'page' : page.toString(),
      'per_page' : perPage.toString(),
    };
    String? queryString = Uri(queryParameters: queryParams).query;
    var requestUrl = MGPAPI.baseURL + '/approval_rab/history/?' + queryString;
    final response =
      await MGPAPI.client.get(Uri.parse(requestUrl),
      headers: {
        'Authorization': 'Bearer $tokens',
      }
    );
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      HistoryRegrab rabData = HistoryRegrab.fromJson(parsed);
      dataList.addAll(rabData.data);
      pages++;
      return dataList;
    } else {
      throw Exception('Failed to load data');
    }
  }
}