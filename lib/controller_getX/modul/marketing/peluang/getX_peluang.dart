import 'package:get/get.dart';

class GetxAnalisaPeluang extends GetxController{
  late var totals = 0.0.obs;
  late var totalSummaryBiaya = <String>[].obs;

  analisaPeluang(double totalFinishing, double totalBahanBaku, double totalPenunjangProduksi) async{
    totals.value = totalFinishing + totalBahanBaku + totalPenunjangProduksi;
    totalSummaryBiaya = [totalBahanBaku.toString(), totalPenunjangProduksi.toString(), totalFinishing.toString()].obs;
  }
}


