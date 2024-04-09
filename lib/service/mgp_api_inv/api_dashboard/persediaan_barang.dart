

import 'dart:convert';

import 'package:mgp_mobile_app/model/hrdu/dashboard/dashboard_nilai_persediaan_barang.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu/mgp_api_hrdu.dart';

mixin PersediaanBarang{
  late List<dynamic> nilaiPersediaanBarang = [];
  Future<List<dynamic>> fetchPersediaanBarang({required String tanggalAwal, required String tanggalAkhir}) async {
    await Future.delayed(const Duration(milliseconds: 500));
    Map<String, String>? queryParams = {
      'tanggal_awal' : tanggalAwal,
      'tanggal_akhir' : tanggalAkhir,
    };
    String? queryString = Uri(queryParameters: queryParams).query;
    var requestUrl = '${MGPAPI.baseUrlInv}/dashboard/nilai_rekapitulasi?$queryString';
    final response = 
      await MGPAPI.client.get(Uri.parse(requestUrl),
      headers: {
        'Authorization': 'Bearer ${MGPAPI.tokens}',
      }
    );
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      DashInvNilaiPersediaanBarang nilaiPersediaanBarangData = DashInvNilaiPersediaanBarang.fromJson(parsed);
      nilaiPersediaanBarang.addAll(nilaiPersediaanBarangData.data);
      print("test 1234567");
      print(nilaiPersediaanBarang);
      return nilaiPersediaanBarang;
    } else {
      throw Exception('Failed to load album');
    }
  }
}