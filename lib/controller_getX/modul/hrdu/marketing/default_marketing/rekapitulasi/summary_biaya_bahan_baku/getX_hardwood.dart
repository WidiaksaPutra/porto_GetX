import 'package:get/get.dart';

class GetxHardwood extends GetxController{
  late var totalHardwood = 0.0.obs;
  late var luasHardwood = 0.0.obs;
  late var volumeHardwood = 0.0.obs;
  late var listVolumeHardwood = <String>[].obs;
  late var subTotalHardwood = <String>[].obs;
  late var subVolumeHardwood = <String>[].obs;
  late var listLuaslHardwood = <String>[].obs;

  late var grandTotalHardwood = "0.0".obs;
  late var totalLuasHardwood = "0.0".obs;
  late var totalVolumeHardwood = "0.0".obs;

  late var totalLuasPermukaan = 0.0.obs;

  late final listSubTotalHardwood;
  late final listSubVolumeHardwood;
  late final listSubLuaslHardwood;

  hardwoodDetail(var detailHardWood){
    totalHardwood.value = 0.0;
    luasHardwood.value = 0.0;
    volumeHardwood.value = 0.0;
    listVolumeHardwood.clear();
    subTotalHardwood.clear();
    listLuaslHardwood.clear();
    totalLuasPermukaan.value = 0.0;

    bahanBakuHardwood(detailHardWood);
    hardwoodTotal();
  }

