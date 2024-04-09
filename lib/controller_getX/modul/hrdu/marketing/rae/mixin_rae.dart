import 'package:mgp_mobile_app/model/hrdu/rae/analisa_single_rae.dart';
import 'package:mgp_mobile_app/model/hrdu/rae/rekapitulasi.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu/mgp_api_hrdu.dart';

mixin RaeDetail{
  final MGPAPI _mgpapi = MGPAPI();
  AnalisaSingleRegrae? futureDetailRae;

  Future<AnalisaSingleRegrae> fetchDataRAEDetail({required String idRaeDetail})async {
    return futureDetailRae = await _mgpapi.fetchAnalisaSingleRAE(idRaeDetail: idRaeDetail);
  }
}

mixin RaeRekapitulasi{
  final MGPAPI _mgpapi = MGPAPI();
  Rekapitulasi? futureRaeRekapitulasi;

  Future<Rekapitulasi> fetchDataRaeRekapitulasi({required String idRaeDetail})async {
    return futureRaeRekapitulasi = await _mgpapi.fetchRekapitulasi(idRae: idRaeDetail);
  }
}