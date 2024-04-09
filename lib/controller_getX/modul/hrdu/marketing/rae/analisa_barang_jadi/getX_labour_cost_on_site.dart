import 'package:mgp_mobile_app/controller_getX/modul/hrdu/marketing/default_marketing/analisa_barang_jadi/labour_cost_on_site.dart/getX_labour_cost_on_site.dart';
import 'package:mgp_mobile_app/controller_getX/modul/hrdu/marketing/rae/mixin_rae.dart';

class GetxLabourCostOnSiteRae extends GetxLabourCostOnSite with RaeDetail{
  labourCostOnSiteRae(String idRaeDetail) async{
    await fetchDataRAEDetail(idRaeDetail: idRaeDetail);
    var detailLabourCostOnSite = futureDetailRae!.data;
    await labourCostOnSite(detailLabourCostOnSite);
  }
}