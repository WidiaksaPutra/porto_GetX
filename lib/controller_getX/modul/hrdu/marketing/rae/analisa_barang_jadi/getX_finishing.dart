import 'package:mgp_mobile_app/controller_getX/modul/hrdu/marketing/default_marketing/analisa_barang_jadi/finishing/getX_analisa_finishing.dart';
import 'package:mgp_mobile_app/controller_getX/modul/hrdu/marketing/rae/mixin_rae.dart';

class GetxFinishingRae extends GetxAnalisaFinishing with RaeDetail{
  finishing(String idRaeDetail, String namaFinishing) async{
    await fetchDataRAEDetail(idRaeDetail: idRaeDetail);
    var detailFinishing = futureDetailRae!.data;
    await finishingDetail(detailFinishing, namaFinishing);
  }
}
