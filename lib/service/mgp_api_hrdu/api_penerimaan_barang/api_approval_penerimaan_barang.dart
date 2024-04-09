import 'dart:convert';

import 'package:mgp_mobile_app/model/hrdu/penerimaan_barang/penerimaan_barang_model.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu/mgp_api_hrdu.dart';
import 'package:shared_preferences/shared_preferences.dart';

mixin PenerimaanBarangApprovalClass{
  late String? tokens;
  late List<dynamic> dataList = [];
  late int pages = 1;
  late bool loadingData = false;

  Future<List<dynamic>> fetchApprovalPenerimaanBarang({required int page, noPenerimaanBarang, namaVendor, statusApproval}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokens = prefs.getString("token")!;
    int? perPage = 10;
    Map<String, String>? queryParams;
    if(noPenerimaanBarang == null && namaVendor == null && statusApproval == null || namaVendor == "null"){
      queryParams = {
        'page' : page.toString(),
        'per_page' : perPage.toString(),
      };
    }
    if(noPenerimaanBarang != null){
       queryParams = {
        'page' : page.toString(),
        'per_page' : perPage.toString(),
        'no_penerimaan_barang' : noPenerimaanBarang.toString()
      };
    }
    if(namaVendor != null){
      queryParams = {
        'page' : page.toString(),
        'per_page' : perPage.toString(),
        'nama_vendor' : namaVendor.toString()
      };
    }
    if(statusApproval != null){
      if(statusApproval == "VERIFIED" || statusApproval == "Verified" || statusApproval == "verified" || statusApproval == "Ver" || statusApproval == "ver"){
        statusApproval = "VER";
      }else if(statusApproval == "PENDING" || statusApproval == "Pending" || statusApproval == "pending" || statusApproval == "Pen" || statusApproval == "pen"){
        statusApproval = "PEN";
      }
      queryParams = {
        'page' : page.toString(),
        'per_page' : perPage.toString(),
        'status_approval' : statusApproval.toString()
      };
    }
    String? queryString = Uri(queryParameters: queryParams).query;
    var requestUrl = MGPAPI.baseUrlHrdu + '/approval_penerimaan_barang/list/?' + queryString;
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
      loadingData = true;
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
    var requestUrl = MGPAPI.baseUrlHrdu + '/approval_penerimaan_barang/list/?' + queryString;
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
}