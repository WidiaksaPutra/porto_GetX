import 'package:get/get.dart';

class GetxAnalisaRae extends GetxController{
  late var totals = 0.0.obs;
  late var totalSummaryBiaya = <String>[].obs;

  analisaRae(
    double totalBahanBaku, 
    double totalPenunjangProduksi, 
    double totalFinishing, 
    double totalAlatBantuOnSite, 
    double totalLabourCostOnSite, 
    double totalBiayaOverheadKantor){
    totals.value = 0.0;
    totalSummaryBiaya.clear();
    totals.value = totalBahanBaku + totalPenunjangProduksi + totalFinishing + totalAlatBantuOnSite + totalLabourCostOnSite + totalBiayaOverheadKantor;
    totalSummaryBiaya.add(totalBahanBaku.toString());
    totalSummaryBiaya.add(totalPenunjangProduksi.toString());
    totalSummaryBiaya.add(totalFinishing.toString());
    totalSummaryBiaya.add(totalAlatBantuOnSite.toString());
    totalSummaryBiaya.add(totalLabourCostOnSite.toString());
    totalSummaryBiaya.add(totalBiayaOverheadKantor.toString());
    //print(totalBiayaOverheadKantor.toString());
  }
}