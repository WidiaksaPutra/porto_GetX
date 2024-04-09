import 'package:mgp_mobile_app/controller_getX/modul/hrdu/marketing/default_marketing/rekapitulasi/summary_biaya_bahan_lainnya/getX_factory_supply.dart';
import 'package:mgp_mobile_app/controller_getX/modul/hrdu/marketing/rae/mixin_rae.dart';

class GetxFactorySupplyRae extends GetxFactorySupply with RaeRekapitulasi{
  factorySupply(String idRaeDetail) async{
    await fetchDataRaeRekapitulasi(idRaeDetail: idRaeDetail);
    var detailFactorySupply = futureRaeRekapitulasi;
    await factorySupplyDetail(detailFactorySupply);
  }
}
