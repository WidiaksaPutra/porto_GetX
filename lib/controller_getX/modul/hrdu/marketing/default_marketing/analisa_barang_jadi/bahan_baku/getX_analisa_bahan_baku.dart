import 'package:get/get.dart';

class GetxAnalisaBahanBaku extends GetxController{
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

  late var totalLuasPermukaan = 0.0.obs;
  late var totalBahanBaku = 0.0.obs;

  bahanBakuDetail(var detailBahanBaku){
    totalHardwood.value = 0.0;
    totalPlywood.value = 0.0;
    luasHardwood.value = 0.0;
    luasPlywood.value = 0.0;
    volumeHardwood.value = 0.0;
    volumePlywood.value = 0.0;
    listVolumeHardwood.clear();
    subTotalHardwood.clear();
    listLuaslHardwood.clear();
    listVolumePlywood.clear();
    subTotalPlywood.clear();
    listLuasPlywood.clear();
    totalLuasPermukaan.value = 0.0;
    totalBahanBaku.value = 0.0;

    bahanBakuHardwood(detailBahanBaku);
    bahanBakuPlywood(detailBahanBaku);
    bahanBakuTotal();
  }

  bahanBakuHardwood(var detailBahanBaku) async{
    if (detailBahanBaku.analisaHardwood!.isNotEmpty) {
      for (int i = 0; i < detailBahanBaku.analisaHardwood!.length; i++) {
        hardwoodVolume(i, detailBahanBaku);
        if (detailBahanBaku.analisaHardwood![i].namaTipeSisi.toString() == "4 Sisi (2TL + 2WL)") {
          double tPlusW = (double.parse(detailBahanBaku.analisaHardwood![i].tFinal.toString()) + 
          double.parse(detailBahanBaku.analisaHardwood![i].wFinal.toString()));
          double luas = (tPlusW * 2 * double.parse(detailBahanBaku.analisaHardwood![i].qtyFinal.toString()) * 
          double.parse(detailBahanBaku.analisaHardwood![i].lFinal.toString()))/10000;
          listLuaslHardwood.add(luas.toString());
          luasHardwood.value = luasHardwood.value + luas;
        } else if (detailBahanBaku.analisaHardwood![i].namaTipeSisi.toString() == "3 Sisi Opsi 1 (2TL + WL)") {
          double tPlusWPlusT = (double.parse(detailBahanBaku.analisaHardwood![i].tFinal.toString()) + double.parse(detailBahanBaku.analisaHardwood![i].wFinal.toString()) + double.parse(detailBahanBaku.analisaHardwood![i].tFinal.toString()));
          double luas = (tPlusWPlusT * double.parse(detailBahanBaku.analisaHardwood![i].qtyFinal.toString()) * double.parse(detailBahanBaku.analisaHardwood![i].lFinal.toString()))/10000;
          listLuaslHardwood.add(luas.toString());
          luasHardwood.value = luasHardwood.value + luas;
        } else if (detailBahanBaku.analisaHardwood![i].namaTipeSisi.toString() == "3 Sisi Opsi 2 (TL + 2WL)") {
          double tPlusWPlusW = (double.parse(detailBahanBaku.analisaHardwood![i].tFinal.toString()) + double.parse(detailBahanBaku.analisaHardwood![i].wFinal.toString()) + double.parse(detailBahanBaku.analisaHardwood![i].wFinal.toString()));
          double luas = (tPlusWPlusW * double.parse(detailBahanBaku.analisaHardwood![i].qtyFinal.toString()) * double.parse(detailBahanBaku.analisaHardwood![i].lFinal.toString()))/10000;
          listLuaslHardwood.add(luas.toString());
          luasHardwood.value = luasHardwood.value + luas;
        } else if (detailBahanBaku.analisaHardwood![i].namaTipeSisi.toString() == "2 Sisi Opsi 1 (TL + WL)") {
          double tPlusW = (double.parse(detailBahanBaku.analisaHardwood![i].tFinal.toString()) + double.parse(detailBahanBaku.analisaHardwood![i].wFinal.toString()));
          double luas = (tPlusW * double.parse(detailBahanBaku.analisaHardwood![i].qtyFinal.toString()) * double.parse(detailBahanBaku.analisaHardwood![i].lFinal.toString()))/10000;
          listLuaslHardwood.add(luas.toString());
          luasHardwood.value = luasHardwood.value + luas;
        } else if (detailBahanBaku.analisaHardwood![i].namaTipeSisi.toString() == "2 Sisi Opsi 2 (2TL)") {
          double tPlusT = (double.parse(detailBahanBaku.analisaHardwood![i].tFinal.toString()) + double.parse(detailBahanBaku.analisaHardwood![i].tFinal.toString()));
          double luas = (tPlusT * double.parse(detailBahanBaku.analisaHardwood![i].qtyFinal.toString()) * double.parse(detailBahanBaku.analisaHardwood![i].lFinal.toString()))/10000;
          listLuaslHardwood.add(luas.toString());
          luasHardwood.value = luasHardwood.value + luas;
        } else if (detailBahanBaku.analisaHardwood![i].namaTipeSisi.toString() == "2 Sisi Opsi 3 (2WL)") {
          double wPlusW = (double.parse(detailBahanBaku.analisaHardwood![i].wFinal.toString()) + double.parse(detailBahanBaku.analisaHardwood![i].wFinal.toString()));
          double luas = (wPlusW * double.parse(detailBahanBaku.analisaHardwood![i].qtyFinal.toString()) * double.parse(detailBahanBaku.analisaHardwood![i].lFinal.toString()))/10000;
          listLuaslHardwood.add(luas.toString());
          luasHardwood.value = luasHardwood.value + luas;
        } else if (detailBahanBaku.analisaHardwood![i].namaTipeSisi.toString() == "1 Sisi Opsi 1 (TL)") {
          double luas = (double.parse(detailBahanBaku.analisaHardwood![i].tFinal.toString()) * double.parse(detailBahanBaku.analisaHardwood![i].qtyFinal.toString()) * double.parse(detailBahanBaku.analisaHardwood![i].lFinal.toString()))/10000;
          listLuaslHardwood.add(luas.toString());
          luasHardwood.value = luasHardwood.value + luas;
        } else if (detailBahanBaku.analisaHardwood![i].namaTipeSisi.toString() == "1 Sisi Opsi 2 (WL)") {
          double luas = (double.parse(detailBahanBaku.analisaHardwood![i].wFinal.toString()) * double.parse(detailBahanBaku.analisaHardwood![i].qtyFinal.toString()) * double.parse(detailBahanBaku.analisaHardwood![i].lFinal.toString()))/10000;
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

  hardwoodVolume(int i, var detailBahanBaku){
    double volume = (double.parse(detailBahanBaku.analisaHardwood![i].tRaw.toString()) * 
      double.parse(detailBahanBaku.analisaHardwood![i].wRaw.toString()) * 
      double.parse(detailBahanBaku.analisaHardwood![i].lRaw.toString()) * 
      double.parse(detailBahanBaku.analisaHardwood![i].qtyRaw.toString()))/1000000;
    volumeHardwood.value = volumeHardwood.value + volume;
    listVolumeHardwood.add(volume.toString());
    double subTotal = volume * double.parse(detailBahanBaku.analisaHardwood![i].hargaSatuan.toString()) * 
      double.parse(detailBahanBaku.analisaHardwood![i].koefisien.toString());//dirubah
    subTotalHardwood.add(subTotal.toString());
    totalHardwood.value = totalHardwood.value + subTotal.round();
  }

  bahanBakuPlywood(var detailBahanBaku) async{
    if (detailBahanBaku.analisaPlywood!.isNotEmpty) {
      for (var i = 0; i < detailBahanBaku.analisaPlywood!.length; i++) {
        plywoodVolume(i, detailBahanBaku);
        if (detailBahanBaku.analisaPlywood![i].namaTipeSisi.toString() == "4 Sisi (2TL + 2WL)") {
          double tPlusW = (double.parse(detailBahanBaku.analisaPlywood![i].tRaw.toString()) + double.parse(detailBahanBaku.analisaPlywood![i].wRaw.toString()));
          double luas = (tPlusW * 2 * double.parse(detailBahanBaku.analisaPlywood![i].qtyRaw.toString()) * double.parse(detailBahanBaku.analisaPlywood![i].lRaw.toString()))/10000;
          listLuasPlywood.add(luas.toString());
          luasPlywood.value = luasPlywood.value + luas;
        } else if (detailBahanBaku.analisaPlywood![i].namaTipeSisi.toString() == "3 Sisi Opsi 1 (2TL + WL)") {
          double tPlusWPlusT = (double.parse(detailBahanBaku.analisaPlywood![i].tRaw.toString()) + double.parse(detailBahanBaku.analisaPlywood![i].wRaw.toString()) + double.parse(detailBahanBaku.analisaPlywood![i].tRaw.toString()));
          double luas = (tPlusWPlusT * double.parse(detailBahanBaku.analisaPlywood![i].qtyRaw.toString()) * double.parse(detailBahanBaku.analisaPlywood![i].lRaw.toString()))/10000;
          listLuasPlywood.add(luas.toString());
          luasPlywood.value = luasPlywood.value + luas;
        } else if (detailBahanBaku.analisaPlywood![i].namaTipeSisi.toString() == "3 Sisi Opsi 2 (TL + 2WL)") {
          double tPlusWPlusW = (double.parse(detailBahanBaku.analisaPlywood![i].tRaw.toString()) + double.parse(detailBahanBaku.analisaPlywood![i].wRaw.toString()) + double.parse(detailBahanBaku.analisaPlywood![i].wRaw.toString()));
          double luas = (tPlusWPlusW * double.parse(detailBahanBaku.analisaPlywood![i].qtyRaw.toString()) * double.parse(detailBahanBaku.analisaPlywood![i].lRaw.toString()))/10000;
          listLuasPlywood.add(luas.toString());
          luasPlywood.value = luasPlywood.value + luas;
        } else if (detailBahanBaku.analisaPlywood![i].namaTipeSisi.toString() == "2 Sisi Opsi 1 (TL + WL)") {
          double tPlusW = (double.parse(detailBahanBaku.analisaPlywood![i].tRaw.toString()) + double.parse(detailBahanBaku.analisaPlywood![i].wRaw.toString()));
          double luas = (tPlusW * double.parse(detailBahanBaku.analisaPlywood![i].qtyRaw.toString()) * double.parse(detailBahanBaku.analisaPlywood![i].lRaw.toString()))/10000;
          listLuasPlywood.add(luas.toString());
          luasPlywood.value = luasPlywood.value + luas;
        } else if (detailBahanBaku.analisaPlywood![i].namaTipeSisi.toString() == "2 Sisi Opsi 2 (2TL)") {
          double tPlusT = (double.parse(detailBahanBaku.analisaPlywood![i].tRaw.toString()) + double.parse(detailBahanBaku.analisaPlywood![i].tRaw.toString()));
          double luas = (tPlusT * double.parse(detailBahanBaku.analisaPlywood![i].qtyRaw.toString()) * double.parse(detailBahanBaku.analisaPlywood![i].lRaw.toString()))/10000;
          listLuasPlywood.add(luas.toString());
          luasPlywood.value = luasPlywood.value + luas;
        } else if (detailBahanBaku.analisaPlywood![i].namaTipeSisi.toString() == "2 Sisi Opsi 3 (2WL)") {
          double wPlusW = (double.parse(detailBahanBaku.analisaPlywood![i].wRaw.toString()) + double.parse(detailBahanBaku.analisaPlywood![i].wRaw.toString()));
          double luas = (wPlusW * double.parse(detailBahanBaku.analisaPlywood![i].qtyRaw.toString()) * double.parse(detailBahanBaku.analisaPlywood![i].lRaw.toString()))/10000;
          listLuasPlywood.add(luas.toString());
          luasPlywood.value = luasPlywood.value + luas;
        } else if (detailBahanBaku.analisaPlywood![i].namaTipeSisi.toString() == "1 Sisi Opsi 1 (TL)") {
          double luas = (double.parse(detailBahanBaku.analisaPlywood![i].tRaw.toString()) * double.parse(detailBahanBaku.analisaPlywood![i].qtyRaw.toString()) * double.parse(detailBahanBaku.analisaPlywood![i].lRaw.toString()))/10000;
          listLuasPlywood.add(luas.toString());
          luasPlywood.value = luasPlywood.value + luas;
        } else if (detailBahanBaku.analisaPlywood![i].namaTipeSisi.toString() == "1 Sisi Opsi 2 (WL)") {
          double luas = (double.parse(detailBahanBaku.analisaPlywood![i].wRaw.toString()) * double.parse(detailBahanBaku.analisaPlywood![i].qtyRaw.toString()) * double.parse(detailBahanBaku.analisaPlywood![i].lRaw.toString()))/10000;
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

  plywoodVolume(int i, var detailBahanBaku){
    double volume = (double.parse(detailBahanBaku.analisaPlywood![i].tRaw.toString()) * double.parse(detailBahanBaku.analisaPlywood![i].wRaw.toString()) * double.parse(detailBahanBaku.analisaPlywood![i].lRaw.toString()) * double.parse(detailBahanBaku.analisaPlywood![i].qtyRaw.toString()))/1000000;
    volumePlywood.value = volumePlywood.value + volume;
    listVolumePlywood.add(volume.toString());
    double subTotal = double.parse(detailBahanBaku.analisaPlywood![i].hargaSatuan.toString()) * double.parse(detailBahanBaku.analisaPlywood![i].koefisien.toString()) * double.parse(detailBahanBaku.analisaPlywood![i].qtyRaw.toString());//dirubah
    subTotalPlywood.add(subTotal.toString());
    totalPlywood.value = totalPlywood.value + subTotal.round();
  }

  bahanBakuTotal() async{
    if(totalBahanBaku.value == 0.0){
      grandTotalHardwood.value = totalHardwood.value.toString();
      totalLuasHardwood.value = luasHardwood.value.toString();
      totalVolumeHardwood.value = volumeHardwood.value.toString();
      grandTotalPlywood.value = totalPlywood.value.toString();
      totalLuasPlywood.value = luasPlywood.value.toString();
      totalVolumePlywood.value = volumePlywood.value.toString();
      
      totalLuasPermukaan.value = luasHardwood.value + luasPlywood.value;
      totalBahanBaku.value = totalHardwood.value + totalPlywood.value;
    }
  }
}
                  
                  

                  