import 'package:mgp_mobile_app/controller_getX/modul/hrdu/marketing/default_marketing/analisa_barang_jadi/finishing/getX_analisa_finishing.dart';
import 'package:mgp_mobile_app/controller_getX/modul/hrdu/marketing/peluang/finishing/mixin_analisa_finishing.dart';

class GetxFinishingPeluang extends GetxAnalisaFinishing with FinishingDetail{
  finishing({required String idBarangJadi, required String namaFinishing}) async{
    await fetchDataFinishingDetail(idBarangJadi: idBarangJadi);
    var detailFinishing = futureFinishing!.data;
    await finishingDetail(detailFinishing, namaFinishing);
  }
}