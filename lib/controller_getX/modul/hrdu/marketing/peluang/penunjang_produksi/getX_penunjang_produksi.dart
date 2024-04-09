import 'package:mgp_mobile_app/controller_getX/modul/hrdu/marketing/default_marketing/analisa_barang_jadi/penunjang_produksi/getX_analisa_penunjang_produksi.dart';
import 'package:mgp_mobile_app/controller_getX/modul/hrdu/marketing/peluang/penunjang_produksi/mixin_analisa_bahan_baku.dart';

class GetxPenunjangProduksiPeluang extends GetxAnalisaPeluangPenunjang with PeluangPenunjangDetail{
  analisaPeluangPenunjang(String idBarangJadi) async{
    await fetchDataPeluangPenunjangDetail(idBarangJadi: idBarangJadi);
    var detailPenunjangProduksi = futureDetailPenunjang!.data;
    await analisaPenunjang(detailPenunjangProduksi);
  }
}