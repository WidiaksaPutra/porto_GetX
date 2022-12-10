import 'package:mgp_mobile_app/model/hrdu/peluang/analisa_single_peluang_penunjang.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu/mgp_api_hrdu.dart';

mixin PeluangPenunjangDetail{
  final MGPAPI _mgpapi = MGPAPI();
  AnalisaSingleRegplgPenunjang? futureDetailPenunjang;
  
  Future<AnalisaSingleRegplgPenunjang> fetchDataPeluangPenunjangDetail({required String idBarangJadi})async {
    return futureDetailPenunjang = await _mgpapi.fetchAnalisaSinglePeluangPenunjang(idBarangJadi: idBarangJadi);
  }
}