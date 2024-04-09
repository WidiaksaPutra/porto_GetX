import 'package:mgp_mobile_app/controller_getX/modul/hrdu/marketing/default_marketing/analisa_barang_jadi/bahan_baku/getX_analisa_bahan_baku.dart';
import 'package:mgp_mobile_app/controller_getX/modul/hrdu/marketing/peluang/bahan_baku/mixin_analisa_bahan_baku.dart';

class GetxBahanBakuPeluang extends GetxAnalisaBahanBaku with BahanBakuDetail{
  bahanBaku(String idBarangJadi) async{
    await fetchDataBahanBakuDetail(idBarangJadi: idBarangJadi);
    var detailBahanBaku = futureDetailBahanBaku!.data;
    await bahanBakuDetail(detailBahanBaku);
  }
}

