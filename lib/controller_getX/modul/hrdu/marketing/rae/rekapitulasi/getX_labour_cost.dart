import 'package:mgp_mobile_app/controller_getX/modul/hrdu/marketing/default_marketing/rekapitulasi/summary_biaya_bahan_lainnya/getX_labour_cost.dart';
import 'package:mgp_mobile_app/controller_getX/modul/hrdu/marketing/rae/mixin_rae.dart';

class GetxLabourCostRae extends GetxLabourCost with RaeRekapitulasi{
  labourCost(String idRaeDetail) async{
    await fetchDataRaeRekapitulasi(idRaeDetail: idRaeDetail);
    var labourCost = futureRaeRekapitulasi;
    await labourCostDetail(labourCost);
  }
}