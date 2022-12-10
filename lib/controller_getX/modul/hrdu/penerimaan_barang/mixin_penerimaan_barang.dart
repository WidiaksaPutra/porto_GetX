import 'package:mgp_mobile_app/model/hrdu/penerimaan_barang/detail_penerimaan_barang.dart';
import 'package:mgp_mobile_app/service/mgp_api_hrdu/mgp_api_hrdu.dart';

mixin PenerimaanBarangDetail{
  final MGPAPI _mgpapi = MGPAPI();
  DetailPenpo? futureDetailPenpo;
  Future<DetailPenpo> fetchDataPenerimaanBarangDetail({required String noPenerimaanBarang})async {
    return futureDetailPenpo = await _mgpapi.fetchApprovalDetailPenerimaanBarang(noPenerimaanBarang: noPenerimaanBarang);
  }
}