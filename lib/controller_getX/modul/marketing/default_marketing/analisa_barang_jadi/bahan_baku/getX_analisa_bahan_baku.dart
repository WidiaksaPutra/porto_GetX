import 'package:get/get.dart';
import 'package:mgp_mobile_app/controller_getX/modul/marketing/default_marketing/analisa_barang_jadi/bahan_baku/mixin_analisa_bahan_baku.dart';

class GetxAnalisaBahanBaku extends GetxController with BahanBakuDetail{
  late var totalHardwood = 0.0.obs;
  late var totalPlywood = 0.0.obs;
  late var luasHardwood = 0.0.obs;
  late var luasPlywood = 0.0.obs;
  late var volumeHardwood = 0.0.obs;
  late var volumePlywood = 0.0.obs;
  late var listVolumeHardwood = <String>[].obs;
  late var subTotalHardwood = <String>[].obs;
  late var listLuaslHardwood = <String>[].obs;
  late var listVolumePlywood = <String>[].obs;
  late var subTotalPlywood = <String>[].obs;
  late var listLuasPlywood = <String>[].obs;

  late var grandTotalHardwood = "0.0".obs;
  late var totalLuasHardwood = "0.0".obs;
  late var totalVolumeHardwood = "0.0".obs;
  late var grandTotalPlywood = "0.0".obs;
  late var totalLuasPlywood = "0.0".obs;
  late var totalVolumePlywood = "0.0".obs;

  late var totalBahanBaku = 0.0.obs;

  bahanBaku(String idBarangJadi) async{
    await fetchDataBahanBakuDetail(idBarangJadi: idBarangJadi);
    bahanBakuHardwood();
    bahanBakuPlywood();
    
    if(totalBahanBaku.value == 0.0){
      grandTotalHardwood.value = totalHardwood.value.toString();
      totalLuasHardwood.value = luasHardwood.value.toString();
      totalVolumeHardwood.value = volumeHardwood.value.toString();
      grandTotalPlywood.value = totalPlywood.value.toString();
      totalLuasPlywood.value = luasPlywood.value.toString();
      totalVolumePlywood.value = volumePlywood.value.toString();
      
      totalBahanBaku.value = totalHardwood.value + totalPlywood.value;
    }
  }

