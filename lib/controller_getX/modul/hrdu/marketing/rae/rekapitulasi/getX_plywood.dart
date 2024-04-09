import 'package:mgp_mobile_app/controller_getX/modul/hrdu/marketing/default_marketing/rekapitulasi/summary_biaya_bahan_baku/getX_plywood.dart';
import 'package:mgp_mobile_app/controller_getX/modul/hrdu/marketing/rae/mixin_rae.dart';

class GetxPlywoodRae extends GetxPlywood with RaeRekapitulasi{
  bahanBaku(String idRaeDetail) async{
    await fetchDataRaeRekapitulasi(idRaeDetail: idRaeDetail);
    var detailPlywood = futureRaeRekapitulasi;
    await plywoodDetailRae(detailPlywood);
  }
}