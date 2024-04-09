import 'package:get/get.dart';

class GetxPlywood extends GetxController{
  late var totalPlywood = 0.0.obs;
  late var luasPlywood = 0.0.obs;
  late var volumePlywood = 0.0.obs;
  late var listVolumePlywood = <String>[].obs;
  late var subTotalPlywood = <String>[].obs;
  late var subVolumePlywood = <String>[].obs;
  late var listLuasPlywood = <String>[].obs;

  late var grandTotalPlywood = "0.0".obs;
  late var totalLuasPlywood = "0.0".obs;
  late var totalVolumePlywood = "0.0".obs;

  late var totalLuasPermukaan = 0.0.obs;

  late final listSubTotalPlywood;
  late final listSubVolumePlywood;
  late final listSubLuasPlywood;

  plywoodDetailRae(var detailPlywood) {
    totalPlywood.value = 0.0;
    luasPlywood.value = 0.0;
    volumePlywood.value = 0.0;
    totalLuasPermukaan.value = 0.0;

    plywoodDetail(detailPlywood);
    plywoodTotal();
  }

  plywoodDetail(var detailPlywood){
    int lengRekapitulasi = detailPlywood!.data.length;
    listSubTotalPlywood = List.generate(lengRekapitulasi, (_) => []).obs;
    listSubVolumePlywood = List.generate(lengRekapitulasi, (_) => []).obs;
    listSubLuasPlywood = List.generate(lengRekapitulasi, (_) => []).obs;

    for(int i = 0 ; i < lengRekapitulasi ; i++){
      if (detailPlywood.data[i].analisaPlywood!.isNotEmpty) {
        for (var j = 0; j < detailPlywood.data[i].analisaPlywood!.length; j++) {
          
          plywoodVolume(i, j, detailPlywood);
          if (detailPlywood.data[i].analisaPlywood![j].namaTipeSisi.toString() == "4 Sisi (2TL + 2WL)") {
            double tPlusW = (double.parse(detailPlywood.data[i].analisaPlywood![j].tFinal.toString()) + double.parse(detailPlywood.data[i].analisaPlywood![j].wFinal.toString()));
            double luas = (tPlusW * 2 * double.parse(detailPlywood.data[i].analisaPlywood![j].qtyFinal.toString()) * double.parse(detailPlywood.data[i].analisaPlywood![j].lFinal.toString()))/10000;
            listLuasPlywood.add(luas.toString());
            luasPlywood.value = luasPlywood.value + luas;
          } else if (detailPlywood.data[i].analisaPlywood![j].namaTipeSisi.toString() == "3 Sisi Opsi 1 (2TL + WL)") {
            double tPlusWPlusT = (double.parse(detailPlywood.data[i].analisaPlywood![j].tFinal.toString()) + double.parse(detailPlywood.data[i].analisaPlywood![j].wFinal.toString()) + double.parse(detailPlywood.data[i].analisaPlywood![j].tFinal.toString()));
            double luas = (tPlusWPlusT * double.parse(detailPlywood.data[i].analisaPlywood![j].qtyFinal.toString()) * double.parse(detailPlywood.data[i].analisaPlywood![j].lFinal.toString()))/10000;
            listLuasPlywood.add(luas.toString());
            luasPlywood.value = luasPlywood.value + luas;
          } else if (detailPlywood.data[i].analisaPlywood![j].namaTipeSisi.toString() == "3 Sisi Opsi 2 (TL + 2WL)") {
            double tPlusWPlusW = (double.parse(detailPlywood.data[i].analisaPlywood![j].tFinal.toString()) + double.parse(detailPlywood.data[i].analisaPlywood![j].wFinal.toString()) + double.parse(detailPlywood.data[i].analisaPlywood![j].wFinal.toString()));
            double luas = (tPlusWPlusW * double.parse(detailPlywood.data[i].analisaPlywood![j].qtyFinal.toString()) * double.parse(detailPlywood.data[i].analisaPlywood![j].lFinal.toString()))/10000;
            listLuasPlywood.add(luas.toString());
            luasPlywood.value = luasPlywood.value + luas;
          } else if (detailPlywood.data[i].analisaPlywood![j].namaTipeSisi.toString() == "2 Sisi Opsi 1 (TL + WL)") {
            double tPlusW = (double.parse(detailPlywood.data[i].analisaPlywood![j].tFinal.toString()) + double.parse(detailPlywood.data[i].analisaPlywood![j].wFinal.toString()));
            double luas = (tPlusW * double.parse(detailPlywood.data[i].analisaPlywood![j].qtyFinal.toString()) * double.parse(detailPlywood.data[i].analisaPlywood![j].lFinal.toString()))/10000;
            listLuasPlywood.add(luas.toString());
            luasPlywood.value = luasPlywood.value + luas;
          } else if (detailPlywood.data[i].analisaPlywood![j].namaTipeSisi.toString() == "2 Sisi Opsi 2 (2TL)") {
            double tPlusT = (double.parse(detailPlywood.data[i].analisaPlywood![j].tFinal.toString()) + double.parse(detailPlywood.data[i].analisaPlywood![j].tFinal.toString()));
            double luas = (tPlusT * double.parse(detailPlywood.data[i].analisaPlywood![j].qtyFinal.toString()) * double.parse(detailPlywood.data[i].analisaPlywood![j].lFinal.toString()))/10000;
            listLuasPlywood.add(luas.toString());
            luasPlywood.value = luasPlywood.value + luas;
          } else if (detailPlywood.data[i].analisaPlywood![j].namaTipeSisi.toString() == "2 Sisi Opsi 3 (2WL)") {
            double wPlusW = (double.parse(detailPlywood.data[i].analisaPlywood![j].wFinal.toString()) + double.parse(detailPlywood.data[i].analisaPlywood![j].wFinal.toString()));
            double luas = (wPlusW * double.parse(detailPlywood.data[i].analisaPlywood![j].qtyFinal.toString()) * double.parse(detailPlywood.data[i].analisaPlywood![j].lFinal.toString()))/10000;
            listLuasPlywood.add(luas.toString());
            luasPlywood.value = luasPlywood.value + luas;
          } else if (detailPlywood.data[i].analisaPlywood![j].namaTipeSisi.toString() == "1 Sisi Opsi 1 (TL)") {
            double luas = (double.parse(detailPlywood.data[i].analisaPlywood![j].tFinal.toString()) * double.parse(detailPlywood.data[i].analisaPlywood![j].qtyFinal.toString()) * double.parse(detailPlywood.data[i].analisaPlywood![j].lFinal.toString()))/10000;
            listLuasPlywood.add(luas.toString());
            luasPlywood.value = luasPlywood.value + luas;
          } else if (detailPlywood.data[i].analisaPlywood![j].namaTipeSisi.toString() == "1 Sisi Opsi 2 (WL)") {
            double luas = (double.parse(detailPlywood.data[i].analisaPlywood![j].wFinal.toString()) * double.parse(detailPlywood.data[i].analisaPlywood![j].qtyFinal.toString()) * double.parse(detailPlywood.data[i].analisaPlywood![j].lFinal.toString()))/10000;
            listLuasPlywood.add(luas.toString());
            luasPlywood.value = luasPlywood.value + luas;
          } else {
            double luas = 0;
            listLuasPlywood.add(luas.toString());
            luasPlywood.value = luasPlywood.value + luas;
          }
        
        }
      }
      
      listSubTotalPlywood[i].addAll(subTotalPlywood);
      listSubVolumePlywood[i].addAll(listVolumePlywood);
      listSubLuasPlywood[i].addAll(listLuasPlywood);

      subTotalPlywood.clear();
      listVolumePlywood.clear();
      listLuasPlywood.clear();
      
    }
  }

  plywoodVolume(int i, int j, var detailPlywood){
    double volume = (double.parse(detailPlywood.data[i].analisaPlywood![j].tRaw.toString()) * double.parse(detailPlywood.data[i].analisaPlywood![j].wRaw.toString()) * double.parse(detailPlywood.data[i].analisaPlywood![j].lRaw.toString()) * double.parse(detailPlywood.data[i].analisaPlywood![j].qtyRaw.toString()))/1000000;
    volumePlywood.value = volumePlywood.value + volume;
    listVolumePlywood.add(volume.toString());
    double subTotal = double.parse(detailPlywood.data[i].analisaPlywood![j].unitPrice.toString()) * double.parse(detailPlywood.data[i].analisaPlywood![j].qtyRaw.toString());
    subTotalPlywood.add(subTotal.toString());
    totalPlywood.value = totalPlywood.value + subTotal.round();
  }

  plywoodTotal(){
    grandTotalPlywood.value = totalPlywood.value.toString();
    totalLuasPlywood.value = luasPlywood.value.toString();
    totalVolumePlywood.value = volumePlywood.value.toString();
  }
}
                  