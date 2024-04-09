import 'dart:convert';
import 'package:mgp_mobile_app/model/hrdu/dashboard/dashboard_keperluan.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu/mgp_api_hrdu.dart';

mixin Keperluan{
  
  Future fetchKeperluan({required String tanggalAwal, required String tanggalAkhir}) async {
    await Future.delayed(const Duration(milliseconds: 500));
    Map<String, String>? queryParams = {
      'tanggal_awal' : tanggalAwal,
      'tanggal_akhir' : tanggalAkhir,
    };
    String? queryString = Uri(queryParameters: queryParams).query;
    var requestUrl = '${MGPAPI.baseUrlInv}/Dashboard/keperluan?$queryString';
    final response = 
      await MGPAPI.client.get(Uri.parse(requestUrl),
      headers: {
        'Authorization': 'Bearer ${MGPAPI.tokens}',
      }
    );
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      DashInvPersentaseKeperluan nilaiKelompokBarangData = DashInvPersentaseKeperluan.fromJson(parsed);
      return nilaiKelompokBarangData.data;
    } else {
      throw Exception('Failed to load album');
    }
  }
}