  bahanBakuHardwood() async{
    if (futureDetailBahanBaku!.data!.analisaHardwood!.isNotEmpty) {
      for (var i = 0; i < futureDetailBahanBaku!.data!.analisaHardwood!.length; i++) {
        double volume = (double.parse(futureDetailBahanBaku!.data!.analisaHardwood![i].tRaw.toString()) * 
          double.parse(futureDetailBahanBaku!.data!.analisaHardwood![i].wRaw.toString()) * 
          double.parse(futureDetailBahanBaku!.data!.analisaHardwood![i].lRaw.toString()) * 
          double.parse(futureDetailBahanBaku!.data!.analisaHardwood![i].qtyRaw.toString()))/1000000;
        volumeHardwood.value = volumeHardwood.value + volume;
        listVolumeHardwood.add(volume.toString());
        double subTotal = volume * double.parse(futureDetailBahanBaku!.data!.analisaHardwood![i].hargaSatuan.toString()) * 
          double.parse(futureDetailBahanBaku!.data!.analisaHardwood![i].koefisien.toString());//dirubah
        subTotalHardwood.add(subTotal.toString());
        totalHardwood.value = totalHardwood.value + subTotal.round();

        if (futureDetailBahanBaku!.data!.analisaHardwood![i].namaTipeSisi.toString() == "4 Sisi (2TL + 2WL)") {
          double tPlusW = (double.parse(futureDetailBahanBaku!.data!.analisaHardwood![i].tFinal.toString()) + 
          double.parse(futureDetailBahanBaku!.data!.analisaHardwood![i].wFinal.toString()));
          double luas = (tPlusW * 2 * double.parse(futureDetailBahanBaku!.data!.analisaHardwood![i].qtyFinal.toString()) * 
          double.parse(futureDetailBahanBaku!.data!.analisaHardwood![i].lFinal.toString()))/10000;
          listLuaslHardwood.add(luas.toString());
          luasHardwood.value = luasHardwood.value + luas;
        } else if (futureDetailBahanBaku!.data!.analisaHardwood![i].namaTipeSisi.toString() == "3 Sisi Opsi 1 (2TL + WL)") {
          double tPlusWPlusT = (double.parse(futureDetailBahanBaku!.data!.analisaHardwood![i].tFinal.toString()) + double.parse(futureDetailBahanBaku!.data!.analisaHardwood![i].wFinal.toString()) + double.parse(futureDetailBahanBaku!.data!.analisaHardwood![i].tFinal.toString()));
          double luas = (tPlusWPlusT * double.parse(futureDetailBahanBaku!.data!.analisaHardwood![i].qtyFinal.toString()) * double.parse(futureDetailBahanBaku!.data!.analisaHardwood![i].lFinal.toString()))/10000;
          listLuaslHardwood.add(luas.toString());
          luasHardwood.value = luasHardwood.value + luas;
        } else if (futureDetailBahanBaku!.data!.analisaHardwood![i].namaTipeSisi.toString() == "3 Sisi Opsi 2 (TL + 2WL)") {
          double tPlusWPlusW = (double.parse(futureDetailBahanBaku!.data!.analisaHardwood![i].tFinal.toString()) + double.parse(futureDetailBahanBaku!.data!.analisaHardwood![i].wFinal.toString()) + double.parse(futureDetailBahanBaku!.data!.analisaHardwood![i].wFinal.toString()));
          double luas = (tPlusWPlusW * double.parse(futureDetailBahanBaku!.data!.analisaHardwood![i].qtyFinal.toString()) * double.parse(futureDetailBahanBaku!.data!.analisaHardwood![i].lFinal.toString()))/10000;
          listLuaslHardwood.add(luas.toString());
          luasHardwood.value = luasHardwood.value + luas;
        } else if (futureDetailBahanBaku!.data!.analisaHardwood![i].namaTipeSisi.toString() == "2 Sisi Opsi 1 (TL + WL)") {
          double tPlusW = (double.parse(futureDetailBahanBaku!.data!.analisaHardwood![i].tFinal.toString()) + double.parse(futureDetailBahanBaku!.data!.analisaHardwood![i].wFinal.toString()));
          double luas = (tPlusW * double.parse(futureDetailBahanBaku!.data!.analisaHardwood![i].qtyFinal.toString()) * double.parse(futureDetailBahanBaku!.data!.analisaHardwood![i].lFinal.toString()))/10000;
          listLuaslHardwood.add(luas.toString());
          luasHardwood.value = luasHardwood.value + luas;
        } else if (futureDetailBahanBaku!.data!.analisaHardwood![i].namaTipeSisi.toString() == "2 Sisi Opsi 2 (2TL)") {
          double tPlusT = (double.parse(futureDetailBahanBaku!.data!.analisaHardwood![i].tFinal.toString()) + double.parse(futureDetailBahanBaku!.data!.analisaHardwood![i].tFinal.toString()));
          double luas = (tPlusT * double.parse(futureDetailBahanBaku!.data!.analisaHardwood![i].qtyFinal.toString()) * double.parse(futureDetailBahanBaku!.data!.analisaHardwood![i].lFinal.toString()))/10000;
          listLuaslHardwood.add(luas.toString());
          luasHardwood.value = luasHardwood.value + luas;
        } else if (futureDetailBahanBaku!.data!.analisaHardwood![i].namaTipeSisi.toString() == "2 Sisi Opsi 3 (2WL)") {
          double wPlusW = (double.parse(futureDetailBahanBaku!.data!.analisaHardwood![i].wFinal.toString()) + double.parse(futureDetailBahanBaku!.data!.analisaHardwood![i].wFinal.toString()));
          double luas = (wPlusW * double.parse(futureDetailBahanBaku!.data!.analisaHardwood![i].qtyFinal.toString()) * double.parse(futureDetailBahanBaku!.data!.analisaHardwood![i].lFinal.toString()))/10000;
          listLuaslHardwood.add(luas.toString());
          luasHardwood.value = luasHardwood.value + luas;
        } else if (futureDetailBahanBaku!.data!.analisaHardwood![i].namaTipeSisi.toString() == "1 Sisi Opsi 1 (TL)") {
          double luas = (double.parse(futureDetailBahanBaku!.data!.analisaHardwood![i].tFinal.toString()) * double.parse(futureDetailBahanBaku!.data!.analisaHardwood![i].qtyFinal.toString()) * double.parse(futureDetailBahanBaku!.data!.analisaHardwood![i].lFinal.toString()))/10000;
          listLuaslHardwood.add(luas.toString());
          luasHardwood.value = luasHardwood.value + luas;
        } else if (futureDetailBahanBaku!.data!.analisaHardwood![i].namaTipeSisi.toString() == "1 Sisi Opsi 2 (WL)") {
          double luas = (double.parse(futureDetailBahanBaku!.data!.analisaHardwood![i].wFinal.toString()) * double.parse(futureDetailBahanBaku!.data!.analisaHardwood![i].qtyFinal.toString()) * double.parse(futureDetailBahanBaku!.data!.analisaHardwood![i].lFinal.toString()))/10000;
          listLuaslHardwood.add(luas.toString());
          luasHardwood.value = luasHardwood.value + luas;
        } else {
          double luas = 0;
          listLuaslHardwood.add(luas.toString());
          luasHardwood.value = luasHardwood.value + luas;
        }
      }
    }
  }

