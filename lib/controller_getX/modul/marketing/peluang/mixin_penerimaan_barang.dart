import 'package:mgp_mobile_app/model/hrdu/peluang/analisa_single_peluang_umum.dart';
import 'package:mgp_mobile_app/model/hrdu/peluang/detail_peluang_model.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu/mgp_api_hrdu.dart';

mixin PeluangDetail{
  final MGPAPI _mgpapi = MGPAPI();
  DetailRegplg? futureDetailPeluang;
  AnalisaSingleRegplgUmum? futureDetailUmum;

  Future<DetailRegplg> fetchDataPeluangDetail({required String noPeluang})async {
    return futureDetailPeluang = await _mgpapi.fetchApprovalDetailPeluang(noPeluang: noPeluang);
  }

  Future<AnalisaSingleRegplgUmum> fetchDataUmumDetail({required String idBarangJadi})async {
    return futureDetailUmum = await _mgpapi.fetchAnalisaSinglePeluangUmum(idBarangJadi: idBarangJadi);
  }
}