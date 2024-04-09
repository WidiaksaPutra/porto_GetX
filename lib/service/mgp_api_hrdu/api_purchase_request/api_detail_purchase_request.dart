import 'dart:convert';

import 'package:mgp_mobile_app/model/hrdu/purchase_request/detail_purchase_request_model.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu/mgp_api_hrdu.dart';
import 'package:shared_preferences/shared_preferences.dart';

mixin PurchaseRequestDetail{
  late dynamic futureDetailPr = "-";
  late bool loadingData = true;

  Future fetchDetailPurchaseRequest({required String noPurchaseRequest}) async {
    try{
      await Future.delayed(const Duration(milliseconds: 500));
      SharedPreferences prefs = await SharedPreferences.getInstance();
      MGPAPI.tokens = prefs.getString("token")!;
      Map<String, String>? queryParams = {
        'no_purchase_request' : noPurchaseRequest,
      };
      String? queryString = Uri(queryParameters: queryParams).query;
      var requestUrl = MGPAPI.baseUrlHrdu + '/approval_purchase_request/detail/?' + queryString;
      final response = 
        await MGPAPI.client.get(Uri.parse(requestUrl),
        headers: {
          'Authorization': 'Bearer ${MGPAPI.tokens}',
        }
      );
      if (response.statusCode == 200) {
        final parsed = json.decode(response.body);
        DetailPr detailPurchaseRequestData = DetailPr.fromJson(parsed);
        loadingData = false;
        futureDetailPr = detailPurchaseRequestData.data;
        return futureDetailPr;
      } else {
        throw Exception('Failed to load album');
      }
    } catch (e) {
      throw Exception('data error');
    }
  }
}