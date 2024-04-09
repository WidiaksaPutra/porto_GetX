import 'package:get/get.dart';

class GetxAnalisaPeluangPenunjang extends GetxController{
  late var subTotalFactorySupply = <String>[].obs;
  late var subTotalLabourCost = <String>[].obs;
  late var subTotalMachineProcess = <String>[].obs;
  late var subTotalBiayaOverhead = <String>[].obs;
  late var grandTotalFactorySupply = "0.0".obs;
  late var grandTotalLabourCost = "0.0".obs;
  late var grandTotalMachineProcess = "0.0".obs;
  late var grandTotalBiayaOverhead = "0.0".obs;

  late var totalPenunjangProduksi = 0.0.obs;

  analisaPenunjang(var detailPenunjangProduksi){
    analisaFinTpFs(detailPenunjangProduksi);  
    analisaFinTpLc(detailPenunjangProduksi);
    analisaFinTpMp(detailPenunjangProduksi);   
    analisaFinTpBop(detailPenunjangProduksi);
    penunjangTotal();
  }

  analisaFinTpFs(var detailPenunjangProduksi){
    double totalFactorySupply = 0.0;
    if (detailPenunjangProduksi.analisaFinTpFs!.isNotEmpty) {
      for (var i = 0; i < detailPenunjangProduksi.analisaFinTpFs!.length; i++) {
        double subTotal = double.parse(detailPenunjangProduksi.analisaFinTpFs![i].qty.toString()) * double.parse(detailPenunjangProduksi.analisaFinTpFs![i].hargaSatuan.toString()) * double.parse(detailPenunjangProduksi.analisaFinTpFs![i].koefisien.toString());
        subTotalFactorySupply.add(subTotal.toString());
        totalFactorySupply = totalFactorySupply + subTotal.round();
      }
    }
    grandTotalFactorySupply.value = totalFactorySupply.toString();    
  }

  analisaFinTpLc(var detailPenunjangProduksi){
    double totalLabourCost = 0.0;
    if (detailPenunjangProduksi.analisaFinTpLc!.isNotEmpty) {
      for (var i = 0; i < detailPenunjangProduksi.analisaFinTpLc!.length; i++) {
        double subTotal = double.parse(detailPenunjangProduksi.analisaFinTpLc![i].qty.toString()) * double.parse(detailPenunjangProduksi.analisaFinTpLc![i].hargaSatuan.toString()) * double.parse(detailPenunjangProduksi.analisaFinTpLc![i].koefisien.toString());
        subTotalLabourCost.add(subTotal.toString());
        totalLabourCost = totalLabourCost + subTotal.round();
      }
    }
    grandTotalLabourCost.value = totalLabourCost.toString();
  }
  
  analisaFinTpMp(var detailPenunjangProduksi){
    double totalMachineProcess = 0.0;
    if (detailPenunjangProduksi.analisaFinTpMp!.isNotEmpty) {
      for (var i = 0; i < detailPenunjangProduksi.analisaFinTpMp!.length; i++) {
        double subTotal = double.parse(detailPenunjangProduksi.analisaFinTpMp![i].qty.toString()) * double.parse(detailPenunjangProduksi.analisaFinTpMp![i].hargaSatuan.toString()) * double.parse(detailPenunjangProduksi.analisaFinTpMp![i].koefisien.toString());
        subTotalMachineProcess.add(subTotal.toString());
        totalMachineProcess = totalMachineProcess + subTotal.round();
      }
    }
    grandTotalMachineProcess.value = totalMachineProcess.toString();
  }

  analisaFinTpBop(var detailPenunjangProduksi){
    double totalBiayaOverhead = 0.0;
    if (detailPenunjangProduksi.analisaFinTpBop!.isNotEmpty) {
      for (var i = 0; i < detailPenunjangProduksi.analisaFinTpBop!.length; i++) {
        double subTotal = double.parse(detailPenunjangProduksi.analisaFinTpBop![i].qty.toString()) * double.parse(detailPenunjangProduksi.analisaFinTpBop![i].hargaSatuan.toString()) * double.parse(detailPenunjangProduksi.analisaFinTpBop![i].koefisien.toString());
        subTotalBiayaOverhead.add(subTotal.toString());
        totalBiayaOverhead = totalBiayaOverhead + subTotal.round();
      }
    }
    grandTotalBiayaOverhead.value = totalBiayaOverhead.toString();
  }

  penunjangTotal(){
    if(totalPenunjangProduksi.value == 0.0){
      totalPenunjangProduksi.value = double.parse(grandTotalFactorySupply.value.toString()) + double.parse(grandTotalLabourCost.value.toString()) + double.parse(grandTotalMachineProcess.value.toString()) + double.parse(grandTotalBiayaOverhead.value.toString());
    }
  }
}