import 'package:mgp_mobile_app/model/hrdu/peluang/analisa_single_peluang_fin.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu/mgp_api_hrdu.dart';

mixin FinishingDetail{
  final MGPAPI _mgpapi = MGPAPI();
  AnalisaSingleRegplgFinishing? futureFinishing;
  
  Future<AnalisaSingleRegplgFinishing> fetchDataFinishingDetail({required String idBarangJadi})async {
    return futureFinishing = await _mgpapi.fetchAnalisaSinglePeluangFinishing(idBarangJadi: idBarangJadi);
  }
}