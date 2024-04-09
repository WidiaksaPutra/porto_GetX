import 'package:get/get.dart';

class GetxBiayaOverheadKantor extends GetxController{
  late var unitPrice = 0.0.obs;
  late var subTotalBiayaOverheadKantor = <String>[].obs;
  late var totalBiayaOverheadKantor = "0.0".obs;
  

  biayaOverheadKantor(var detailBiayaOverheadKantor, double totalAnalisaBahanBaku, double totalAnalisaPenunjanProduksi, double totalAnalisaFinishing, double totalAnalisaAlatBantuOnSite, double totalAnalisaLabourCostOnSite){
    // print(totalAnalisaLabourCostOnSite);
    double totalBiaya = 0.0;
    double subTotal = 0.0;
    unitPrice.value = 0.0;
    totalBiayaOverheadKantor.value = "0.0";
    subTotalBiayaOverheadKantor.clear();
    unitPrice.value = double.parse(totalAnalisaBahanBaku.toString()) + double.parse(totalAnalisaPenunjanProduksi.toString()) + double.parse(totalAnalisaFinishing.toString()) + double.parse(totalAnalisaAlatBantuOnSite.toString()) + double.parse(totalAnalisaLabourCostOnSite.toString());
    if (detailBiayaOverheadKantor.analisaBiayaOverheadKantor!.isNotEmpty) {
      for (int i = 0; i < detailBiayaOverheadKantor.analisaBiayaOverheadKantor!.length; i++) {
        subTotal = double.parse(detailBiayaOverheadKantor.analisaBiayaOverheadKantor![i].qty.toString()) * unitPrice.value * double.parse(detailBiayaOverheadKantor.analisaBiayaOverheadKantor![i].konstanta.toString());
        subTotalBiayaOverheadKantor.add(subTotal.toString());
        totalBiaya = totalBiaya + subTotal;
        // print(subTotal);
        // print(totalBiaya);
      }
    }
    // print(unitPrice.value.round());
    totalBiayaOverheadKantor.value = totalBiaya.toString();
    
  }
}