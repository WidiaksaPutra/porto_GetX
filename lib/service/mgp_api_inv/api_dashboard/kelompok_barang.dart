import 'dart:convert';
import 'package:mgp_mobile_app/model/hrdu/dashboard/dashboard_kelompok_barang.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu/mgp_api_hrdu.dart';

mixin KelompokBarang{
  late List<dynamic> nilaiKelompokBarang = [];
  Future<List<dynamic>> fetchNilaiKelompokBarang({required String tanggalAwal, required String tanggalAkhir}) async {
    await Future.delayed(const Duration(milliseconds: 500));
    Map<String, String>? queryParams = {
      'tanggal_awal' : tanggalAwal,
      'tanggal_akhir' : tanggalAkhir,
    };
    String? queryString = Uri(queryParameters: queryParams).query;
    var requestUrl = '${MGPAPI.baseUrlInv}/Dashboard/kelompok_barang?$queryString';
    final response = 
      await MGPAPI.client.get(Uri.parse(requestUrl),
      headers: {
        'Authorization': 'Bearer ${MGPAPI.tokens}',
      }
    );
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      DashInvNilaiKelompokBarang nilaiKelompokBarangData = DashInvNilaiKelompokBarang.fromJson(parsed);
      nilaiKelompokBarang.addAll(nilaiKelompokBarangData.data);
      return nilaiKelompokBarang;
    } else {
      throw Exception('Failed to load album');
    }
  }
}