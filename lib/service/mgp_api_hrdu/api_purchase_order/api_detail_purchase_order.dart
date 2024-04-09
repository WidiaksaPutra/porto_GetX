import 'dart:convert';

import 'package:mgp_mobile_app/model/hrdu/purchase_order/detail_purchase_order_model.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu/mgp_api_hrdu.dart';

mixin PurchaseOrderDetail{
  DetailRegpo? futureDetailPo;
  Future<DetailRegpo> fetchDetailPurchaseOrder({required String noPurchaseOrder, required String getToken}) async {
    await Future.delayed(const Duration(milliseconds: 500));
    Map<String, String>? queryParams = {
      'no_purchase_order' : noPurchaseOrder,
    };
    String? queryString = Uri(queryParameters: queryParams).query;
    var requestUrl = MGPAPI.baseUrlHrdu + '/approval_purchase_order/detail/?' + queryString;
    final response = 
      await MGPAPI.client.get(Uri.parse(requestUrl),
      headers: {
        'Authorization': 'Bearer $getToken',
      }
    );
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      DetailRegpo detailPurchaseOrderData = DetailRegpo.fromJson(parsed);
      return futureDetailPo = detailPurchaseOrderData;
    } else {
      throw Exception('Failed to load album');
    }
  }
}