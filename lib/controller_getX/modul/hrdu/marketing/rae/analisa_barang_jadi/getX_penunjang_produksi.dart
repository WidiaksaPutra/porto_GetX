import 'package:mgp_mobile_app/controller_getX/modul/hrdu/marketing/default_marketing/analisa_barang_jadi/penunjang_produksi/getX_analisa_penunjang_produksi.dart';
import 'package:mgp_mobile_app/controller_getX/modul/hrdu/marketing/rae/mixin_rae.dart';

class GetxPenunjangProduksiRae extends GetxAnalisaPeluangPenunjang with RaeDetail{
  analisaPeluangPenunjang(String idRaeDetail) async{
    // totalSummaryBiaya.clear();
    await fetchDataRAEDetail(idRaeDetail: idRaeDetail);
    var detailPenunjangProduksi = futureDetailRae!.data;
    await analisaPenunjang(detailPenunjangProduksi);
  }
}
