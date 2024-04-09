import 'dart:convert';

import 'package:mgp_mobile_app/controller_getX/default/default_searching_manual.dart';
import 'package:mgp_mobile_app/model/hrdu/seleksi_vendor/seleksi_vendor_model.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu/mgp_api_hrdu.dart';
import 'package:shared_preferences/shared_preferences.dart';

mixin SeleksiVendorApprovalClass{
  late String? tokens;
  late List dataListApproval = [];
  late int totalDataListApproval = 0;
  late int pages = 1;
  late bool loadingData = false;
  late bool loadingTotalData = false;
  late bool loading = false;

  Future<List<dynamic>> fetchApprovalSeleksiVendor({noSeleksiVendor, keperluan, statusApproval})async {
    try {
      if(loading == true || dataListApproval.isEmpty){
        await Future.delayed(const Duration(milliseconds: 500));
        SharedPreferences prefs = await SharedPreferences.getInstance();
        tokens = prefs.getString("token")!;
        int? perPage = 10;
        Map<String, String>? queryParams;
        if(noSeleksiVendor != null){
          queryParams = searchData3Atribut(pages: pages, perPage: perPage, keyData1: 'no_seleksi_vendor', data1: noSeleksiVendor);
        }
        else if(keperluan != null){
          queryParams = searchData3Atribut(pages: pages, perPage: perPage, keyData1: 'keperluan', data1: keperluan);
        }
        else if(statusApproval != null){
          if(statusApproval.contains("Ver") || statusApproval.contains("ver") || statusApproval.contains("VER")){
            statusApproval = "VER";
            queryParams = searchData3Atribut(pages: pages, perPage: perPage, keyData1: 'status_approval', data1: statusApproval);
          }else if(statusApproval.contains("Pen") || statusApproval.contains("pen") || statusApproval.contains("PEN")){
            statusApproval = "PEN";
            queryParams = searchData3Atribut(pages: pages, perPage: perPage, keyData1: 'status_approval', data1: statusApproval);
          }
        }else{
          queryParams = searchDataBasic(pages: pages, perPage: perPage);
        }
        String? queryString = Uri(queryParameters: queryParams).query;
        var requestUrl = MGPAPI.baseUrlHrdu + '/approval_seleksi_vendor/list/?' + queryString;
        final response =
          await MGPAPI.client.get(Uri.parse(requestUrl),
          headers: {
            'Authorization': 'Bearer $tokens',
          }
        );
        if (response.statusCode == 200) {
          final parsed = json.decode(response.body);
          Pvspr seleksiVendorData = Pvspr.fromJson(parsed);
          if(seleksiVendorData.dataCount!.toInt() != dataListApproval.length){
            dataListApproval.addAll(seleksiVendorData.data);
            pages++;
          }
          loadingData = true;
        } else {
          throw Exception('Failed to load data');
        }
      }
      return dataListApproval;
    } catch (e) {
      throw Exception('data error');
    }
  }

  Future<int> fetchApprovalCountSeleksiVendor() async {
    await Future.delayed(const Duration(milliseconds: 500));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokens = prefs.getString("token")!;
    int? perPage = 10;
    Map<String, String>? queryParams = {
      'page' : '1',
      'per_page' : perPage.toString(),
    };
    String? queryString = Uri(queryParameters: queryParams).query;
    var requestUrl = MGPAPI.baseUrlHrdu + '/approval_seleksi_vendor/list/?' + queryString;
    final response =
      await MGPAPI.client.get(Uri.parse(requestUrl),
      headers: {
        'Authorization': 'Bearer $tokens',
      }
    );
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      Pvspr seleksiVendorData = Pvspr.fromJson(parsed);
      loadingTotalData = true;
      return totalDataListApproval = seleksiVendorData.dataCount!.toInt();
    } else {
      throw Exception('Failed to load data');
    }
  }
}