import 'package:mgp_mobile_app/model/hrdu/peluang/analisa_single_peluang_umum.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu/mgp_api_hrdu.dart';

mixin UmumDetail{
  final MGPAPI _mgpapi = MGPAPI();
  AnalisaSingleRegplgUmum? futureDetailUmum;

  Future<AnalisaSingleRegplgUmum> fetchDataUmumDetail({required String idBarangJadi})async {
    return futureDetailUmum = await _mgpapi.fetchAnalisaSinglePeluangUmum(idBarangJadi: idBarangJadi);
  }
}