import 'dart:convert';

import 'package:mgp_mobile_app/model/hrdu/surat_jalan/history_surat_jalan_model.dart';
import 'package:mgp_mobile_app/model/hrdu/surat_jalan/surat_jalan_model.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu/mgp_api_hrdu.dart';
import 'package:shared_preferences/shared_preferences.dart';

mixin SuratJalanClass{
  late String? tokens;
  late List<dynamic> dataList = [];
  late int pages = 1; 

  Future<List<dynamic>> fetchApprovalSuratJalan({required int page}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokens = prefs.getString("token")!;
    int? perPage = 10;
    Map<String, String>? queryParams = {
      'page' : page.toString(),
      'per_page' : perPage.toString(),
    };
    String? queryString = Uri(queryParameters: queryParams).query;
    var requestUrl = MGPAPI.baseURL + '/approval_surat_jalan/list/?' + queryString;
    final response =
      await MGPAPI.client.get(Uri.parse(requestUrl),
      headers: {
        'Authorization': 'Bearer $tokens',
      }
    );
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      Regsj suratJalanData = Regsj.fromJson(parsed);
      dataList.addAll(suratJalanData.data);
      pages++;
      return dataList;
    } else {
      throw Exception('Failed to load data');
    }
  }
  
  Future<int> fetchApprovalCountSuratJalan({required int page}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokens = prefs.getString("token")!;
    int? perPage = 10;
    Map<String, String>? queryParams = {
      'page' : page.toString(),
      'per_page' : perPage.toString(),
    };
    String? queryString = Uri(queryParameters: queryParams).query;
    var requestUrl = MGPAPI.baseURL + '/approval_surat_jalan/list/?' + queryString;
    final response =
      await MGPAPI.client.get(Uri.parse(requestUrl),
      headers: {
        'Authorization': 'Bearer $tokens',
      }
    );
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      Regsj suratJalanData = Regsj.fromJson(parsed);
      return suratJalanData.dataCount!.toInt();
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<dynamic>> fetchHistorySuratJalan({required int page}) async {
    await Future.delayed(const Duration(milliseconds: 500));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokens = prefs.getString("token")!;
    int? perPage = 10;
    Map<String, String>? queryParams = {
      'page' : page.toString(),
      'per_page' : perPage.toString(),
    };
    String? queryString = Uri(queryParameters: queryParams).query;
    var requestUrl = MGPAPI.baseURL + '/approval_surat_jalan/history/?' + queryString;
    final response =
      await MGPAPI.client.get(Uri.parse(requestUrl),
      headers: {
        'Authorization': 'Bearer $tokens',
      }
    );
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      HistoryRegsj suratJalanData = HistoryRegsj.fromJson(parsed);
      dataList.addAll(suratJalanData.data);
      pages++;
      return dataList;
    } else {
      throw Exception('Failed to load data');
    }
  }
}