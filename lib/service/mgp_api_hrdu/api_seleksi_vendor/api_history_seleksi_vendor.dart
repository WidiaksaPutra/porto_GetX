import 'dart:convert';

import 'package:mgp_mobile_app/controller_getX/default/default_searching_manual.dart';
import 'package:mgp_mobile_app/model/hrdu/seleksi_vendor/history_seleksi_vendor_model.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu/mgp_api_hrdu.dart';
import 'package:shared_preferences/shared_preferences.dart';

mixin SeleksiVendorHistoryClass{
  late String? tokens;
  late List<dynamic> dataListHistory = [];
  late int pages = 1;
  late bool loadingData = false;
  late bool loading = false;

  Future<List<dynamic>> fetchHistorySeleksiVendor({noSeleksiVendor, keperluan, statusHistory}) async {
    try {
      if(loading == true || dataListHistory.isEmpty){
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
        else if(statusHistory != null){
          if(statusHistory.contains("Ver") || statusHistory.contains("ver") || statusHistory.contains("VER")){
            statusHistory = "VER";
            queryParams = searchData3Atribut(pages: pages, perPage: perPage, keyData1: 'status_approval', data1: statusHistory);
          }else if(statusHistory.contains("Pen") || statusHistory.contains("pen") || statusHistory.contains("PEN")){
            statusHistory = "PEN";
            queryParams = searchData3Atribut(pages: pages, perPage: perPage, keyData1: 'status_approval', data1: statusHistory);
          }
        }else{
          queryParams = searchDataBasic(pages: pages, perPage: perPage);
        }
        String? queryString = Uri(queryParameters: queryParams).query;
        var requestUrl = MGPAPI.baseUrlHrdu + '/approval_seleksi_vendor/history/?' + queryString;
        final response =
          await MGPAPI.client.get(Uri.parse(requestUrl),
          headers: {
            'Authorization': 'Bearer $tokens',
          }
        );
        if (response.statusCode == 200) {
          final parsed = json.decode(response.body);
          HistoryPvspr seleksiVendorData = HistoryPvspr.fromJson(parsed);
          if(seleksiVendorData.dataCount!.toInt() != dataListHistory.length){
            dataListHistory.addAll(seleksiVendorData.data);
            pages++;
          }
          loadingData = true;
        } else {
          throw Exception('Failed to load data');
        }
      }
      return dataListHistory;
    } catch (e) {
      throw Exception('data error');
    }
  }
}