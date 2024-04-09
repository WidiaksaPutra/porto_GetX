import 'dart:convert';

import 'package:mgp_mobile_app/model/hrdu/penerimaan_barang/detail_penerimaan_barang.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu/mgp_api_hrdu.dart';
import 'package:shared_preferences/shared_preferences.dart';

mixin PenerimaanBarangDetail{
  DetailPenpo? futureDetailPb;

  Future<DetailPenpo> fetchApprovalDetailPenerimaanBarang({required String noPenerimaanBarang}) async {
    await Future.delayed(const Duration(milliseconds: 500));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    MGPAPI.tokens = prefs.getString("token")!;
    Map<String, String>? queryParams = {
      'no_penerimaan_barang' : noPenerimaanBarang,
    };
    String? queryString = Uri(queryParameters: queryParams).query;
    var requestUrl = MGPAPI.baseUrlHrdu + '/approval_penerimaan_barang/detail/?' + queryString;
    final response = 
      await MGPAPI.client.get(Uri.parse(requestUrl),
      headers: {
        'Authorization': 'Bearer ${MGPAPI.tokens}',
      }
    );
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      DetailPenpo detailPenerimaanBarangData = DetailPenpo.fromJson(parsed);
      return futureDetailPb = detailPenerimaanBarangData;
    } else {
      throw Exception('Failed to load data');
    }
  }
}