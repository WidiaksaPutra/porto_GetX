import 'package:mgp_mobile_app/controller_getX/modul/hrdu/marketing/default_marketing/rekapitulasi/summary_biaya_bahan_baku/getX_hardwood.dart';
import 'package:mgp_mobile_app/controller_getX/modul/hrdu/marketing/rae/mixin_rae.dart';

class GetxHardwoodRae extends GetxHardwood with RaeRekapitulasi{
  bahanBaku(String idRaeDetail) async{
    await fetchDataRaeRekapitulasi(idRaeDetail: idRaeDetail);
    var detailHardWood = futureRaeRekapitulasi;
    // print("testhardwood");
    // print(detailHardWood!.data.length);
    await hardwoodDetail(detailHardWood);
  }
}