  bahanBakuHardwood(var detailHardwood) async{
    int lengRekapitulasi = detailHardwood.data.length;
    listSubTotalHardwood = List.generate(lengRekapitulasi, (_) => []).obs;
    listSubVolumeHardwood = List.generate(lengRekapitulasi, (_) => []).obs;
    listSubLuaslHardwood = List.generate(lengRekapitulasi, (_) => []).obs;

    for(int i = 0 ; i < lengRekapitulasi; i++){
      if (detailHardwood.data[i].analisaHardwood!.isNotEmpty) {
        for (int j = 0; j < detailHardwood.data[i].analisaHardwood!.length; j++) {
          hardwoodVolume(i, j, detailHardwood);
          if (detailHardwood.data[i].analisaHardwood![j].namaTipeSisi.toString() == "4 Sisi (2TL + 2WL)") {
            double tPlusW = (double.parse(detailHardwood.data[i].analisaHardwood![j].tFinal.toString()) + 
            double.parse(detailHardwood.data[i].analisaHardwood![j].wFinal.toString()));
            double luas = (tPlusW * 2 * double.parse(detailHardwood.data[i].analisaHardwood![j].qtyFinal.toString()) * 
            double.parse(detailHardwood.data[i].analisaHardwood![j].lFinal.toString()))/10000;
            listLuaslHardwood.add(luas.toString());
            luasHardwood.value = luasHardwood.value + luas;
          } else if (detailHardwood.data[i].analisaHardwood![j].namaTipeSisi.toString() == "3 Sisi Opsi 1 (2TL + WL)") {
            double tPlusWPlusT = (double.parse(detailHardwood.data[i].analisaHardwood![j].tFinal.toString()) + double.parse(detailHardwood.data[i].analisaHardwood![j].wFinal.toString()) + double.parse(detailHardwood.data[i].analisaHardwood![j].tFinal.toString()));
            double luas = (tPlusWPlusT * double.parse(detailHardwood.data[i].analisaHardwood![j].qtyFinal.toString()) * double.parse(detailHardwood.data[i].analisaHardwood![j].lFinal.toString()))/10000;
            listLuaslHardwood.add(luas.toString());
            luasHardwood.value = luasHardwood.value + luas;
          } else if (detailHardwood.data[i].analisaHardwood![j].namaTipeSisi.toString() == "3 Sisi Opsi 2 (TL + 2WL)") {
            double tPlusWPlusW = (double.parse(detailHardwood.data[i].analisaHardwood![j].tFinal.toString()) + double.parse(detailHardwood.data[i].analisaHardwood![j].wFinal.toString()) + double.parse(detailHardwood.data[i].analisaHardwood![j].wFinal.toString()));
            double luas = (tPlusWPlusW * double.parse(detailHardwood.data[i].analisaHardwood![j].qtyFinal.toString()) * double.parse(detailHardwood.data[i].analisaHardwood![j].lFinal.toString()))/10000;
            listLuaslHardwood.add(luas.toString());
            luasHardwood.value = luasHardwood.value + luas;
          } else if (detailHardwood.data[i].analisaHardwood![j].namaTipeSisi.toString() == "2 Sisi Opsi 1 (TL + WL)") {
            double tPlusW = (double.parse(detailHardwood.data[i].analisaHardwood![j].tFinal.toString()) + double.parse(detailHardwood.data[i].analisaHardwood![j].wFinal.toString()));
            double luas = (tPlusW * double.parse(detailHardwood.data[i].analisaHardwood![j].qtyFinal.toString()) * double.parse(detailHardwood.data[i].analisaHardwood![j].lFinal.toString()))/10000;
            listLuaslHardwood.add(luas.toString());
            luasHardwood.value = luasHardwood.value + luas;
          } else if (detailHardwood.data[i].analisaHardwood![j].namaTipeSisi.toString() == "2 Sisi Opsi 2 (2TL)") {
            double tPlusT = (double.parse(detailHardwood.data[i].analisaHardwood![j].tFinal.toString()) + double.parse(detailHardwood.data[i].analisaHardwood![j].tFinal.toString()));
            double luas = (tPlusT * double.parse(detailHardwood.data[i].analisaHardwood![j].qtyFinal.toString()) * double.parse(detailHardwood.data[i].analisaHardwood![j].lFinal.toString()))/10000;
            listLuaslHardwood.add(luas.toString());
            luasHardwood.value = luasHardwood.value + luas;
          } else if (detailHardwood.data[i].analisaHardwood![j].namaTipeSisi.toString() == "2 Sisi Opsi 3 (2WL)") {
            double wPlusW = (double.parse(detailHardwood.data[i].analisaHardwood![j].wFinal.toString()) + double.parse(detailHardwood.data[i].analisaHardwood![j].wFinal.toString()));
            double luas = (wPlusW * double.parse(detailHardwood.data[i].analisaHardwood![j].qtyFinal.toString()) * double.parse(detailHardwood.data[i].analisaHardwood![j].lFinal.toString()))/10000;
            listLuaslHardwood.add(luas.toString());
            luasHardwood.value = luasHardwood.value + luas;
          } else if (detailHardwood.data[i].analisaHardwood![j].namaTipeSisi.toString() == "1 Sisi Opsi 1 (TL)") {
            double luas = (double.parse(detailHardwood.data[i].analisaHardwood![j].tFinal.toString()) * double.parse(detailHardwood.data[i].analisaHardwood![j].qtyFinal.toString()) * double.parse(detailHardwood.data[i].analisaHardwood![j].lFinal.toString()))/10000;
            listLuaslHardwood.add(luas.toString());
            luasHardwood.value = luasHardwood.value + luas;
          } else if (detailHardwood.data[i].analisaHardwood![j].namaTipeSisi.toString() == "1 Sisi Opsi 2 (WL)") {
            double luas = (double.parse(detailHardwood.data[i].analisaHardwood![j].wFinal.toString()) * double.parse(detailHardwood.data[i].analisaHardwood![j].qtyFinal.toString()) * double.parse(detailHardwood.data[i].analisaHardwood![j].lFinal.toString()))/10000;
            listLuaslHardwood.add(luas.toString());
            luasHardwood.value = luasHardwood.value + luas;
          } else {
            double luas = 0;
            listLuaslHardwood.add(luas.toString());
            luasHardwood.value = luasHardwood.value + luas;
          }
        }
      }
      
      listSubTotalHardwood[i].addAll(subTotalHardwood);
      listSubVolumeHardwood[i].addAll(subVolumeHardwood);
      listSubLuaslHardwood[i].addAll(listLuaslHardwood);

      subTotalHardwood.clear();
      subVolumeHardwood.clear();
      listLuaslHardwood.clear();
    }
  }

  hardwoodVolume(int i, int j, var detailHardwood){
    double volume = (double.parse(detailHardwood.data[i].analisaHardwood![j].tRaw.toString()) * double.parse(detailHardwood.data[i].analisaHardwood![j].wRaw.toString()) * double.parse(detailHardwood.data[i].analisaHardwood![j].lRaw.toString()) * double.parse(detailHardwood.data[i].analisaHardwood![j].qtyRaw.toString()))/1000000;
    volume = (volume < 0.000001) ? 0.000001 : volume;
    volumeHardwood.value = volumeHardwood.value + volume;
    subVolumeHardwood.add(volume.toString());
    double subTotal = volume * double.parse(detailHardwood.data[i].analisaHardwood![j].hargaSatuan.toString()) * double.parse(detailHardwood.data[i].analisaHardwood![j].konstanta.toString());
    subTotalHardwood.add(subTotal.toString());
    totalHardwood.value = totalHardwood.value + subTotal.round();
  }

  hardwoodTotal() async{
    grandTotalHardwood.value = totalHardwood.value.roundToDouble().toString();
    totalLuasHardwood.value = luasHardwood.value.toString();
    totalVolumeHardwood.value = volumeHardwood.value.toString();
  }
}
                  
                  

                  