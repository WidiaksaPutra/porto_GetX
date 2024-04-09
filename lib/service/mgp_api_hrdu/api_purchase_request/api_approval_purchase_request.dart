import 'dart:convert';
import 'package:mgp_mobile_app/controller_getX/default/default_searching_manual.dart';
import 'package:mgp_mobile_app/model/hrdu/purchase_request/purchase_request_model.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu/mgp_api_hrdu.dart';
import 'package:shared_preferences/shared_preferences.dart';

mixin PurchaseRequestApprovalClass{
  late String? tokens;
  late List dataListApproval = [];
  late int totalDataListApproval = 0;
  late int pages = 1;
  late bool loadingData = false;
  late bool loadingTotalData = false;
  late bool loading = false;

  Future<List<dynamic>> fetchApprovalPurchaseRequest({noPurchaseRequest, keperluan, statusApproval})async {
    try {
      if(loading == true || dataListApproval.isEmpty){
        await Future.delayed(const Duration(milliseconds: 500));
        SharedPreferences prefs = await SharedPreferences.getInstance();
        tokens = prefs.getString("token")!;
        int? perPage = 10;
        Map<String, String>? queryParams;
        if(noPurchaseRequest != null){
          queryParams = searchData3Atribut(pages: pages, perPage: perPage, keyData1: 'no_purchase_request', data1: noPurchaseRequest);
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
        var requestUrl = MGPAPI.baseUrlHrdu + '/approval_purchase_request/list/?' + queryString;
        final response = await MGPAPI.client.get(Uri.parse(requestUrl),
          headers: {
            'Authorization': 'Bearer $tokens',
          }
        );
        if (response.statusCode == 200) {
          final parsed = json.decode(response.body);
          Pr purchaseRequestData = Pr.fromJson(parsed);
          if(purchaseRequestData.dataCount!.toInt() != dataListApproval.length){
            dataListApproval.addAll(purchaseRequestData.data);
            pages++;
          }
          loadingData = true;
        } else {
          throw Exception('Failed to load data');
        } 
      }
      print("test list pr");
      print(dataListApproval);
      return dataListApproval;
    } catch (e) {
      throw Exception('data error');
    }
  }

  Future<int> fetchApprovalCountPurchaseRequest() async {
    await Future.delayed(const Duration(milliseconds: 500));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokens = prefs.getString("token")!;
    int? perPage = 10;
    Map<String, String>? queryParams = {
      'page' : '1',
      'per_page' : perPage.toString(),
    };
    String? queryString = Uri(queryParameters: queryParams).query;
    var requestUrl = MGPAPI.baseUrlHrdu + '/approval_purchase_request/list/?' + queryString;
    final response = await MGPAPI.client.get(Uri.parse(requestUrl),
      headers: {
        'Authorization': 'Bearer $tokens',
      }
    );
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
       print("test456");
      print(parsed);
      Pr purchaseRequestData = Pr.fromJson(parsed);
      loadingTotalData = true;
      return totalDataListApproval = purchaseRequestData.dataCount!.toInt();
    } else {
      throw Exception('Failed to load data');
    }
  }
}