import 'package:get/get.dart';

class GetxAnalisaPeluang extends GetxController{
  late var totals = 0.0.obs;
  late var totalSummaryBiaya = <String>[].obs;

  analisaPeluang(double totalFinishing, double totalBahanBaku, double totalPenunjangProduksi){
    totals.value = totalFinishing + totalBahanBaku + totalPenunjangProduksi;
    totalSummaryBiaya.add(totalBahanBaku.toString());
    totalSummaryBiaya.add(totalPenunjangProduksi.toString());
    totalSummaryBiaya.add(totalFinishing.toString());
  }
}


