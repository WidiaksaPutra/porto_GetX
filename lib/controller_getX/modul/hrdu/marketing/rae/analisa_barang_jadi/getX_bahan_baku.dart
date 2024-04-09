import 'package:mgp_mobile_app/controller_getX/modul/hrdu/marketing/default_marketing/analisa_barang_jadi/bahan_baku/getX_analisa_bahan_baku.dart';
import 'package:mgp_mobile_app/controller_getX/modul/hrdu/marketing/rae/mixin_rae.dart';

class GetxBahanBakuRae extends GetxAnalisaBahanBaku with RaeDetail{
  bahanBaku(String idRaeDetail) async{
    await fetchDataRAEDetail(idRaeDetail: idRaeDetail);
    var detailBahanBaku = futureDetailRae!.data;
    await bahanBakuDetail(detailBahanBaku);
  }
}
