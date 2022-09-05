import 'dart:convert';

import 'package:mgp_mobile_app/model/hrdu/penerimaan_barang/history_penerimaan_barang_model.dart';
import 'package:mgp_mobile_app/model/hrdu/penerimaan_barang/penerimaan_barang_model.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu/mgp_api_hrdu.dart';
import 'package:shared_preferences/shared_preferences.dart';

mixin PenerimaanBarangClass{
  late String? tokens;
  late List<dynamic> dataList = [];
  late int pages = 1;

  Future<List<dynamic>> fetchApprovalPenerimaanBarang({required int page}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokens = prefs.getString("token")!;
    int? perPage = 10;
    Map<String, String>? queryParams = {
      'page' : page.toString(),
      'per_page' : perPage.toString(),
    };
    String? queryString = Uri(queryParameters: queryParams).query;
    var requestUrl = MGPAPI.baseURL + '/approval_penerimaan_barang/list/?' + queryString;
    final response =
      await MGPAPI.client.get(Uri.parse(requestUrl),
      headers: {
        'Authorization': 'Bearer $tokens',
      }
    );
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      Penpo penerimaanBarangData = Penpo.fromJson(parsed);
      dataList.addAll(penerimaanBarangData.data);
      pages++;
      return dataList;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<int> fetchApprovalCountPenerimaanBarang({required int page}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokens = prefs.getString("token")!;
    int? perPage = 10;
    Map<String, String>? queryParams = {
      'page' : page.toString(),
      'per_page' : perPage.toString(),
    };
    String? queryString = Uri(queryParameters: queryParams).query;
    var requestUrl = MGPAPI.baseURL + '/approval_penerimaan_barang/list/?' + queryString;
    final response =
      await MGPAPI.client.get(Uri.parse(requestUrl),
      headers: {
        'Authorization': 'Bearer $tokens',
      }
    );
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      Penpo penerimaanBarangData = Penpo.fromJson(parsed);
      return penerimaanBarangData.dataCount!.toInt();
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<dynamic>> fetchHistoryPenerimaanBarang({required int page}) async {
    await Future.delayed(const Duration(milliseconds: 500));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokens = prefs.getString("token")!;
    int? perPage = 10;
    Map<String, String>? queryParams = {
      'page' : page.toString(),
      'per_page' : perPage.toString(),
    };
    String? queryString = Uri(queryParameters: queryParams).query;
    var requestUrl = MGPAPI.baseURL + '/approval_penerimaan_barang/history/?' + queryString;
    final response =
      await MGPAPI.client.get(Uri.parse(requestUrl),
      headers: {
        'Authorization': 'Bearer $tokens',
      }
    );
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      HistoryPenpo penerimaanBarangData = HistoryPenpo.fromJson(parsed);
      dataList.addAll(penerimaanBarangData.data);
      pages++;
      return dataList;
    } else {
      throw Exception('Failed to load data');
    }
  }
}