  bahanBakuPlywood() async{
    if (futureDetailBahanBaku!.data!.analisaPlywood!.isNotEmpty) {
      for (var i = 0; i < futureDetailBahanBaku!.data!.analisaPlywood!.length; i++) {
        double volume = (double.parse(futureDetailBahanBaku!.data!.analisaPlywood![i].tRaw.toString()) * double.parse(futureDetailBahanBaku!.data!.analisaPlywood![i].wRaw.toString()) * double.parse(futureDetailBahanBaku!.data!.analisaPlywood![i].lRaw.toString()) * double.parse(futureDetailBahanBaku!.data!.analisaPlywood![i].qtyRaw.toString()))/1000000;
        volumePlywood.value = volumePlywood.value + volume;
        listVolumePlywood.add(volume.toString());
        double subTotal = double.parse(futureDetailBahanBaku!.data!.analisaPlywood![i].hargaSatuan.toString()) * double.parse(futureDetailBahanBaku!.data!.analisaPlywood![i].koefisien.toString()) * double.parse(futureDetailBahanBaku!.data!.analisaPlywood![i].qtyRaw.toString());//dirubah
        subTotalPlywood.add(subTotal.toString());
        totalPlywood.value = totalPlywood.value + subTotal.round();
        if (futureDetailBahanBaku!.data!.analisaPlywood![i].namaTipeSisi.toString() == "4 Sisi (2TL + 2WL)") {
          double tPlusW = (double.parse(futureDetailBahanBaku!.data!.analisaPlywood![i].tRaw.toString()) + double.parse(futureDetailBahanBaku!.data!.analisaPlywood![i].wRaw.toString()));
          double luas = (tPlusW * 2 * double.parse(futureDetailBahanBaku!.data!.analisaPlywood![i].qtyRaw.toString()) * double.parse(futureDetailBahanBaku!.data!.analisaPlywood![i].lRaw.toString()))/10000;
          listLuasPlywood.add(luas.toString());
          luasPlywood.value = luasPlywood.value + luas;
        } else if (futureDetailBahanBaku!.data!.analisaPlywood![i].namaTipeSisi.toString() == "3 Sisi Opsi 1 (2TL + WL)") {
          double tPlusWPlusT = (double.parse(futureDetailBahanBaku!.data!.analisaPlywood![i].tRaw.toString()) + double.parse(futureDetailBahanBaku!.data!.analisaPlywood![i].wRaw.toString()) + double.parse(futureDetailBahanBaku!.data!.analisaPlywood![i].tRaw.toString()));
          double luas = (tPlusWPlusT * double.parse(futureDetailBahanBaku!.data!.analisaPlywood![i].qtyRaw.toString()) * double.parse(futureDetailBahanBaku!.data!.analisaPlywood![i].lRaw.toString()))/10000;
          listLuasPlywood.add(luas.toString());
          luasPlywood.value = luasPlywood.value + luas;
        } else if (futureDetailBahanBaku!.data!.analisaPlywood![i].namaTipeSisi.toString() == "3 Sisi Opsi 2 (TL + 2WL)") {
          double tPlusWPlusW = (double.parse(futureDetailBahanBaku!.data!.analisaPlywood![i].tRaw.toString()) + double.parse(futureDetailBahanBaku!.data!.analisaPlywood![i].wRaw.toString()) + double.parse(futureDetailBahanBaku!.data!.analisaPlywood![i].wRaw.toString()));
          double luas = (tPlusWPlusW * double.parse(futureDetailBahanBaku!.data!.analisaPlywood![i].qtyRaw.toString()) * double.parse(futureDetailBahanBaku!.data!.analisaPlywood![i].lRaw.toString()))/10000;
          listLuasPlywood.add(luas.toString());
          luasPlywood.value = luasPlywood.value + luas;
        } else if (futureDetailBahanBaku!.data!.analisaPlywood![i].namaTipeSisi.toString() == "2 Sisi Opsi 1 (TL + WL)") {
          double tPlusW = (double.parse(futureDetailBahanBaku!.data!.analisaPlywood![i].tRaw.toString()) + double.parse(futureDetailBahanBaku!.data!.analisaPlywood![i].wRaw.toString()));
          double luas = (tPlusW * double.parse(futureDetailBahanBaku!.data!.analisaPlywood![i].qtyRaw.toString()) * double.parse(futureDetailBahanBaku!.data!.analisaPlywood![i].lRaw.toString()))/10000;
          listLuasPlywood.add(luas.toString());
          luasPlywood.value = luasPlywood.value + luas;
        } else if (futureDetailBahanBaku!.data!.analisaPlywood![i].namaTipeSisi.toString() == "2 Sisi Opsi 2 (2TL)") {
          double tPlusT = (double.parse(futureDetailBahanBaku!.data!.analisaPlywood![i].tRaw.toString()) + double.parse(futureDetailBahanBaku!.data!.analisaPlywood![i].tRaw.toString()));
          double luas = (tPlusT * double.parse(futureDetailBahanBaku!.data!.analisaPlywood![i].qtyRaw.toString()) * double.parse(futureDetailBahanBaku!.data!.analisaPlywood![i].lRaw.toString()))/10000;
          listLuasPlywood.add(luas.toString());
          luasPlywood.value = luasPlywood.value + luas;
        } else if (futureDetailBahanBaku!.data!.analisaPlywood![i].namaTipeSisi.toString() == "2 Sisi Opsi 3 (2WL)") {
          double wPlusW = (double.parse(futureDetailBahanBaku!.data!.analisaPlywood![i].wRaw.toString()) + double.parse(futureDetailBahanBaku!.data!.analisaPlywood![i].wRaw.toString()));
          double luas = (wPlusW * double.parse(futureDetailBahanBaku!.data!.analisaPlywood![i].qtyRaw.toString()) * double.parse(futureDetailBahanBaku!.data!.analisaPlywood![i].lRaw.toString()))/10000;
          listLuasPlywood.add(luas.toString());
          luasPlywood.value = luasPlywood.value + luas;
        } else if (futureDetailBahanBaku!.data!.analisaPlywood![i].namaTipeSisi.toString() == "1 Sisi Opsi 1 (TL)") {
          double luas = (double.parse(futureDetailBahanBaku!.data!.analisaPlywood![i].tRaw.toString()) * double.parse(futureDetailBahanBaku!.data!.analisaPlywood![i].qtyRaw.toString()) * double.parse(futureDetailBahanBaku!.data!.analisaPlywood![i].lRaw.toString()))/10000;
          listLuasPlywood.add(luas.toString());
          luasPlywood.value = luasPlywood.value + luas;
        } else if (futureDetailBahanBaku!.data!.analisaPlywood![i].namaTipeSisi.toString() == "1 Sisi Opsi 2 (WL)") {
          double luas = (double.parse(futureDetailBahanBaku!.data!.analisaPlywood![i].wRaw.toString()) * double.parse(futureDetailBahanBaku!.data!.analisaPlywood![i].qtyRaw.toString()) * double.parse(futureDetailBahanBaku!.data!.analisaPlywood![i].lRaw.toString()))/10000;
          listLuasPlywood.add(luas.toString());
          luasPlywood.value = luasPlywood.value + luas;
        } else {
          num luas = 0;
          listLuasPlywood.add(luas.toString());
          luasPlywood.value = luasPlywood.value + luas;
        }
      }
    }
  }
}
                  
                  

                  