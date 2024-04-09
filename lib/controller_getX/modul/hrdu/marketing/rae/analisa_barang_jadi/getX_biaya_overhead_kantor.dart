import 'package:mgp_mobile_app/controller_getX/modul/hrdu/marketing/default_marketing/analisa_barang_jadi/biaya_overhead_kantor/getX_biaya_overhead_kantor.dart';
import 'package:mgp_mobile_app/controller_getX/modul/hrdu/marketing/rae/mixin_rae.dart';

class GetxBiayaOverheadKantorRae extends GetxBiayaOverheadKantor with RaeDetail{
  biayaOverheadKantorRae(String idRaeDetail, double totalAnalisaBahanBaku, double totalAnalisaPenunjanProduksi, double totalAnalisaFinishing, double totalAnalisaAlatBantuOnSite, double totalAnalisaLabourCostOnSite) async{
    await fetchDataRAEDetail(idRaeDetail: idRaeDetail);
    var detailBiayaOverheadKantor = futureDetailRae!.data;
    await biayaOverheadKantor(detailBiayaOverheadKantor, totalAnalisaBahanBaku, totalAnalisaPenunjanProduksi, totalAnalisaFinishing, totalAnalisaAlatBantuOnSite, totalAnalisaLabourCostOnSite);
  }
}