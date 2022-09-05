import 'dart:convert';

import 'package:mgp_mobile_app/model/hrdu/penawaran/history_penawaran_model.dart';
import 'package:mgp_mobile_app/model/hrdu/penawaran/penawaran_model.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu/mgp_api_hrdu.dart';
import 'package:shared_preferences/shared_preferences.dart';

mixin PenawaranClass{
  late String? tokens;
  late List<dynamic> dataList = [];
  late int pages = 1;

  Future<List<dynamic>> fetchApprovalPenawaran({required int page}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokens = prefs.getString("token")!;
    int? perPage = 10;
    Map<String, String>? queryParams = {
      'page' : page.toString(),
      'per_page' : perPage.toString(),
    };
    String? queryString = Uri(queryParameters: queryParams).query;
    var requestUrl = MGPAPI.baseURL + '/approval_penawaran/list/?' + queryString;
    final response =
      await MGPAPI.client.get(Uri.parse(requestUrl),
      headers: {
        'Authorization': 'Bearer $tokens',
      }
    );
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      Regpnw penawaranData = Regpnw.fromJson(parsed);
      dataList.addAll(penawaranData.data);
      pages++;
      return dataList;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<int> fetchApprovalCountPenawaran({required int page}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokens = prefs.getString("token")!;
    int? perPage = 10;
    Map<String, String>? queryParams = {
      'page' : page.toString(),
      'per_page' : perPage.toString(),
    };
    String? queryString = Uri(queryParameters: queryParams).query;
    var requestUrl = MGPAPI.baseURL + '/approval_penawaran/list/?' + queryString;
    final response =
      await MGPAPI.client.get(Uri.parse(requestUrl),
      headers: {
        'Authorization': 'Bearer $tokens',
      }
    );
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      Regpnw penawaranData = Regpnw.fromJson(parsed);
      return penawaranData.dataCount!.toInt();
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<dynamic>> fetchHistoryPenawaran({required int page}) async {
    await Future.delayed(const Duration(milliseconds: 500));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokens = prefs.getString("token")!;
    int? perPage = 10;
    Map<String, String>? queryParams = {
      'page' : page.toString(),
      'per_page' : perPage.toString(),
    };
    String? queryString = Uri(queryParameters: queryParams).query;
    var requestUrl = MGPAPI.baseURL + '/approval_penawaran/history/?' + queryString;
    final response =
      await MGPAPI.client.get(Uri.parse(requestUrl),
      headers: {
        'Authorization': 'Bearer $tokens',
      }
    );
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      HistoryRegpnw penawaranData = HistoryRegpnw.fromJson(parsed);
      dataList.addAll(penawaranData.data);
      pages++;
      return dataList;
    } else {
      throw Exception('Failed to load data');
    }
  }
}