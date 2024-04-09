import 'package:mgp_mobile_app/controller_getX/modul/hrdu/marketing/default_marketing/analisa_barang_jadi/alat_bantu_on-site/getX_alat_bantu_on-site.dart';
import 'package:mgp_mobile_app/controller_getX/modul/hrdu/marketing/rae/mixin_rae.dart';

class GetxAlatBantuOnSiteRae extends GetxAlatBantuOnSite with RaeDetail{
  alatBantuOnSiteRae(String idRaeDetail) async{
    await fetchDataRAEDetail(idRaeDetail: idRaeDetail);
    var detailAlatBantuOnSite = futureDetailRae!.data;
    await alatBantuOnSite(detailAlatBantuOnSite);
  }
}