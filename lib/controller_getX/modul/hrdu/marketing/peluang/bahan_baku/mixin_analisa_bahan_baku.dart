import 'package:mgp_mobile_app/model/hrdu/peluang/analisa_single_peluang_baku.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu/mgp_api_hrdu.dart';

mixin BahanBakuDetail{
  final MGPAPI _mgpapi = MGPAPI();
  AnalisaSingleRegplgBaku? futureDetailBahanBaku;
  
  Future<AnalisaSingleRegplgBaku> fetchDataBahanBakuDetail({required String idBarangJadi})async {
    return futureDetailBahanBaku = await _mgpapi.fetchAnalisaSinglePeluangBaku(idBarangJadi: idBarangJadi);
  }
}