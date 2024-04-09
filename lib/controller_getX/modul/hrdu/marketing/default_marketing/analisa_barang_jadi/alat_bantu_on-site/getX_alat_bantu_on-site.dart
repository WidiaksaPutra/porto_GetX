import 'package:get/get.dart';

class GetxAlatBantuOnSite extends GetxController{
  late var totalHardwood = 0.0.obs;
  late var totalPlywood = 0.0.obs;
  late var unitPriceAlatBantuOnSite = 0.0.obs;
  late var subTotalPrice = <String>[].obs;
  late var totalAlatBantuOnSite = 0.0.obs;

  alatBantuOnSite(var detailAlatBantuOnSite){
    hardwoodUnit(detailAlatBantuOnSite);
    plywoodUnit(detailAlatBantuOnSite);
    analisaAlatBantuOnsite(detailAlatBantuOnSite);
  }

  hardwoodUnit(var detailAlatBantuOnSite){
    totalHardwood.value = 0.0;
    if (detailAlatBantuOnSite.analisaHardwood!.isNotEmpty) {
      for (int i = 0; i < detailAlatBantuOnSite.analisaHardwood!.length; i++) {
        double countTotalUnit = ((double.parse(detailAlatBantuOnSite.analisaHardwood![i].qtyRaw.toString()) 
        * double.parse(detailAlatBantuOnSite.analisaHardwood![i].tRaw.toString()) 
        * double.parse(detailAlatBantuOnSite.analisaHardwood![i].wRaw.toString()) 
        * double.parse(detailAlatBantuOnSite.analisaHardwood![i].lRaw.toString())) / 1000000);
        double totalUnit = (countTotalUnit < 0.000001) ? 0.000001 : countTotalUnit;
        double totalPrice = totalUnit * (double.parse(detailAlatBantuOnSite.analisaHardwood![i].unitPrice.toString()) 
        * double.parse(detailAlatBantuOnSite.analisaHardwood![i].konstanta.toString()));
        totalHardwood.value = totalHardwood.value + totalPrice.round();
      }
    }
  }

  plywoodUnit(var detailAlatBantuOnSite){
    totalPlywood.value = 0.0;
    if (detailAlatBantuOnSite.analisaPlywood!.isNotEmpty) {
      for (var i = 0; i < detailAlatBantuOnSite.analisaPlywood!.length; i++) {
        double total = (double.parse(detailAlatBantuOnSite.analisaPlywood![i].qtyRaw.toString()) 
        * double.parse(detailAlatBantuOnSite.analisaPlywood![i].unitPrice.toString()) 
        * double.parse(detailAlatBantuOnSite.analisaPlywood![i].konstanta.toString()));
        totalPlywood.value = totalPlywood.value + total.round();
      }
    }
  }

  analisaAlatBantuOnsite(var detailAlatBantuOnSite){
    totalAlatBantuOnSite.value = 0.0;
    unitPriceAlatBantuOnSite.value = 0.0;
    subTotalPrice.clear();
    unitPriceAlatBantuOnSite.value = totalHardwood.value + totalPlywood.value;
    if (detailAlatBantuOnSite.analisaAlatBantuOnsite!.isNotEmpty) {
      for (var i = 0; i < detailAlatBantuOnSite.analisaAlatBantuOnsite!.length; i++) {
        double totalPrice = unitPriceAlatBantuOnSite.value.round() * 
        double.parse(detailAlatBantuOnSite.analisaAlatBantuOnsite![i].qty.toString()) * 
        double.parse(detailAlatBantuOnSite.analisaAlatBantuOnsite![i].konstanta.toString());
        subTotalPrice.add(totalPrice.toString());
        totalAlatBantuOnSite.value = totalAlatBantuOnSite.value + totalPrice;
      }
    }
  }
}