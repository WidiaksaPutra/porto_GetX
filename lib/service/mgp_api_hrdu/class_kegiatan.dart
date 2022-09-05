
import 'dart:convert';

import 'package:mgp_mobile_app/model/hrdu/kegiatan/history_kegiatan_model.dart';
import 'package:mgp_mobile_app/model/hrdu/kegiatan/kegiatan_model.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu/mgp_api_hrdu.dart';
import 'package:shared_preferences/shared_preferences.dart';

mixin KegiatanClass{
  late String? tokens;
  late List<dynamic> dataList = [];
  late int pages = 1;
  
  Future<List<dynamic>> fetchApprovalKegiatan({required int page}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokens = prefs.getString("token")!;
    int? perPage = 10;
    Map<String, String>? queryParams = {
      'page' : page.toString(),
      'per_page' : perPage.toString(),
    };
    String? queryString = Uri(queryParameters: queryParams).query;
    var requestUrl = MGPAPI.baseURL + '/approval_kegiatan/list/?' + queryString;
    final response =
      await MGPAPI.client.get(Uri.parse(requestUrl),
      headers: {
        'Authorization': 'Bearer $tokens',
      }
    ).timeout(const Duration(seconds: 10));
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      Rk kegiatanData = Rk.fromJson(parsed);
      dataList.addAll(kegiatanData.data);
      pages++;
      return dataList;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<int> fetchApprovalCountKegiatan({required int page}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokens = prefs.getString("token")!;
    int? perPage = 10;
    Map<String, String>? queryParams = {
      'page' : page.toString(),
      'per_page' : perPage.toString(),
    };
    String? queryString = Uri(queryParameters: queryParams).query;
    var requestUrl = MGPAPI.baseURL + '/approval_kegiatan/list/?' + queryString;
    final response =
      await MGPAPI.client.get(Uri.parse(requestUrl),
      headers: {
        'Authorization': 'Bearer $tokens',
      }
    ).timeout(const Duration(seconds: 10));
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      Rk kegiatanData = Rk.fromJson(parsed);
      return kegiatanData.dataCount!.toInt();
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<dynamic>> fetchHistoryKegiatan({required int page}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokens = prefs.getString("token")!;
    int? perPage = 10;
    Map<String, String>? queryParams = {
      'page' : page.toString(),
      'per_page' : perPage.toString(),
    };
    String? queryString = Uri(queryParameters: queryParams).query;
    var requestUrl = MGPAPI.baseURL + '/approval_kegiatan/history/?' + queryString;
    final response =
      await MGPAPI.client.get(Uri.parse(requestUrl),
      headers: {
        'Authorization': 'Bearer $tokens',
      }
    ).timeout(const Duration(seconds: 10));
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      HistoryRk kegiatanData = HistoryRk.fromJson(parsed);
      dataList.addAll(kegiatanData.data);
      pages++;
      return dataList;
    } else {
      throw Exception('Failed to load data');
    }
  }
}